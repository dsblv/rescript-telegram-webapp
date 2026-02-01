# rescript-telegram-webapp

ReScript bindings for Telegram's client-side web apps, also referred to as miniapps.

Official docs (worth keeping open in another tab):
[https://core.telegram.org/bots/webapps#initializing-mini-apps](https://core.telegram.org/bots/webapps#initializing-mini-apps)

API Reference (generated from source):
[API_REFERENCE.md](API_REFERENCE.md)

## Design goals

- No runtime overhead
- As close to 1:1 with original API
- Only encode what is documented

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
open TelegramWebApp.Global

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

In the original API, some methods are grouped into submodules. For example, `Telegram.WebApp.MainButton`. In ReScript, the data structure is preserved, and the methods are grouped into modules. For example, accessing the main button's text is straightforward:

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

Note the use of `->ignore`. This is because `setText` returns the updated `MainButton` record, and ReScript requires to explicitly discard it if not used.
