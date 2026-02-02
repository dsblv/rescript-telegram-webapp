# rescript-telegram-webapp

> ReScript bindings for Telegram's client-side WebApp API.

Based on Telegram Bot API 9.1.

Official docs (worth keeping open in another tab):
[https://core.telegram.org/bots/webapps#initializing-mini-apps](https://core.telegram.org/bots/webapps#initializing-mini-apps)

API Reference: [API_REFERENCE.md](API_REFERENCE.md)

## Design goals

- No runtime overhead
- As close to 1:1 with original API
- Only encode what is documented

## Usage

Install the package via npm:

```bash
npm install rescript-telegram-webapp
```

In your `rescript.json`, add the dependency:

```diff
{
  "dependencies": [
+   "rescript-telegram-webapp"
  ]
}
```

As per [Telegram's documentation](https://core.telegram.org/bots/webapps#initializing-mini-apps), include the Telegram Web App script in your HTML:

```html
<script src="https://telegram.org/js/telegram-web-app.js?59"></script>
```

Get a reference to the `telegramWebApp` record in your ReScript code:

```rescript
open TelegramWebApp.Global
```

- Fields of `telegramWebApp` can be accessed directly, e.g. `telegramWebApp.initData`
- Methods are available in modules named after the objects in the original API, e.g. `TelegramWebApp.WebAppAPI`, `TelegramWebApp.MainButtonAPI`, etc.

```rescript
telegramWebApp->TelegramWebApp.WebAppAPI.ready
telegramWebApp.hapticFeedback->TelegramWebApp.HapticFeedbackAPI.impactOccurred(Medium)

telegramWebApp.mainButton.text = "Press me"
telegramWebApp.mainButton.isVisible = true
```

## Difference in APIs

### Applying methods

Object oriented APIs are modeled as record types, and functions that act on those records. For example:

```js
window.Telegram.WebApp.ready();
```

Becomes

```rescript
open TelegramWebApp.Global

TelegramWebApp.WebAppAPI.ready(telegramWebApp)
```

Or, using pipe operator:

```rescript
telegramWebApp->TelegramWebApp.WebAppAPI.ready
```

### All enumerable strings are Variants

It is now possible to switch on errors or statuses and expect exhaustiveness checking.

```rescript
open TelegramWebApp.Global
open TelegramWebApp.WebAppAPI

telegramWebApp
->openInvoice("invoice_12345", ~callback=status => {
  switch status {
  | Paid => Console.log("Paid")
  | Cancelled => Console.log("Cancelled")
  | Failed => Console.log("Failed")
  | Pending => Console.log("Pending")
  | UndocumentedStatus(value) => Console.log(value)
  }
})
```

Note the `UndocumentedStatus(value)` case, for compatibility with future additions to Bot API.

### A subscription method per event type

Every event has its dedicated `on<EventName>` and `off<EventName>` functions, to provide better type safety. For example, subscribing to the `fullscreenChanged` event looks like this:

```rescript
open TelegramWebApp.Global
open TelegramWebApp.WebAppAPI

let handleFullscreenChanged: Events.fullscreenChanged = event => {
  if event.isFullscreen {
    Console.log("Entered fullscreen")
  } else {
    Console.log("Exited fullscreen")
  }
}
telegramWebApp->onFullscreenChanged(handleFullscreenChanged)
telegramWebApp->offFullscreenChanged(handleFullscreenChanged)
```

WebAppAPI.Events contains type definitions for all event handler signatures.

### Submodules

In the original API, some methods are grouped into nested objects. For example, `Telegram.WebApp.MainButton`. In ReScript, the data structure is preserved, and the methods are grouped into modules. For example, accessing the main button's text is straightforward:

```rescript
open TelegramWebApp.Global

let mainButtonText = telegramWebApp.mainButton.text
```

And setting the main button's text looks like this:

```rescript
open TelegramWebApp.Global
open TelegramWebApp.MainButtonAPI

telegramWebApp.mainButton
->setText("New Button Text")
->ignore
```

Most of the submodule methods return the object they operate on, to allow method chaining. In ReScript, you can use `->ignore` to discard the return value when it's not needed.
