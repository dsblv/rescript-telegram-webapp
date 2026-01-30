/**
 Refer to official docs https://core.telegram.org/bots/webapps#initializing-mini-apps
 for a full description of available fields and methods

 Use Global to access global API
 */
open TelegramWebApp.Global

/**
 Reading record fields
 */
Console.log2(telegramWebApp.version, telegramWebApp.platform)

/**
 Reading optional record fields
 */
let greeting = switch telegramWebApp.initDataUnsafe.chat {
| Some(chat) => "This is " + chat.title
| None => "No current chat"
}

/**
 Reading boolean flags
 */
if telegramWebApp.isActve && telegramWebApp.isExpanded {
  Console.log("Live and active")
}

/**
 Calling top level method
 */
telegramWebApp->TelegramWebApp.requestFullscreen

/**
 Subscribing to events
 */
let onFullscreenChange = () => {
  if telegramWebApp.isFullscreen {
    Console.log("Fullscreen on")
  } else {
    Console.log("Fullscreen off")
  }
}

telegramWebApp->TelegramWebApp.onFullscreenChanged(onFullscreenChange)
telegramWebApp->TelegramWebApp.offFullscreenChanged(onFullscreenChange)

/**
 Handling error events

 There's a Variant type per each error. Make sure to handle
 the `UndocumentedError(message)` case, for compatibility
 with future additions to Bot API
 */
let onShareMessageFailed: TelegramWebApp.Events.shareMessageFailed = event => {
  switch event.error {
  | Unsupported => Console.log("Sharing messages is not supported by client")
  | MessageExpired => Console.log("The message is expired")
  | MessageSendFailed => Console.log("Failed to send. Retry?")
  | UserDeclined => Console.log("Aborted by the user")
  | UnknownError => Console.log("Something mysterious")
  | UndocumentedError(message) => Console.log("Undocumented error: " + message)
  }
}

telegramWebApp->TelegramWebApp.onShareMessageFailed(onShareMessageFailed)
telegramWebApp->TelegramWebApp.offShareMessageFailed(onShareMessageFailed)

/**
 Submodules
 
 Represented as record types, and function to act
 upon those records
 */
if telegramWebApp.backButton.isVisible {
  Console.log("The back button is on")
}

/**
 All methods return their record, because the underlying
 APIs are designed chainable

 Use `->ignore` to tell type system you dont intend using
 the returned value
 */
telegramWebApp.backButton
->TelegramWebApp.BackButton.show
->TelegramWebApp.BackButton.hide
->ignore

/**
 Some fields are explicitly marked as mutable,
 it is possible to affect them directly
 */
telegramWebApp.backButton.isVisible = true

/**
 For convinience, feel free to open respective
 submodule locally
 */
{
  open TelegramWebApp.BottomButton

  telegramWebApp.mainButton
  ->enable
  ->setText("Press Me")
  ->onClick(~callback=() => {
    Console.log("hello")
  })
  ->show
  ->ignore
}

/**
 Async methods

 Some methods use pre-promise-nodejs-style api, when
 a callback receives 2 params, error and value

 Those are modelled presicely as they are:
 - error is Null.t (nullable)
 - value is Option
 without explicit dependency on one another

 It does require some redundant checks
 */
telegramWebApp.deviceStorage
->TelegramWebApp.DeviceStorage.setItem("StoredKey", "StoredValue", ~callback=(error, value) => {
  switch error {
  | Null =>
    switch value {
    | Some(isStored) =>
      if isStored {
        Console.log("Item successfuly stored")
      } else {
        Console.log("Failed to store item")
      }
    | None => Console.error("Invalid arguments!")
    }
  | Value(error) =>
    switch error {
    | UnknownError => Console.log("Unknown error occured")
    | UndocumentedError(message) => Console.log("New type of error: " + message)
    }
  }
})
->ignore

/**
 This can be simplified using a helper
 (not included, feel free to copy-paste)
 */
exception InvalidCallbackArguments

@throws(InvalidCallbackArguments)
let toResult = (error: Null.t<'e>, value: option<'v>): Result.t<'v, 'e> => {
  switch error {
  | Null =>
    switch value {
    | None => throw(InvalidCallbackArguments)
    | Some(v) => Result.Ok(v)
    }
  | Value(e) => Result.Error(e)
  }
}

telegramWebApp.deviceStorage
->TelegramWebApp.DeviceStorage.setItem("StoredKey", "StoredValue", ~callback=(error, value) => {
  switch toResult(error, value) {
  | Ok(true) => Console.log("Item successfuly stored")
  | Ok(false) => Console.log("Failed to store item")
  | Error(UnknownError) => Console.log("Unknown error occured")
  | Error(UndocumentedError(message)) => Console.log("New type of error discovered: " + message)
  }
})
->ignore

/**
 Custom underlying implimentation

 Useful for tests, mocks, supproting non-telegram environments
 */
@val
external mockedTelegramWebApp: TelegramWebApp.t = "someOtherGlobalValue"

Console.log(mockedTelegramWebApp.version)
