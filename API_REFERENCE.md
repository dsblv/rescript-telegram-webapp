# TelegramWebApp

## TelegramWebApp.t

```rescript
type t = {
  initData: string,
  initDataUnsafe: webAppInitDataUnsafe,
  version: string,
  platform: string,
  colorScheme: colorScheme,
  themeParams: themeParams,
  isActve: bool,
  isExpanded: bool,
  viewportHeight: float,
  viewportStableHeight: float,
  mutable headerColor: string,
  mutable backgroundColor: string,
  mutable bottomBarColor: string,
  mutable isClosingConfirmationEnabled: bool,
  mutable isVerticalSwipesEnabled: bool,
  isFullscreen: bool,
  mutable isOrientationLocked: bool,
  safeAreaInset: safeAreaInset,
  contentSafeAreaInset: contentSafeAreaInset,
  backButton: BackButton.t,
  mainButton: BottomButton.t,
  secondaryButton: BottomButton.t,
  settings: SettingsButton.t,
  hapticFeedback: HapticFeedback.t,
  cloudStorage: CloudStorage.t,
  biometricManager: BiometricManager.t,
  accelerometer: Accelerometer.t,
  deviceOrientation: DeviceOrientation.t,
  gyroscope: Gyroscope.t,
  locationManager: LocationManager.t,
  deviceStorage: DeviceStorage.t,
  secureStorage: SecureStorage.t,
}
```

## Methods

### TelegramWebApp.isVersionAtLeast

Returns true if the user's app supports a version of the Bot API that is equal to or higher than the version passed as the parameter.

```rescript
let isVersionAtLeast: (t, string) => bool
```

### TelegramWebApp.setHeaderColor

A method that sets the app header color in the #RRGGBB format. You can also use keywords bg_color and secondary_bg_color.

Up to Bot API 6.9 You can only pass Telegram.WebApp.themeParams.bg_color or Telegram.WebApp.themeParams.secondary_bg_color as a color or bg_color, secondary_bg_color keywords.

```rescript
let setHeaderColor: (t, string) => unit
```

### TelegramWebApp.setBackgroundColor

A method that sets the app background color in the #RRGGBB format. You can also use keywords bg_color and secondary_bg_color.

```rescript
let setBackgroundColor: (t, string) => unit
```

### TelegramWebApp.setBottomBarColor

A method that sets the app's bottom bar color in the #RRGGBB format. You can also use the keywords bg_color, secondary_bg_color, and bottom_bar_bg_color. This color is also applied to the navigation bar on Android.

```rescript
let setBottomBarColor: (t, string) => unit
```

### TelegramWebApp.enableClosingConfirmation

A method that enables a confirmation dialog while the user is trying to close the Mini App.

```rescript
let enableClosingConfirmation: t => unit
```

### TelegramWebApp.disableClosingConfirmation

A method that disables the confirmation dialog while the user is trying to close the Mini App.

```rescript
let disableClosingConfirmation: t => unit
```

### TelegramWebApp.enableVerticalSwipes

A method that enables vertical swipes to close or minimize the Mini App. For user convenience, it is recommended to always enable swipes unless they conflict with the Mini App's own gestures.

```rescript
let enableVerticalSwipes: t => unit
```

### TelegramWebApp.disableVerticalSwipes

A method that disables vertical swipes to close or minimize the Mini App. This method is useful if your Mini App uses swipe gestures that may conflict with the gestures for minimizing and closing the app.

```rescript
let disableVerticalSwipes: t => unit
```

### TelegramWebApp.requestFullscreen

A method that requests opening the Mini App in fullscreen mode. Although the header is transparent in fullscreen mode, it is recommended that the Mini App sets the header color using the setHeaderColor method. This color helps determine a contrasting color for the status bar and other UI controls.

```rescript
let requestFullscreen: t => unit
```

### TelegramWebApp.exitFullscreen

A method that requests exiting fullscreen mode.

```rescript
let exitFullscreen: t => unit
```

### TelegramWebApp.lockOrientation

A method that locks the Mini App’s orientation to its current mode (either portrait or landscape). Once locked, the orientation remains fixed, regardless of device rotation. This is useful if a stable orientation is needed during specific interactions.

```rescript
let lockOrientation: t => unit
```

### TelegramWebApp.unlockOrientation

A method that unlocks the Mini App’s orientation, allowing it to follow the device's rotation freely. Use this to restore automatic orientation adjustments based on the device orientation.

```rescript
let unlockOrientation: t => unit
```

### TelegramWebApp.addToHomeScreen

A method that prompts the user to add the Mini App to the home screen. After successfully adding the icon, the homeScreenAdded event will be triggered if supported by the device. Note that if the device cannot determine the installation status, the event may not be received even if the icon has been added.

```rescript
let addToHomeScreen: t => unit
```

### TelegramWebApp.checkHomeScreenStatus

A method that checks if adding to the home screen is supported and if the Mini App has already been added. If an optional callback parameter is provided, the callback function will be called with a single argument status, which is a string indicating the home screen status.

```rescript
let checkHomeScreenStatus: (t, ~callback: homeScreenStatus => unit=?) => unit
```

### TelegramWebApp.sendData

A method used to send data to the bot. When this method is called, a service message is sent to the bot containing the data data of the length up to 4096 bytes, and the Mini App is closed. See the field web_app_data in the class Message.

This method is only available for Mini Apps launched via a Keyboard button.

```rescript
let sendData: (t, string) => unit
```

### TelegramWebApp.switchInlineQuery

A method that inserts the bot's username and the specified inline query in the current chat's input field. Query may be empty, in which case only the bot's username will be inserted. If an optional choose_chat_types parameter was passed, the client prompts the user to choose a specific chat, then opens that chat and inserts the bot's username and the specified inline query in the input field. You can specify which types of chats the user will be able to choose from.

```rescript
let switchInlineQuery: (
  t,
  string,
  ~choose_chat_types: array<chooseChatType>=?,
) => unit
```

### TelegramWebApp.openLink

A method that opens a link in an external browser. The Mini App will not be closed.

Bot API 6.4+ If the optional options parameter is passed with the field try_instant_view=true, the link will be opened in Instant View mode if possible.

Note that this method can be called only in response to user interaction with the Mini App interface (e.g. a click inside the Mini App or on the main button)

```rescript
let openLink: (t, string, ~options: openLinkOptions=?) => unit
```

### TelegramWebApp.openTelegramLink

A method that opens a telegram link inside the Telegram app. The Mini App will not be closed after this method is called.

Up to Bot API 7.0 The Mini App will be closed after this method is called.

```rescript
let openTelegramLink: (t, string) => unit
```

### TelegramWebApp.openInvoice

A method that opens an invoice using the link url. The Mini App will receive the event invoiceClosed when the invoice is closed. If an optional callback parameter was passed, the callback function will be called and the invoice status will be passed as the first argument.

```rescript
let openInvoice: (t, string, ~callback: invoiceStatus => unit=?) => unit
```

### TelegramWebApp.shareToStory

A method that opens the native story editor with the media specified in the media_url parameter as an HTTPS URL. An optional params argument of the type StoryShareParams describes additional sharing settings.

```rescript
let shareToStory: (t, string, ~params: shareToStoryParams=?) => unit
```

### TelegramWebApp.shareMessage

A method that opens a dialog allowing the user to share a message provided by the bot. If an optional callback parameter is provided, the callback function will be called with a boolean as the first argument, indicating whether the message was successfully sent. The message id passed to this method must belong to a PreparedInlineMessage previously obtained via the Bot API method savePreparedInlineMessage.

```rescript
let shareMessage: (t, string, ~callback: bool => unit=?) => unit
```

### TelegramWebApp.setEmojiStatus

A method that opens a dialog allowing the user to set the specified custom emoji as their status. An optional params argument of type EmojiStatusParams specifies additional settings, such as duration. If an optional callback parameter is provided, the callback function will be called with a boolean as the first argument, indicating whether the status was set.

Note: this method opens a native dialog and cannot be used to set the emoji status without manual user interaction. For fully programmatic changes, you should instead use the Bot API method setUserEmojiStatus after obtaining authorization to do so via the Mini App method requestEmojiStatusAccess.

```rescript
let setEmojiStatus: (
  t,
  string,
  ~params: emojiStatusParams=?,
  ~callback: bool => unit=?,
) => unit
```

### TelegramWebApp.requestEmojiStatusAccess

A method that shows a native popup requesting permission for the bot to manage user's emoji status. If an optional callback parameter was passed, the callback function will be called when the popup is closed and the first argument will be a boolean indicating whether the user granted this access.

```rescript
let requestEmojiStatusAccess: (t, ~callback: bool => unit=?) => unit
```

### TelegramWebApp.downloadFile

A method that displays a native popup prompting the user to download a file specified by the params argument of type DownloadFileParams. If an optional callback parameter is provided, the callback function will be called when the popup is closed, with the first argument as a boolean indicating whether the user accepted the download request.

```rescript
let downloadFile: (
  t,
  ~params: downloadFileParams=?,
  ~callback: bool => unit=?,
) => unit
```

### TelegramWebApp.hideKeyboard

A method that hides the on-screen keyboard, if it is currently visible. Does nothing if the keyboard is not active.

```rescript
let hideKeyboard: t => unit
```

### TelegramWebApp.showPopup

A method that shows a native popup described by the params argument of the type PopupParams. The Mini App will receive the event popupClosed when the popup is closed. If an optional callback parameter was passed, the callback function will be called and the field id of the pressed button will be passed as the first argument.

```rescript
let showPopup: (
  t,
  ~params: popupParams=?,
  ~callback: string => unit=?,
) => unit
```

### TelegramWebApp.showAlert

A method that shows message in a simple alert with a 'Close' button. If an optional callback parameter was passed, the callback function will be called when the popup is closed.

```rescript
let showAlert: (t, string, ~callback: unit => unit=?) => unit
```

### TelegramWebApp.showConfirm

A method that shows message in a simple confirmation window with 'OK' and 'Cancel' buttons. If an optional callback parameter was passed, the callback function will be called when the popup is closed and the first argument will be a boolean indicating whether the user pressed the 'OK' button.

```rescript
let showConfirm: (t, string, ~callback: bool => unit=?) => unit
```

### TelegramWebApp.showScanQrPopup

A method that shows a native popup for scanning a QR code described by the params argument of the type ScanQrPopupParams. The Mini App will receive the event qrTextReceived every time the scanner catches a code with text data. If an optional callback parameter was passed, the callback function will be called and the text from the QR code will be passed as the first argument. Returning true inside this callback function causes the popup to be closed. Starting from Bot API 7.7, the Mini App will receive the scanQrPopupClosed event if the user closes the native popup for scanning a QR code.

```rescript
let showScanQrPopup: (
  t,
  ~params: scanQrPopupParams,
  ~callback: string => bool=?,
) => unit
```

### TelegramWebApp.closeScanQrPopup

A method that closes the native popup for scanning a QR code opened with the showScanQrPopup method. Run it if you received valid data in the event qrTextReceived.

```rescript
let closeScanQrPopup: t => unit
```

### TelegramWebApp.readTextFromClipboard

A method that requests text from the clipboard. The Mini App will receive the event clipboardTextReceived. If an optional callback parameter was passed, the callback function will be called and the text from the clipboard will be passed as the first argument.

Note: this method can be called only for Mini Apps launched from the attachment menu and only in response to a user interaction with the Mini App interface (e.g. a click inside the Mini App or on the main button).

```rescript
let readTextFromClipboard: (t, ~callback: string => unit=?) => unit
```

### TelegramWebApp.requestWriteAccess

A method that shows a native popup requesting permission for the bot to send messages to the user. If an optional callback parameter was passed, the callback function will be called when the popup is closed and the first argument will be a boolean indicating whether the user granted this access.

```rescript
let requestWriteAccess: (t, ~callback: bool => unit=?) => unit
```

### TelegramWebApp.requestContact

A method that shows a native popup prompting the user for their phone number. If an optional callback parameter was passed, the callback function will be called when the popup is closed and the first argument will be a boolean indicating whether the user shared its phone number.

```rescript
let requestContact: (t, ~callback: bool => unit=?) => unit
```

### TelegramWebApp.ready

A method that informs the Telegram app that the Mini App is ready to be displayed.

It is recommended to call this method as early as possible, as soon as all essential interface elements are loaded. Once this method is called, the loading placeholder is hidden and the Mini App is shown.

If the method is not called, the placeholder will be hidden only when the page is fully loaded.

```rescript
let ready: t => unit
```

### TelegramWebApp.expand

A method that expands the Mini App to the maximum available height. To find out if the Mini App is expanded to the maximum height, refer to the value of the Telegram.WebApp.isExpanded parameter

```rescript
let expand: t => unit
```

### TelegramWebApp.close

A method that closes the Mini App.

```rescript
let close: t => unit
```

## Types

### TelegramWebApp.webAppUser

```rescript
type webAppUser = {
  id: int,
  is_bot?: bool,
  first_name: string,
  last_name?: string,
  username?: string,
  language_code?: string,
  is_premium?: bool,
  added_to_attachment_menu?: bool,
  allows_write_to_pm?: bool,
  photo_url?: string,
}
```

### TelegramWebApp.webAppChat

```rescript
type webAppChat = {
  id: int,
  type_: string,
  title: string,
  username?: string,
  photo_url?: string,
}
```

### TelegramWebApp.webAppInitDataUnsafe

```rescript
type webAppInitDataUnsafe = {
  query_id?: string,
  user?: webAppUser,
  receiver?: webAppUser,
  chat?: webAppChat,
  chat_type?: string,
  chat_instance?: string,
  start_param?: string,
  can_send_after?: int,
  auth_date: int,
  hash: string,
  signature: string,
}
```

### TelegramWebApp.colorScheme

```rescript
type colorScheme = @as("light") Light | @as("dark") Dark
```

### TelegramWebApp.themeParams

```rescript
type themeParams = {
  bg_color?: string,
  text_color?: string,
  hint_color?: string,
  link_color?: string,
  button_color?: string,
  button_text_color?: string,
  secondary_bg_color?: string,
  header_bg_color?: string,
  bottom_bar_bg_color?: string,
  accent_text_color?: string,
  section_bg_color?: string,
  section_header_text_color?: string,
  section_separator_color?: string,
  subtitle_text_color?: string,
  destructive_text_color?: string,
}
```

### TelegramWebApp.safeAreaInset

```rescript
type safeAreaInset = {
  top: int,
  bottom: int,
  left: int,
  right: int,
}
```

### TelegramWebApp.contentSafeAreaInset

```rescript
type contentSafeAreaInset = {
  top: int,
  bottom: int,
  left: int,
  right: int,
}
```

### TelegramWebApp.homeScreenStatus

```rescript
type homeScreenStatus =
  | @as("unsupported") Unsupported
  | @as("unknown") Unknown
  | @as("added") Added
  | @as("missed") Missed
  | UndocumentedStatus(string)
```

### TelegramWebApp.invoiceStatus

```rescript
@unboxed
type invoiceStatus =
  | @as("paid") Paid
  | @as("cancelled") Cancelled
  | @as("failed") Failed
  | @as("pending") Pending
  | UndocumentedStatus(string)
```

### TelegramWebApp.chooseChatType

```rescript
type chooseChatType =
  | @as("users") Users
  | @as("bots") Bots
  | @as("groups") Groups
  | @as("channels") Channels
```

### TelegramWebApp.openLinkOptions

```rescript
type openLinkOptions = {try_instant_view: bool}
```

### TelegramWebApp.storyWidgetLink

```rescript
type storyWidgetLink = {url: string, name?: string}
```

### TelegramWebApp.shareToStoryParams

```rescript
type shareToStoryParams = {
  text?: string,
  widget_link?: storyWidgetLink,
}
```

### TelegramWebApp.emojiStatusParams

```rescript
type emojiStatusParams = {duration?: int}
```

### TelegramWebApp.downloadFileParams

```rescript
type downloadFileParams = {url: string, file_name: string}
```

### TelegramWebApp.popupButtonType

```rescript
type popupButtonType =
  | @as("default") Default
  | @as("ok") Ok
  | @as("close") Close
  | @as("cancel") Cancel
  | @as("destructive") Destructive
```

### TelegramWebApp.popupButton

```rescript
type popupButton = {
  id?: string,
  type_?: popupButtonType,
  text?: string,
}
```

### TelegramWebApp.popupParams

```rescript
type popupParams = {
  title?: string,
  message: string,
  buttons: array<popupButton>,
}
```

### TelegramWebApp.scanQrPopupParams

```rescript
type scanQrPopupParams = {text?: string}
```

## Modules

### TelegramWebApp.BackButton

This object controls the back button, which can be displayed in the header of the Mini App in the Telegram interface.

#### TelegramWebApp.BackButton.t

```rescript
type t = {mutable isVisible: bool}
```

#### TelegramWebApp.BackButton.onClick

A method that sets the button press event handler. An alias for Telegram.WebApp.onEvent('backButtonClicked', callback)

```rescript
let onClick: (t, ~callback: unit => unit) => t
```

#### TelegramWebApp.BackButton.offClick

A method that removes the button press event handler. An alias for Telegram.WebApp.offEvent('backButtonClicked', callback)

```rescript
let offClick: (t, ~callback: unit => unit) => t
```

#### TelegramWebApp.BackButton.show

A method to make the button active and visible.

```rescript
let show: t => t
```

#### TelegramWebApp.BackButton.hide

A method to hide the button.

```rescript
let hide: t => t
```

### TelegramWebApp.BottomButton

This object controls the button that is displayed at the bottom of the Mini App in the Telegram interface.

#### TelegramWebApp.BottomButton.t

```rescript
type t = {
  type_: bottomButtonType,
  mutable text: string,
  mutable color: string,
  mutable textColor: string,
  mutable isVisible: bool,
  mutable isActive: bool,
  mutable hasShineEffect: bool,
  mutable position: option<bottomButtonPosition>,
  isProgressVisible: bool,
}
```

#### TelegramWebApp.BottomButton.setText

A method to set the button text.

```rescript
let setText: (t, string) => t
```

#### TelegramWebApp.BottomButton.onClick

A method that sets the button's press event handler. An alias for Telegram.WebApp.onEvent('mainButtonClicked', callback)

```rescript
let onClick: (t, ~callback: unit => unit) => t
```

#### TelegramWebApp.BottomButton.offClick

A method that removes the button's press event handler. An alias for Telegram.WebApp.offEvent('mainButtonClicked', callback)

```rescript
let offClick: (t, ~callback: unit => unit) => t
```

#### TelegramWebApp.BottomButton.show

A method to make the button visible.
Note that opening the Mini App from the attachment menu hides the main button until the user interacts with the Mini App interface.

```rescript
let show: t => t
```

#### TelegramWebApp.BottomButton.hide

A method to hide the button.

```rescript
let hide: t => t
```

#### TelegramWebApp.BottomButton.enable

A method to enable the button.

```rescript
let enable: t => t
```

#### TelegramWebApp.BottomButton.disable

A method to disable the button.

```rescript
let disable: t => t
```

#### TelegramWebApp.BottomButton.showProgress

A method to show a loading indicator on the button.

It is recommended to display loading progress if the action tied to the button may take a long time. By default, the button is disabled while the action is in progress. If the parameter leaveActive=true is passed, the button remains enabled.

```rescript
let showProgress: (t, bool) => t
```

#### TelegramWebApp.BottomButton.hideProgress

A method to hide the loading indicator.

```rescript
let hideProgress: t => t
```

#### TelegramWebApp.BottomButton.setParams

A method to set the button parameters. The params parameter is an object containing one or several fields that need to be changed.

```rescript
let setParams: (t, params) => t
```

#### TelegramWebApp.BottomButton.bottomButtonType

```rescript
type bottomButtonType =
  | @as("main") Main
  | @as("secondary") Secondary
```

#### TelegramWebApp.BottomButton.bottomButtonPosition

```rescript
type bottomButtonPosition =
  | @as("left") Left
  | @as("right") Right
  | @as("top") Top
  | @as("bottom") Bottom
```

#### TelegramWebApp.BottomButton.params

```rescript
type params = {
  text?: string,
  color?: string,
  text_color?: string,
  has_shine_effect?: bool,
  position?: bottomButtonPosition,
  is_active?: bool,
  is_visible?: bool,
}
```

### TelegramWebApp.SettingsButton

This object controls the Settings item in the context menu of the Mini App in the Telegram interface.

#### TelegramWebApp.SettingsButton.t

```rescript
type t = {mutable isVisible: bool}
```

#### TelegramWebApp.SettingsButton.onClick

A method that sets the press event handler for the Settings item in the context menu. An alias for Telegram.WebApp.onEvent('settingsButtonClicked', callback)

```rescript
let onClick: (t, ~callback: unit => unit) => t
```

#### TelegramWebApp.SettingsButton.offClick

A method that removes the press event handler from the Settings item in the context menu. An alias for Telegram.WebApp.offEvent('settingsButtonClicked', callback)

```rescript
let offClick: (t, ~callback: unit => unit) => t
```

#### TelegramWebApp.SettingsButton.show

A method to make the Settings item in the context menu visible.

```rescript
let show: t => t
```

#### TelegramWebApp.SettingsButton.hide

A method to hide the Settings item in the context menu.

```rescript
let hide: t => t
```

### TelegramWebApp.HapticFeedback

An object for controlling haptic feedback.

#### TelegramWebApp.HapticFeedback.t

```rescript
type t
```

#### TelegramWebApp.HapticFeedback.impactOccured

A method tells that an impact occurred. The Telegram app may play the appropriate haptics based on style value passed.

```rescript
let impactOccured: (t, impactStyle) => unit
```

#### TelegramWebApp.HapticFeedback.notificationOccurred

A method tells that a task or action has succeeded, failed, or produced a warning. The Telegram app may play the appropriate haptics based on type value passed.

```rescript
let notificationOccurred: (t, notificationType) => unit
```

#### TelegramWebApp.HapticFeedback.selectionChanged

A method tells that the user has changed a selection. The Telegram app may play the appropriate haptics.

Do not use this feedback when the user makes or confirms a selection; use it only when the selection changes.

```rescript
let selectionChanged: (t, notificationType) => unit
```

#### TelegramWebApp.HapticFeedback.impactStyle

```rescript
type impactStyle =
  | @as("light") Light
  | @as("medium") Medium
  | @as("heavy") Heavy
  | @as("rigid") Rigid
  | @as("soft") Soft
```

#### TelegramWebApp.HapticFeedback.notificationType

```rescript
type notificationType =
  | @as("error") Error
  | @as("success") Success
  | @as("warning") Warning
```

### TelegramWebApp.CloudStorage

This object controls the cloud storage. Each bot can store up to 1024 items per user in the cloud storage.

#### TelegramWebApp.CloudStorage.t

```rescript
type t
```

#### TelegramWebApp.CloudStorage.setItem

A method that stores a value in the cloud storage using the specified key. The key should contain 1-128 characters, only A-Z, a-z, 0-9, \_ and - are allowed. The value should contain 0-4096 characters. You can store up to 1024 keys in the cloud storage. If an optional callback parameter was passed, the callback function will be called. In case of an error, the first argument will contain the error. In case of success, the first argument will be null and the second argument will be a boolean indicating whether the value was stored.

```rescript
let setItem: (
  t,
  string,
  string,
  ~callback: (
    Null.t<cloudStorageError>,
    option<bool>,
  ) => unit=?,
) => t
```

#### TelegramWebApp.CloudStorage.getItem

A method that receives a value from the cloud storage using the specified key. The key should contain 1-128 characters, only A-Z, a-z, 0-9, \_ and - are allowed. In case of an error, the callback function will be called and the first argument will contain the error. In case of success, the first argument will be null and the value will be passed as the second argument.

```rescript
let getItem: (
  t,
  string,
  ~callback: (
    Null.t<cloudStorageError>,
    option<string>,
  ) => unit,
) => t
```

#### TelegramWebApp.CloudStorage.getItems

A method that receives values from the cloud storage using the specified keys. The keys should contain 1-128 characters, only A-Z, a-z, 0-9, \_ and - are allowed. In case of an error, the callback function will be called and the first argument will contain the error. In case of success, the first argument will be null and the values will be passed as the second argument.

```rescript
let getItems: (
  t,
  array<string>,
  ~callback: (
    Null.t<cloudStorageError>,
    option<array<string>>,
  ) => unit,
) => t
```

#### TelegramWebApp.CloudStorage.removeItem

```rescript
let removeItem: (
  t,
  string,
  ~callback: (
    Null.t<cloudStorageError>,
    option<bool>,
  ) => unit,
) => t
```

#### TelegramWebApp.CloudStorage.removeItems

A method that removes values from the cloud storage using the specified keys. The keys should contain 1-128 characters, only A-Z, a-z, 0-9, \_ and - are allowed. If an optional callback parameter was passed, the callback function will be called. In case of an error, the first argument will contain the error. In case of success, the first argument will be null and the second argument will be a boolean indicating whether the values were removed.

```rescript
let removeItems: (
  t,
  array<string>,
  ~callback: (
    Null.t<cloudStorageError>,
    option<bool>,
  ) => unit,
) => t
```

#### TelegramWebApp.CloudStorage.getKeys

A method that receives the list of all keys stored in the cloud storage. In case of an error, the callback function will be called and the first argument will contain the error. In case of success, the first argument will be null and the list of keys will be passed as the second argument.

```rescript
let getKeys: (
  t,
  ~callback: (
    Null.t<cloudStorageError>,
    option<array<string>>,
  ) => unit,
) => t
```

#### TelegramWebApp.CloudStorage.cloudStorageError

```rescript
@unboxed
type cloudStorageError =
  | @as("UNKNOWN_ERROR") UnknownError
  | UndocumentedError(string)
```

### TelegramWebApp.BiometricManager

This object controls biometrics on the device. Before the first use of this object, it needs to be initialized using the init method.

#### TelegramWebApp.BiometricManager.t

```rescript
type t = {
  isInited: bool,
  isBiometricAvailable: bool,
  biometricType: string,
  isAccessRequested: bool,
  isAccessGranted: bool,
  isBiometricTokenSaved: bool,
  deviceId: string,
}
```

#### TelegramWebApp.BiometricManager.init

A method that initializes the BiometricManager object. It should be called before the object's first use. If an optional callback parameter was passed, the callback function will be called when the object is initialized.

```rescript
let init: (t, ~callback: unit => unit=?) => t
```

#### TelegramWebApp.BiometricManager.requestAccess

A method that requests permission to use biometrics according to the params argument of type BiometricRequestAccessParams. If an optional callback parameter was passed, the callback function will be called and the first argument will be a boolean indicating whether the user granted access.

```rescript
let requestAccess: (
  t,
  biometricRequestAccessParams,
  ~callback: bool => unit=?,
) => t
```

#### TelegramWebApp.BiometricManager.authenticate

A method that authenticates the user using biometrics according to the params argument of type BiometricAuthenticateParams. If an optional callback parameter was passed, the callback function will be called and the first argument will be a boolean indicating whether the user authenticated successfully. If so, the second argument will be a biometric token.

```rescript
let authenticate: (
  t,
  biometricAuthenticateParams,
  ~callback: (bool, string) => unit=?,
) => t
```

#### TelegramWebApp.BiometricManager.updateBiometricToken

A method that updates the biometric token in secure storage on the device. To remove the token, pass an empty string. If an optional callback parameter was passed, the callback function will be called and the first argument will be a boolean indicating whether the token was updated.

```rescript
let updateBiometricToken: (t, string, ~callback: bool => unit=?) => t
```

#### TelegramWebApp.BiometricManager.openSettings

A method that opens the biometric access settings for bots. Useful when you need to request biometrics access to users who haven't granted it yet.

Note that this method can be called only in response to user interaction with the Mini App interface (e.g. a click inside the Mini App or on the main button)

```rescript
let openSettings: t => t
```

#### TelegramWebApp.BiometricManager.biometricRequestAccessParams

```rescript
type biometricRequestAccessParams = {reason?: string}
```

#### TelegramWebApp.BiometricManager.biometricAuthenticateParams

```rescript
type biometricAuthenticateParams = {reason?: string}
```

### TelegramWebApp.Accelerometer

This object provides access to accelerometer data on the device.

#### TelegramWebApp.Accelerometer.t

```rescript
type t = {isStarted: bool, x: float, y: float, z: float}
```

#### TelegramWebApp.Accelerometer.start

Starts tracking accelerometer data using params of type AccelerometerStartParams. If an optional callback parameter is provided, the callback function will be called with a boolean indicating whether tracking was successfully started.

```rescript
let start: (
  t,
  accelerometerStartParams,
  ~callback: bool => unit=?,
) => t
```

#### TelegramWebApp.Accelerometer.stop

Stops tracking accelerometer data. If an optional callback parameter is provided, the callback function will be called with a boolean indicating whether tracking was successfully stopped.

```rescript
let stop: (t, ~callback: bool => unit=?) => t
```

#### TelegramWebApp.Accelerometer.accelerometerStartParams

```rescript
type accelerometerStartParams = {refresh_rate?: int}
```

### TelegramWebApp.DeviceOrientation

This object provides access to orientation data on the device.

#### TelegramWebApp.DeviceOrientation.t

```rescript
type t = {
  isStarted: bool,
  absolute: bool,
  alpha: float,
  beta: float,
  gamma: float,
}
```

#### TelegramWebApp.DeviceOrientation.start

Starts tracking device orientation data using params of type DeviceOrientationStartParams. If an optional callback parameter is provided, the callback function will be called with a boolean indicating whether tracking was successfully started.

```rescript
let start: (
  t,
  deviceOrientationStartParams,
  ~callback: bool => unit=?,
) => t
```

#### TelegramWebApp.DeviceOrientation.stop

Stops tracking device orientation data. If an optional callbackparameter is provided, the callback function will be called with a boolean indicating whether tracking was successfully stopped.

```rescript
let stop: (t, ~callback: bool => unit=?) => t
```

#### TelegramWebApp.DeviceOrientation.deviceOrientationStartParams

```rescript
type deviceOrientationStartParams = {
  refresh_rate?: int,
  need_absolute?: bool,
}
```

### TelegramWebApp.Gyroscope

This object provides access to gyroscope data on the device.

#### TelegramWebApp.Gyroscope.t

```rescript
type t = {isStarted: bool, x: float, y: float, z: float}
```

#### TelegramWebApp.Gyroscope.start

Starts tracking gyroscope data using params of type GyroscopeStartParams. If an optional callback parameter is provided, the callbackfunction will be called with a boolean indicating whether tracking was successfully started.

```rescript
let start: (t, gyroscopeStartParams, ~callback: bool => unit=?) => t
```

#### TelegramWebApp.Gyroscope.stop

Stops tracking gyroscope data. If an optional callback parameter is provided, the callback function will be called with a boolean indicating whether tracking was successfully stopped.

```rescript
let stop: (t, ~callback: bool => unit=?) => t
```

#### TelegramWebApp.Gyroscope.gyroscopeStartParams

```rescript
type gyroscopeStartParams = {refresh_rate?: int}
```

### TelegramWebApp.LocationManager

This object controls location access on the device. Before the first use of this object, it needs to be initialized using the init method.

#### TelegramWebApp.LocationManager.t

```rescript
type t = {
  isInited: bool,
  isLocationAvailable: bool,
  isAccessRequested: bool,
  isAccessGranted: bool,
}
```

#### TelegramWebApp.LocationManager.init

A method that initializes the LocationManager object. It should be called before the object's first use. If an optional callback parameter is provided, the callback function will be called when the object is initialized.

```rescript
let init: (t, ~callback: unit => unit=?) => t
```

#### TelegramWebApp.LocationManager.getLocation

A method that requests location data. The callback function will be called with null as the first argument if access to location was not granted, or an object of type LocationData as the first argument if access was successful.

```rescript
let getLocation: (t, ~callback: locationData => unit) => t
```

#### TelegramWebApp.LocationManager.openSetting

A method that opens the location access settings for bots. Useful when you need to request location access from users who haven't granted it yet.

    Note that this method can be called only in response to user interaction with the Mini App interface (e.g., a click inside the Mini App or on the main button)."

```rescript
let openSetting: t => t
```

#### TelegramWebApp.LocationManager.locationData

```rescript
type locationData = {
  latitude: float,
  longitude: float,
  altitude: float,
  course: float,
  speed: float,
  horizontal_accuracy: float,
  vertical_accuracy: float,
  course_accuracy: float,
  speed_accuracy: float,
}
```

### TelegramWebApp.DeviceStorage

This object provides access to persistent local storage on the user’s device. It is conceptually similar to the browser's localStorage API, but integrated within the Telegram client. All data is stored locally and is available only to the bot that created it. Each bot can store up to 5 MB per user using this storage.

#### TelegramWebApp.DeviceStorage.t

```rescript
type t
```

#### TelegramWebApp.DeviceStorage.setItem

A method that stores a value in the device's local storage using the specified key. If an optional callback parameter was passed, the callback function will be called. In case of an error, the first argument will contain the error. In case of success, the first argument will be null and the second argument will be a boolean indicating whether the value was stored.

```rescript
let setItem: (
  t,
  string,
  string,
  ~callback: (
    Null.t<deviceStorageError>,
    option<bool>,
  ) => unit=?,
) => t
```

#### TelegramWebApp.DeviceStorage.getItem

A method that receives a value from the device's local storage using the specified key. In case of an error, the callback function will be called and the first argument will contain the error. In case of success, the first argument will be null and the value will be passed as the second argument.

```rescript
let getItem: (
  t,
  string,
  ~callback: (
    Null.t<deviceStorageError>,
    option<string>,
  ) => unit,
) => t
```

#### TelegramWebApp.DeviceStorage.removeItem

A method that removes a value from the device's local storage using the specified key. If an optional callback parameter was passed, the callbackfunction will be called. In case of an error, the first argument will contain the error. In case of success, the first argument will be null and the second argument will be a boolean indicating whether the value was removed.

```rescript
let removeItem: (
  t,
  string,
  ~callback: (
    Null.t<deviceStorageError>,
    option<bool>,
  ) => unit=?,
) => t
```

#### TelegramWebApp.DeviceStorage.clear

A method that clears all keys previously stored by the bot in the device's local storage. If an optional callback parameter was passed, the callbackfunction will be called. In case of an error, the first argument will contain the error. In case of success, the first argument will be null and the second argument will be a boolean indicating whether all values were removed.

```rescript
let clear: (
  t,
  ~callback: (
    Null.t<deviceStorageError>,
    option<bool>,
  ) => unit=?,
) => t
```

#### TelegramWebApp.DeviceStorage.deviceStorageError

```rescript
@unboxed
type deviceStorageError =
  | @as("UNKNOWN_ERROR") UnknownError
  | UndocumentedError(string)
```

### TelegramWebApp.SecureStorage

This object provides access to a secure storage on the user’s device for sensitive data. On iOS, it uses the system Keychain; on Android, it uses the Keystore. This ensures that all stored values are encrypted at rest and inaccessible to unauthorized applications.

Secure storage is suitable for storing tokens, secrets, authentication state, and other sensitive user-specific information. Each bot can store up to 10 items per user.

#### TelegramWebApp.SecureStorage.t

```rescript
type t
```

#### TelegramWebApp.SecureStorage.setItem

A method that stores a value in the device's secure storage using the specified key. If an optional callback parameter was passed, the callback function will be called. In case of an error, the first argument will contain the error. In case of success, the first argument will be null and the second argument will be a boolean indicating whether the value was stored.

```rescript
let setItem: (
  t,
  string,
  string,
  ~callback: (
    Null.t<secureStorageError>,
    option<bool>,
  ) => unit=?,
) => t
```

#### TelegramWebApp.SecureStorage.getItem

A method that receives a value from the device's secure storage using the specified key. In case of an error, the callback function will be called and the first argument will contain the error. In case of success, the first argument will be null and the value will be passed as the second argument. If the key was not found, the second argument will be null, and the third argument will be a boolean indicating whether the key can be restored from the current device.

```rescript
let getItem: (
  t,
  string,
  ~callback: (
    Null.t<secureStorageError>,
    option<string>,
  ) => unit,
) => t
```

#### TelegramWebApp.SecureStorage.restoreItem

Attempts to restore a key that previously existed on the current device. When called, the user will be asked for permission to restore the value. If the user declines or an error occurs, the first argument in the callback will contain the error. If restored successfully, the first argument will be null and the second argument will contain the restored value.

```rescript
let restoreItem: (
  t,
  string,
  ~callback: (
    Null.t<secureStorageError>,
    option<string>,
  ) => unit=?,
) => t
```

#### TelegramWebApp.SecureStorage.removeItem

A method that removes a value from the device's secure storage using the specified key. If an optional callback parameter was passed, the callbackfunction will be called. In case of an error, the first argument will contain the error. In case of success, the first argument will be null and the second argument will be a boolean indicating whether the value was removed.

```rescript
let removeItem: (
  t,
  string,
  ~callback: (
    Null.t<secureStorageError>,
    option<bool>,
  ) => unit=?,
) => t
```

#### TelegramWebApp.SecureStorage.clear

A method that clears all keys previously stored by the bot in the device's secure storage. If an optional callback parameter was passed, the callbackfunction will be called. In case of an error, the first argument will contain the error. In case of success, the first argument will be null and the second argument will be a boolean indicating whether all values were removed.

```rescript
let clear: (
  t,
  ~callback: (
    Null.t<secureStorageError>,
    option<bool>,
  ) => unit=?,
) => t
```

#### TelegramWebApp.SecureStorage.secureStorageError

```rescript
@unboxed
type secureStorageError =
  | @as("UNKNOWN_ERROR") UnknownError
  | UndocumentedError(string)
```

### TelegramWebApp.Global

A reference to global Telegram.WebApp object.

Assumes `<script src="https://telegram.org/js/telegram-web-app.js?59"></script>`
is connectede beforehand.

#### TelegramWebApp.Global.telegramWebApp

```rescript
let telegramWebApp: t
```

## Events

Events Available for Mini Apps

The Mini App can receive events from the Telegram app, onto which a handler can be attached using the Telegram.WebApp.onEvent(eventType, eventHandler) method. Inside eventHandler the this object refers to Telegram.WebApp, the set of parameters sent to the handler depends on the event type.

### TelegramWebApp.onActivated

Occurs when the Mini App becomes active (e.g., opened from minimized state or selected among tabs).

```rescript
let onActivated: (t, Events.activated) => unit
```

### TelegramWebApp.offActivated

```rescript
let offActivated: (t, Events.activated) => unit
```

### TelegramWebApp.onDeactivated

Occurs when the Mini App becomes inactive (e.g., minimized or moved to an inactive tab).

```rescript
let onDeactivated: (t, Events.deactivated) => unit
```

### TelegramWebApp.offDeactivated

```rescript
let offDeactivated: (t, Events.deactivated) => unit
```

### TelegramWebApp.onThemeChanged

Occurs whenever theme settings are changed in the user's Telegram app (including switching to night mode).

eventHandler receives no parameters, new theme settings and color scheme can be received via this.themeParams and this.colorScheme respectively.

```rescript
let onThemeChanged: (t, Events.themeChanged) => unit
```

### TelegramWebApp.offThemeChanged

```rescript
let offThemeChanged: (t, Events.themeChanged) => unit
```

### TelegramWebApp.onViewportChanged

Occurs when the visible section of the Mini App is changed.

eventHandler receives an object with the single field isStateStable. If isStateStable is true, the resizing of the Mini App is finished. If it is false, the resizing is ongoing (the user is expanding or collapsing the Mini App or an animated object is playing). The current value of the visible section’s height is available in this.viewportHeight.

```rescript
let onViewportChanged: (t, Events.viewportChanged) => unit
```

### TelegramWebApp.offViewportChanged

```rescript
let offViewportChanged: (t, Events.viewportChanged) => unit
```

### TelegramWebApp.onSafeAreaChanged

Occurs when the device's safe area insets change (e.g., due to orientation change or screen adjustments).

eventHandler receives no parameters. The current inset values can be accessed via this.safeAreaInset.

```rescript
let onSafeAreaChanged: (t, Events.safeAreaChanged) => unit
```

### TelegramWebApp.offSafeAreaChanged

```rescript
let offSafeAreaChanged: (t, Events.safeAreaChanged) => unit
```

### TelegramWebApp.onContentSafeAreaChanged

Occurs when the safe area for content changes (e.g., due to orientation change or screen adjustments).

eventHandler receives no parameters. The current inset values can be accessed via this.contentSafeAreaInset.

```rescript
let onContentSafeAreaChanged: (t, Events.contentSafeAreaChanged) => unit
```

### TelegramWebApp.offContentSafeAreaChanged

```rescript
let offContentSafeAreaChanged: (t, Events.contentSafeAreaChanged) => unit
```

### TelegramWebApp.onMainButtonClicked

Occurs when the main button is pressed.

```rescript
let onMainButtonClicked: (t, Events.mainButtonClicked) => unit
```

### TelegramWebApp.offMainButtonClicked

```rescript
let offMainButtonClicked: (t, Events.mainButtonClicked) => unit
```

### TelegramWebApp.onSecondaryButtonClicked

Occurs when the secondary button is pressed.

```rescript
let onSecondaryButtonClicked: (t, Events.secondaryButtonClicked) => unit
```

### TelegramWebApp.offSecondaryButtonClicked

```rescript
let offSecondaryButtonClicked: (t, Events.secondaryButtonClicked) => unit
```

### TelegramWebApp.onBackButtonClicked

Occurrs when the back button is pressed.

```rescript
let onBackButtonClicked: (t, Events.backButtonClicked) => unit
```

### TelegramWebApp.offBackButtonClicked

```rescript
let offBackButtonClicked: (t, Events.backButtonClicked) => unit
```

### TelegramWebApp.onSettingsButtonClicked

Occurrs when the Settings item in context menu is pressed.

```rescript
let onSettingsButtonClicked: (t, Events.settingsButtonClicked) => unit
```

### TelegramWebApp.offSettingsButtonClicked

```rescript
let offSettingsButtonClicked: (t, Events.settingsButtonClicked) => unit
```

### TelegramWebApp.onInvoiceClosed

Occurrs when the opened invoice is closed.

eventHandler receives an object with the two fields: url – invoice link provided and status – one of the invoice statuses.

```rescript
let onInvoiceClosed: (t, Events.invoiceClosed) => unit
```

### TelegramWebApp.offInvoiceClosed

```rescript
let offInvoiceClosed: (t, Events.invoiceClosed) => unit
```

### TelegramWebApp.onPopupClosed

Occurrs when the opened popup is closed.

eventHandler receives an object with the single field button_id – the value of the field id of the pressed button. If no buttons were pressed, the field button_id will be null.

```rescript
let onPopupClosed: (t, Events.popupClosed) => unit
```

### TelegramWebApp.offPopupClosed

```rescript
let offPopupClosed: (t, Events.popupClosed) => unit
```

### TelegramWebApp.onQrTextReceived

Occurs when the QR code scanner catches a code with text data.

eventHandler receives an object with the single field data containing text data from the QR code.

```rescript
let onQrTextReceived: (t, Events.qrTextReceived) => unit
```

### TelegramWebApp.offQrTextReceived

```rescript
let offQrTextReceived: (t, Events.qrTextReceived) => unit
```

### TelegramWebApp.onScanQrPopupClosed

Occurs when the QR code scanner popup is closed by the user.

```rescript
let onScanQrPopupClosed: (t, Events.scanQrPopupClosed) => unit
```

### TelegramWebApp.offScanQrPopupClosed

```rescript
let offScanQrPopupClosed: (t, Events.scanQrPopupClosed) => unit
```

### TelegramWebApp.onClipboardTextReceived

Occurrs when the readTextFromClipboard method is called.

eventHandler receives an object with the single field data containing text data from the clipboard. If the clipboard contains non-text data, the field data will be an empty string. If the Mini App has no access to the clipboard, the field data will be null.

```rescript
let onClipboardTextReceived: (t, Events.clipboardTextReceived) => unit
```

### TelegramWebApp.offClipboardTextReceived

```rescript
let offClipboardTextReceived: (t, Events.clipboardTextReceived) => unit
```

### TelegramWebApp.onWriteAccessRequested

Occurs when the write permission was requested.

eventHandler receives an object with the single field status containing one of the statuses.

```rescript
let onWriteAccessRequested: (t, Events.writeAccessRequested) => unit
```

### TelegramWebApp.offWriteAccessRequested

```rescript
let offWriteAccessRequested: (t, Events.writeAccessRequested) => unit
```

### TelegramWebApp.onContactRequested

Occurrs when the user's phone number was requested.

eventHandler receives an object with the single field status containing one of the statuses.

```rescript
let onContactRequested: (t, Events.contactRequested) => unit
```

### TelegramWebApp.offContactRequested

```rescript
let offContactRequested: (t, Events.contactRequested) => unit
```

### TelegramWebApp.onBiometricManagerUpdated

Occurs whenever BiometricManager object is changed.

```rescript
let onBiometricManagerUpdated: (t, Events.biometricManagerUpdated) => unit
```

### TelegramWebApp.offBiometricManagerUpdated

```rescript
let offBiometricManagerUpdated: (t, Events.biometricManagerUpdated) => unit
```

### TelegramWebApp.onBiometricAuthRequested

Occurs whenever biometric authentication was requested.

eventHandler receives an object with the field isAuthenticated containing a boolean indicating whether the user was authenticated successfully. If isAuthenticated is true, the field biometricToken will contain the biometric token stored in secure storage on the device.

```rescript
let onBiometricAuthRequested: (t, Events.biometricAuthRequested) => unit
```

### TelegramWebApp.offBiometricAuthRequested

```rescript
let offBiometricAuthRequested: (t, Events.biometricAuthRequested) => unit
```

### TelegramWebApp.onBiometricTokenUpdated

Occurs whenever the biometric token was updated.

eventHandler receives an object with the single field isUpdated, containing a boolean indicating whether the token was updated.

```rescript
let onBiometricTokenUpdated: (t, Events.biometricTokenUpdated) => unit
```

### TelegramWebApp.offBiometricTokenUpdated

```rescript
let offBiometricTokenUpdated: (t, Events.biometricTokenUpdated) => unit
```

### TelegramWebApp.onFullscreenChanged

Occurs whenever the Mini App enters or exits fullscreen mode.

eventHandler receives no parameters. The current fullscreen state can be checked via this.isFullscreen.

```rescript
let onFullscreenChanged: (t, Events.fullscreenChanged) => unit
```

### TelegramWebApp.offFullscreenChanged

```rescript
let offFullscreenChanged: (t, Events.fullscreenChanged) => unit
```

### TelegramWebApp.onFullscreenFailed

Occurs if a request to enter fullscreen mode fails.

eventHandler receives an object with the single field error, describing the reason for the failure.

```rescript
let onFullscreenFailed: (t, Events.fullscreenFailed) => unit
```

### TelegramWebApp.offFullscreenFailed

```rescript
let offFullscreenFailed: (t, Events.fullscreenFailed) => unit
```

### TelegramWebApp.onHomeScreenAdded

Occurs when the Mini App is successfully added to the home screen.

```rescript
let onHomeScreenAdded: (t, Events.homeScreenAdded) => unit
```

### TelegramWebApp.offHomeScreenAdded

```rescript
let offHomeScreenAdded: (t, Events.homeScreenAdded) => unit
```

### TelegramWebApp.onHomeScreenChecked

Occurs after checking the home screen status.

eventHandler receives an object with the field status, which is a string indicating the current home screen status.

```rescript
let onHomeScreenChecked: (t, Events.homeScreenChecked) => unit
```

### TelegramWebApp.offHomeScreenChecked

```rescript
let offHomeScreenChecked: (t, Events.homeScreenChecked) => unit
```

### TelegramWebApp.onAccelerometerStarted

Occurs when accelerometer tracking has started successfully.

```rescript
let onAccelerometerStarted: (t, Events.accelerometerStarted) => unit
```

### TelegramWebApp.offAccelerometerStarted

```rescript
let offAccelerometerStarted: (t, Events.accelerometerStarted) => unit
```

### TelegramWebApp.onAccelerometerStopped

Occurs when accelerometer tracking has stopped.

```rescript
let onAccelerometerStopped: (t, Events.accelerometerStopped) => unit
```

### TelegramWebApp.offAccelerometerStopped

```rescript
let offAccelerometerStopped: (t, Events.accelerometerStopped) => unit
```

### TelegramWebApp.onAccelerometerChanged

Occurs with the specified frequency after calling the start method, sending the current accelerometer data.

eventHandler receives no parameters, the current acceleration values can be received via this.x, this.y and this.z respectively.

```rescript
let onAccelerometerChanged: (t, Events.accelerometerChanged) => unit
```

### TelegramWebApp.offAccelerometerChanged

```rescript
let offAccelerometerChanged: (t, Events.accelerometerChanged) => unit
```

### TelegramWebApp.onAccelerometerFailed

Occurs if a request to start accelerometer tracking fails.

eventHandler receives an object with the single field error, describing the reason for the failure.

```rescript
let onAccelerometerFailed: (t, Events.accelerometerFailed) => unit
```

### TelegramWebApp.offAccelerometerFailed

```rescript
let offAccelerometerFailed: (t, Events.accelerometerFailed) => unit
```

### TelegramWebApp.onDeviceOrientationStarted

Occurs when device orientation tracking has started successfully.

```rescript
let onDeviceOrientationStarted: (t, Events.deviceOrientationStarted) => unit
```

### TelegramWebApp.offDeviceOrientationStarted

```rescript
let offDeviceOrientationStarted: (t, Events.deviceOrientationStarted) => unit
```

### TelegramWebApp.onDeviceOrientationStopped

Occurs when device orientation tracking has stopped.

```rescript
let onDeviceOrientationStopped: (t, Events.deviceOrientationStopped) => unit
```

### TelegramWebApp.offDeviceOrientationStopped

```rescript
let offDeviceOrientationStopped: (t, Events.deviceOrientationStopped) => unit
```

### TelegramWebApp.onDeviceOrientationChanged

Occurs with the specified frequency after calling the start method, sending the current orientation data.

eventHandler receives no parameters, the current device orientation values can be received via this.alpha, this.beta and this.gamma respectively.

```rescript
let onDeviceOrientationChanged: (t, Events.deviceOrientationChanged) => unit
```

### TelegramWebApp.offDeviceOrientationChanged

```rescript
let offDeviceOrientationChanged: (t, Events.deviceOrientationChanged) => unit
```

### TelegramWebApp.onDeviceOrientationFailed

Occurs if a request to start device orientation tracking fails.

eventHandler receives an object with the single field error, describing the reason for the failure.

```rescript
let onDeviceOrientationFailed: (t, Events.deviceOrientationFailed) => unit
```

### TelegramWebApp.offDeviceOrientationFailed

```rescript
let offDeviceOrientationFailed: (t, Events.deviceOrientationFailed) => unit
```

### TelegramWebApp.onGyroscopeStarted

Occurs when gyroscope tracking has started successfully.

```rescript
let onGyroscopeStarted: (t, Events.gyroscopeStarted) => unit
```

### TelegramWebApp.offGyroscopeStarted

```rescript
let offGyroscopeStarted: (t, Events.gyroscopeStarted) => unit
```

### TelegramWebApp.onGyroscopeStopped

Occurs when gyroscope tracking has stopped.

```rescript
let onGyroscopeStopped: (t, Events.gyroscopeStopped) => unit
```

### TelegramWebApp.offGyroscopeStopped

```rescript
let offGyroscopeStopped: (t, Events.gyroscopeStopped) => unit
```

### TelegramWebApp.onGyroscopeChanged

Occurs with the specified frequency after calling the start method, sending the current gyroscope data.

eventHandler receives no parameters, the current rotation rates can be received via this.x, this.y and this.z respectively.

```rescript
let onGyroscopeChanged: (t, Events.gyroscopeChanged) => unit
```

### TelegramWebApp.offGyroscopeChanged

```rescript
let offGyroscopeChanged: (t, Events.gyroscopeChanged) => unit
```

### TelegramWebApp.onGyroscopeFailed

Occurs if a request to start gyroscope tracking fails.

eventHandler receives an object with the single field error, describing the reason for the failure.

```rescript
let onGyroscopeFailed: (t, Events.gyroscopeFailed) => unit
```

### TelegramWebApp.offGyroscopeFailed

```rescript
let offGyroscopeFailed: (t, Events.gyroscopeFailed) => unit
```

### TelegramWebApp.onLocationManagerUpdated

Occurs whenever LocationManager object is changed.

```rescript
let onLocationManagerUpdated: (t, Events.locationManagerUpdated) => unit
```

### TelegramWebApp.offLocationManagerUpdated

```rescript
let offLocationManagerUpdated: (t, Events.locationManagerUpdated) => unit
```

### TelegramWebApp.onLocationRequested

Occurs when location data is requested.

eventHandler receives an object with the single field locationData of type LocationData, containing the current location information.

```rescript
let onLocationRequested: (t, Events.locationRequested) => unit
```

### TelegramWebApp.offLocationRequested

```rescript
let offLocationRequested: (t, Events.locationRequested) => unit
```

### TelegramWebApp.onShareMessageSent

Occurs when the message is successfully shared by the user.

```rescript
let onShareMessageSent: (t, Events.shareMessageSent) => unit
```

### TelegramWebApp.offShareMessageSent

```rescript
let offShareMessageSent: (t, Events.shareMessageSent) => unit
```

### TelegramWebApp.onShareMessageFailed

Occurs if sharing the message fails.

eventHandler receives an object with the single field error, describing the reason for the failure.

```rescript
let onShareMessageFailed: (t, Events.shareMessageFailed) => unit
```

### TelegramWebApp.offShareMessageFailed

```rescript
let offShareMessageFailed: (t, Events.shareMessageFailed) => unit
```

### TelegramWebApp.onEmojiStatusSet

Occurs when the emoji status is successfully set.

```rescript
let onEmojiStatusSet: (t, Events.emojiStatusSet) => unit
```

### TelegramWebApp.offEmojiStatusSet

```rescript
let offEmojiStatusSet: (t, Events.emojiStatusSet) => unit
```

### TelegramWebApp.onEmojiStatusFailed

Occurs if setting the emoji status fails.

eventHandler receives an object with the single field error, describing the reason for the failure.

```rescript
let onEmojiStatusFailed: (t, Events.emojiStatusFailed) => unit
```

### TelegramWebApp.offEmojiStatusFailed

```rescript
let offEmojiStatusFailed: (t, Events.emojiStatusFailed) => unit
```

### TelegramWebApp.onEmojiStatusAccessRequested

Occurs when the write permission was requested.

eventHandler receives an object with the single field status containing one of the statuses

```rescript
let onEmojiStatusAccessRequested: (t, Events.emojiStatusAccessRequested) => unit
```

### TelegramWebApp.offEmojiStatusAccessRequested

```rescript
let offEmojiStatusAccessRequested: (t, Events.emojiStatusAccessRequested) => unit
```

### TelegramWebApp.onFileDownloadRequested

Occurs when the user responds to the file download request.

eventHandler receives an object with the single field status containing one of the statuses.

```rescript
let onFileDownloadRequested: (t, Events.fileDownloadRequested) => unit
```

### TelegramWebApp.offFileDownloadRequested

```rescript
let offFileDownloadRequested: (t, Events.fileDownloadRequested) => unit
```

### TelegramWebApp.onEvent

A method that sets the app event handler.

```rescript
let onEvent: (t, string, unit => unit) => unit
```

### TelegramWebApp.offEvent

A method that deletes a previously set event handler.

```rescript
let offEvent: (t, string, unit => unit) => unit
```

### TelegramWebApp.onEvent1

A method that sets the app event handler.

```rescript
let onEvent1: (t, string, 'a => unit) => unit
```

### TelegramWebApp.offEvent1

A method that deletes a previously set event handler.

```rescript
let offEvent1: (t, string, 'a => unit) => unit
```

### TelegramWebApp.Events.activated

```rescript
type activated = unit => unit
```

### TelegramWebApp.Events.deactivated

```rescript
type deactivated = unit => unit
```

### TelegramWebApp.Events.themeChanged

```rescript
type themeChanged = unit => unit
```

### TelegramWebApp.Events.viewportChangedEvent

```rescript
type viewportChangedEvent = {isStateStable: bool}
```

### TelegramWebApp.Events.viewportChanged

```rescript
type viewportChanged = viewportChangedEvent => unit
```

### TelegramWebApp.Events.safeAreaChanged

```rescript
type safeAreaChanged = unit => unit
```

### TelegramWebApp.Events.contentSafeAreaChanged

```rescript
type contentSafeAreaChanged = unit => unit
```

### TelegramWebApp.Events.mainButtonClicked

```rescript
type mainButtonClicked = unit => unit
```

### TelegramWebApp.Events.secondaryButtonClicked

```rescript
type secondaryButtonClicked = unit => unit
```

### TelegramWebApp.Events.backButtonClicked

```rescript
type backButtonClicked = unit => unit
```

### TelegramWebApp.Events.settingsButtonClicked

```rescript
type settingsButtonClicked = unit => unit
```

### TelegramWebApp.Events.invoiceClosedEvent

```rescript
type invoiceClosedEvent = {
  url: string,
  status: invoiceStatus,
}
```

### TelegramWebApp.Events.invoiceClosed

```rescript
type invoiceClosed = invoiceClosedEvent => unit
```

### TelegramWebApp.Events.popupClosedEvent

```rescript
type popupClosedEvent = {button_id: Null.t<string>}
```

### TelegramWebApp.Events.popupClosed

```rescript
type popupClosed = popupClosedEvent => unit
```

### TelegramWebApp.Events.qrTextReceivedEvent

```rescript
type qrTextReceivedEvent = {data: string}
```

### TelegramWebApp.Events.qrTextReceived

```rescript
type qrTextReceived = qrTextReceivedEvent => unit
```

### TelegramWebApp.Events.scanQrPopupClosed

```rescript
type scanQrPopupClosed = unit => unit
```

### TelegramWebApp.Events.clipboardTextReceivedEvent

```rescript
type clipboardTextReceivedEvent = {data: Null.t<string>}
```

### TelegramWebApp.Events.clipboardTextReceived

```rescript
type clipboardTextReceived = clipboardTextReceivedEvent => unit
```

### TelegramWebApp.Events.writeAccessRequestedStatus

```rescript
@unboxed
type writeAccessRequestedStatus =
  | @as("allowed") Allowed
  | @as("cancelled") Cancelled
  | UndocumentedStatus(string)
```

### TelegramWebApp.Events.writeAccessRequestedEvent

```rescript
type writeAccessRequestedEvent = {
  status: writeAccessRequestedStatus,
}
```

### TelegramWebApp.Events.writeAccessRequested

```rescript
type writeAccessRequested = writeAccessRequestedEvent => unit
```

### TelegramWebApp.Events.contactRequestedStatus

```rescript
@unboxed
type contactRequestedStatus =
  | @as("sent") Sent
  | @as("cancelled") Cancelled
  | UndocumentedStatus(string)
```

### TelegramWebApp.Events.contactRequestedEvent

```rescript
type contactRequestedEvent = {
  status: contactRequestedStatus,
}
```

### TelegramWebApp.Events.contactRequested

```rescript
type contactRequested = contactRequestedEvent => unit
```

### TelegramWebApp.Events.biometricManagerUpdated

```rescript
type biometricManagerUpdated = unit => unit
```

### TelegramWebApp.Events.biometricAuthRequestedEvent

```rescript
type biometricAuthRequestedEvent = {
  isAuthenticated: bool,
  biometricToken?: string,
}
```

### TelegramWebApp.Events.biometricAuthRequested

```rescript
type biometricAuthRequested = biometricAuthRequestedEvent => unit
```

### TelegramWebApp.Events.biometricTokenUpdatedEvent

```rescript
type biometricTokenUpdatedEvent = {isUpdated: bool}
```

### TelegramWebApp.Events.biometricTokenUpdated

```rescript
type biometricTokenUpdated = biometricTokenUpdatedEvent => unit
```

### TelegramWebApp.Events.fullscreenChanged

```rescript
type fullscreenChanged = unit => unit
```

### TelegramWebApp.Events.fullscreenError

```rescript
@unboxed
type fullscreenError =
  | @as("UNSUPPORTED") Unsupported
  | @as("ALREADY_FULLSCREEN") AlreadyFullscreen
  | UndocumentedError(string)
```

### TelegramWebApp.Events.fullscreenFailedEvent

```rescript
type fullscreenFailedEvent = {error: fullscreenError}
```

### TelegramWebApp.Events.fullscreenFailed

```rescript
type fullscreenFailed = fullscreenFailedEvent => unit
```

### TelegramWebApp.Events.homeScreenAdded

```rescript
type homeScreenAdded = unit => unit
```

### TelegramWebApp.Events.homeScreenCheckedEvent

```rescript
type homeScreenCheckedEvent = {status: homeScreenStatus}
```

### TelegramWebApp.Events.homeScreenChecked

```rescript
type homeScreenChecked = homeScreenCheckedEvent => unit
```

### TelegramWebApp.Events.accelerometerStarted

```rescript
type accelerometerStarted = unit => unit
```

### TelegramWebApp.Events.accelerometerStopped

```rescript
type accelerometerStopped = unit => unit
```

### TelegramWebApp.Events.accelerometerChanged

```rescript
type accelerometerChanged = unit => unit
```

### TelegramWebApp.Events.accelerometerFailedError

```rescript
@unboxed
type accelerometerFailedError =
  | @as("UNSUPPORTED") Unsupported
  | UndocumentedError(string)
```

### TelegramWebApp.Events.accelerometerFailedEvent

```rescript
type accelerometerFailedEvent = {
  error: accelerometerFailedError,
}
```

### TelegramWebApp.Events.accelerometerFailed

```rescript
type accelerometerFailed = accelerometerFailedEvent => unit
```

### TelegramWebApp.Events.deviceOrientationStarted

```rescript
type deviceOrientationStarted = unit => unit
```

### TelegramWebApp.Events.deviceOrientationStopped

```rescript
type deviceOrientationStopped = unit => unit
```

### TelegramWebApp.Events.deviceOrientationChanged

```rescript
type deviceOrientationChanged = unit => unit
```

### TelegramWebApp.Events.deviceOrientationFailedError

```rescript
@unboxed
type deviceOrientationFailedError =
  | @as("UNSUPPORTED") Unsupported
  | UndocumentedError(string)
```

### TelegramWebApp.Events.deviceOrientationFailedEvent

```rescript
type deviceOrientationFailedEvent = {
  error: deviceOrientationFailedError,
}
```

### TelegramWebApp.Events.deviceOrientationFailed

```rescript
type deviceOrientationFailed = deviceOrientationFailedEvent => unit
```

### TelegramWebApp.Events.gyroscopeStarted

```rescript
type gyroscopeStarted = unit => unit
```

### TelegramWebApp.Events.gyroscopeStopped

```rescript
type gyroscopeStopped = unit => unit
```

### TelegramWebApp.Events.gyroscopeChanged

```rescript
type gyroscopeChanged = unit => unit
```

### TelegramWebApp.Events.gyroscopeFailedError

```rescript
@unboxed
type gyroscopeFailedError =
  | @as("UNSUPPORTED") Unsupported
  | UndocumentedError(string)
```

### TelegramWebApp.Events.gyroscopeFailedEvent

```rescript
type gyroscopeFailedEvent = {error: gyroscopeFailedError}
```

### TelegramWebApp.Events.gyroscopeFailed

```rescript
type gyroscopeFailed = gyroscopeFailedEvent => unit
```

### TelegramWebApp.Events.locationManagerUpdated

```rescript
type locationManagerUpdated = unit => unit
```

### TelegramWebApp.Events.locationRequestedEvent

```rescript
type locationRequestedEvent = {
  locationData: LocationManager.locationData,
}
```

### TelegramWebApp.Events.locationRequested

```rescript
type locationRequested = locationRequestedEvent => unit
```

### TelegramWebApp.Events.shareMessageSent

```rescript
type shareMessageSent = unit => unit
```

### TelegramWebApp.Events.shareMessageError

```rescript
@unboxed
type shareMessageError =
  | @as("UNSUPPORTED") Unsupported
  | @as("MESSAGE_EXPIRED") MessageExpired
  | @as("MESSAGE_SEND_FAILED") MessageSendFailed
  | @as("USER_DECLINED") UserDeclined
  | @as("UNKNOWN_ERROR") UnknownError
  | UndocumentedError(string)
```

### TelegramWebApp.Events.shareMessageFailedEvent

```rescript
type shareMessageFailedEvent = {error: shareMessageError}
```

### TelegramWebApp.Events.shareMessageFailed

```rescript
type shareMessageFailed = shareMessageFailedEvent => unit
```

### TelegramWebApp.Events.emojiStatusError

```rescript
@unboxed
type emojiStatusError =
  | @as("UNSUPPORTED") Unsupported
  | @as("SUGGESTED_EMOJI_INVALID") SuggestedEmojiInvalid
  | @as("DURATION_INVALID") DurationInvalid
  | @as("USER_DECLINED") UserDeclined
  | @as("SERVER_ERROR") ServerError
  | @as("UNKNOWN_ERROR") UnknownError
  | UndocumentedError(string)
```

### TelegramWebApp.Events.emojiStatusFailedEvent

```rescript
type emojiStatusFailedEvent = {error: emojiStatusError}
```

### TelegramWebApp.Events.emojiStatusSet

```rescript
type emojiStatusSet = unit => unit
```

### TelegramWebApp.Events.emojiStatusFailed

```rescript
type emojiStatusFailed = emojiStatusFailedEvent => unit
```

### TelegramWebApp.Events.emojiStatusAccessStatus

```rescript
@unboxed
type emojiStatusAccessStatus =
  | @as("allowed") Allowed
  | @as("cancelled") Cancelled
  | UndocumentedError(string)
```

### TelegramWebApp.Events.emojiStatusAccessRequestedEvent

```rescript
type emojiStatusAccessRequestedEvent = {
  status: emojiStatusAccessStatus,
}
```

### TelegramWebApp.Events.emojiStatusAccessRequested

```rescript
type emojiStatusAccessRequested = emojiStatusAccessRequestedEvent => unit
```

### TelegramWebApp.Events.fileDownloadStatus

```rescript
@unboxed
type fileDownloadStatus =
  | @as("downloading") Downloading
  | @as("cancelled") Cancelled
  | UndocumentedError(string)
```

### TelegramWebApp.Events.fileDownloadRequestedEvent

```rescript
type fileDownloadRequestedEvent = {
  status: fileDownloadStatus,
}
```

### TelegramWebApp.Events.fileDownloadRequested

```rescript
type fileDownloadRequested = fileDownloadRequestedEvent => unit
```
