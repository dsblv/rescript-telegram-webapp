open BottomButton

/**
 A method to set the button text.
 */
@send
external setText: (t, string) => t = "setText"

/**
 A method that sets the button's press event handler. An alias for Telegram.WebApp.onEvent('mainButtonClicked', callback)
 */
@send
external onClick: (t, ~callback: unit => unit) => t = "onClick"

/**
 A method that removes the button's press event handler. An alias for Telegram.WebApp.offEvent('mainButtonClicked', callback)
 */
@send
external offClick: (t, ~callback: unit => unit) => t = "offClick"

/**
 A method to make the button visible.
 Note that opening the Mini App from the attachment menu hides the main button until the user interacts with the Mini App interface.
 */
@send
external show: t => t = "show"

/**
 A method to hide the button.
 */
@send
external hide: t => t = "hide"

/**
 A method to enable the button.
 */
@send
external enable: t => t = "enable"

/**
 A method to disable the button.
 */
@send
external disable: t => t = "disable"

/**
 A method to show a loading indicator on the button.

 It is recommended to display loading progress if the action tied to the button may take a long time. By default, the button is disabled while the action is in progress. If the parameter leaveActive=true is passed, the button remains enabled.
 */
@send
external showProgress: (t, bool) => t = "showProgress"

/**
 A method to hide the loading indicator.
 */
@send
external hideProgress: t => t = "hideProgress"

type params = {
  text?: string, // button text;
  color?: string, // button color;
  text_color?: string, // button text color;
  has_shine_effect?: bool, // Bot API 7.10+ enable shine effect;
  position?: bottomButtonPosition, // position of the secondary button;
  is_active?: bool, // enable the button;
  is_visible?: bool, // show the button.
}

/**
 A method to set the button parameters. The params parameter is an object containing one or several fields that need to be changed.
 */
@send
external setParams: (t, params) => t = "setParams"
