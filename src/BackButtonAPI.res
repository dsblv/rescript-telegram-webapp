open BackButton

/**
 A method that sets the button press event handler. An alias for Telegram.WebApp.onEvent('backButtonClicked', callback)
 */
@send
external onClick: (t, ~callback: unit => unit) => t = "onClick"

/**
 A method that removes the button press event handler. An alias for Telegram.WebApp.offEvent('backButtonClicked', callback)
 */
@send
external offClick: (t, ~callback: unit => unit) => t = "offClick"

/**
 A method to make the button active and visible.
 */
@send
external show: t => t = "show"

/**
 A method to hide the button.
 */
@send
external hide: t => t = "hide"
