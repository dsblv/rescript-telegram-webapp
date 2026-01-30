open SettingsButton

/**
 A method that sets the press event handler for the Settings item in the context menu. An alias for Telegram.WebApp.onEvent('settingsButtonClicked', callback)
 */
@send
external onClick: (t, ~callback: unit => unit) => t = "onClick"

/**
 A method that removes the press event handler from the Settings item in the context menu. An alias for Telegram.WebApp.offEvent('settingsButtonClicked', callback)
 */
@send
external offClick: (t, ~callback: unit => unit) => t = "offClick"

/**
 A method to make the Settings item in the context menu visible.
 */
@send
external show: t => t = "show"

/**
 A method to hide the Settings item in the context menu.
 */
@send
external hide: t => t = "hide"
