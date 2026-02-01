# TelegramWebApp

## WebApp

### WebApp.webAppUser

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

### WebApp.webAppChat

```rescript
type webAppChat = {
  id: int,
  type_: string,
  title: string,
  username?: string,
  photo_url?: string,
}
```

### WebApp.webAppInitDataUnsafe

This object contains data that is transferred to the Mini App when it is opened. It is empty if the Mini App was launched from a keyboard button or from inline mode.

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

### WebApp.colorScheme

```rescript
type colorScheme = @as("light") Light | @as("dark") Dark
```

### WebApp.themeParams

ThemeParams
Mini Apps can adjust the appearance of the interface to match the Telegram user's app in real time. This object contains the user's current theme settings:

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

### WebApp.safeAreaInset

```rescript
type safeAreaInset = {
  top: int,
  bottom: int,
  left: int,
  right: int,
}
```

### WebApp.contentSafeAreaInset

```rescript
type contentSafeAreaInset = {
  top: int,
  bottom: int,
  left: int,
  right: int,
}
```

### WebApp.t

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
  backButton: TelegramWebApp.BackButton.t,
  mainButton: TelegramWebApp.BottomButton.t,
  secondaryButton: TelegramWebApp.BottomButton.t,
  settings: TelegramWebApp.SettingsButton.t,
  hapticFeedback: TelegramWebApp.HapticFeedback.t,
  cloudStorage: TelegramWebApp.CloudStorage.t,
  biometricManager: TelegramWebApp.BiometricManager.t,
  accelerometer: TelegramWebApp.Accelerometer.t,
  deviceOrientation: TelegramWebApp.DeviceOrientation.t,
  gyroscope: TelegramWebApp.Gyroscope.t,
  locationManager: TelegramWebApp.LocationManager.t,
  deviceStorage: TelegramWebApp.DeviceStorage.t,
  secureStorage: TelegramWebApp.SecureStorage.t,
}
```

## WebAppAPI

### WebAppAPI.isVersionAtLeast

Returns true if the user's app supports a version of the Bot API that is equal to or higher than the version passed as the parameter.

```rescript
let isVersionAtLeast: (TelegramWebApp.WebApp.t, string) => bool
```

### WebAppAPI.setHeaderColor

A method that sets the app header color in the #RRGGBB format. You can also use keywords bg_color and secondary_bg_color.

Up to Bot API 6.9 You can only pass Telegram.WebApp.themeParams.bg_color or Telegram.WebApp.themeParams.secondary_bg_color as a color or bg_color, secondary_bg_color keywords.

```rescript
let setHeaderColor: (TelegramWebApp.WebApp.t, string) => unit
```

### WebAppAPI.setBackgroundColor

A method that sets the app background color in the #RRGGBB format. You can also use keywords bg_color and secondary_bg_color.

```rescript
let setBackgroundColor: (TelegramWebApp.WebApp.t, string) => unit
```

### WebAppAPI.setBottomBarColor

A method that sets the app's bottom bar color in the #RRGGBB format. You can also use the keywords bg_color, secondary_bg_color, and bottom_bar_bg_color. This color is also applied to the navigation bar on Android.

```rescript
let setBottomBarColor: (TelegramWebApp.WebApp.t, string) => unit
```

### WebAppAPI.enableClosingConfirmation

A method that enables a confirmation dialog while the user is trying to close the Mini App.

```rescript
let enableClosingConfirmation: TelegramWebApp.WebApp.t => unit
```

### WebAppAPI.disableClosingConfirmation

A method that disables the confirmation dialog while the user is trying to close the Mini App.

```rescript
let disableClosingConfirmation: TelegramWebApp.WebApp.t => unit
```

### WebAppAPI.enableVerticalSwipes

A method that enables vertical swipes to close or minimize the Mini App. For user convenience, it is recommended to always enable swipes unless they conflict with the Mini App's own gestures.

```rescript
let enableVerticalSwipes: TelegramWebApp.WebApp.t => unit
```

### WebAppAPI.disableVerticalSwipes

A method that disables vertical swipes to close or minimize the Mini App. This method is useful if your Mini App uses swipe gestures that may conflict with the gestures for minimizing and closing the app.

```rescript
let disableVerticalSwipes: TelegramWebApp.WebApp.t => unit
```

### WebAppAPI.requestFullscreen

A method that requests opening the Mini App in fullscreen mode. Although the header is transparent in fullscreen mode, it is recommended that the Mini App sets the header color using the setHeaderColor method. This color helps determine a contrasting color for the status bar and other UI controls.

```rescript
let requestFullscreen: TelegramWebApp.WebApp.t => unit
```

### WebAppAPI.exitFullscreen

A method that requests exiting fullscreen mode.

```rescript
let exitFullscreen: TelegramWebApp.WebApp.t => unit
```

### WebAppAPI.lockOrientation

A method that locks the Mini App’s orientation to its current mode (either portrait or landscape). Once locked, the orientation remains fixed, regardless of device rotation. This is useful if a stable orientation is needed during specific interactions.

```rescript
let lockOrientation: TelegramWebApp.WebApp.t => unit
```

### WebAppAPI.unlockOrientation

A method that unlocks the Mini App’s orientation, allowing it to follow the device's rotation freely. Use this to restore automatic orientation adjustments based on the device orientation.

```rescript
let unlockOrientation: TelegramWebApp.WebApp.t => unit
```

### WebAppAPI.addToHomeScreen

A method that prompts the user to add the Mini App to the home screen. After successfully adding the icon, the homeScreenAdded event will be triggered if supported by the device. Note that if the device cannot determine the installation status, the event may not be received even if the icon has been added.

```rescript
let addToHomeScreen: TelegramWebApp.WebApp.t => unit
```

### WebAppAPI.homeScreenStatus

```rescript
type homeScreenStatus =
  | @as("unsupported") Unsupported
  | @as("unknown") Unknown
  | @as("added") Added
  | @as("missed") Missed
  | UndocumentedStatus(string)
```

### WebAppAPI.checkHomeScreenStatus

A method that checks if adding to the home screen is supported and if the Mini App has already been added. If an optional callback parameter is provided, the callback function will be called with a single argument status, which is a string indicating the home screen status.

```rescript
let checkHomeScreenStatus: (
  TelegramWebApp.WebApp.t,
  ~callback: homeScreenStatus => unit=?,
) => unit
```

### WebAppAPI.invoiceStatus

```rescript
@unboxed
type invoiceStatus =
  | @as("paid") Paid
  | @as("cancelled") Cancelled
  | @as("failed") Failed
  | @as("pending") Pending
  | UndocumentedStatus(string)
```

### WebAppAPI.onActivated

Occurs when the Mini App becomes active (e.g., opened from minimized state or selected among tabs).

```rescript
let onActivated: (TelegramWebApp.WebApp.t, Events.activated) => unit
```

### WebAppAPI.offActivated

```rescript
let offActivated: (TelegramWebApp.WebApp.t, Events.activated) => unit
```

### WebAppAPI.onDeactivated

Occurs when the Mini App becomes inactive (e.g., minimized or moved to an inactive tab).

```rescript
let onDeactivated: (TelegramWebApp.WebApp.t, Events.deactivated) => unit
```

### WebAppAPI.offDeactivated

```rescript
let offDeactivated: (TelegramWebApp.WebApp.t, Events.deactivated) => unit
```

### WebAppAPI.onThemeChanged

Occurs whenever theme settings are changed in the user's Telegram app (including switching to night mode).

eventHandler receives no parameters, new theme settings and color scheme can be received via this.themeParams and this.colorScheme respectively.

```rescript
let onThemeChanged: (TelegramWebApp.WebApp.t, Events.themeChanged) => unit
```

### WebAppAPI.offThemeChanged

```rescript
let offThemeChanged: (TelegramWebApp.WebApp.t, Events.themeChanged) => unit
```

### WebAppAPI.onViewportChanged

Occurs when the visible section of the Mini App is changed.

eventHandler receives an object with the single field isStateStable. If isStateStable is true, the resizing of the Mini App is finished. If it is false, the resizing is ongoing (the user is expanding or collapsing the Mini App or an animated object is playing). The current value of the visible section’s height is available in this.viewportHeight.

```rescript
let onViewportChanged: (TelegramWebApp.WebApp.t, Events.viewportChanged) => unit
```

### WebAppAPI.offViewportChanged

```rescript
let offViewportChanged: (TelegramWebApp.WebApp.t, Events.viewportChanged) => unit
```

### WebAppAPI.onSafeAreaChanged

Occurs when the device's safe area insets change (e.g., due to orientation change or screen adjustments).

eventHandler receives no parameters. The current inset values can be accessed via this.safeAreaInset.

```rescript
let onSafeAreaChanged: (TelegramWebApp.WebApp.t, Events.safeAreaChanged) => unit
```

### WebAppAPI.offSafeAreaChanged

```rescript
let offSafeAreaChanged: (TelegramWebApp.WebApp.t, Events.safeAreaChanged) => unit
```

### WebAppAPI.onContentSafeAreaChanged

Occurs when the safe area for content changes (e.g., due to orientation change or screen adjustments).

eventHandler receives no parameters. The current inset values can be accessed via this.contentSafeAreaInset.

```rescript
let onContentSafeAreaChanged: (
  TelegramWebApp.WebApp.t,
  Events.contentSafeAreaChanged,
) => unit
```

### WebAppAPI.offContentSafeAreaChanged

```rescript
let offContentSafeAreaChanged: (
  TelegramWebApp.WebApp.t,
  Events.contentSafeAreaChanged,
) => unit
```

### WebAppAPI.onMainButtonClicked

Occurs when the main button is pressed.

```rescript
let onMainButtonClicked: (TelegramWebApp.WebApp.t, Events.mainButtonClicked) => unit
```

### WebAppAPI.offMainButtonClicked

```rescript
let offMainButtonClicked: (TelegramWebApp.WebApp.t, Events.mainButtonClicked) => unit
```

### WebAppAPI.onSecondaryButtonClicked

Occurs when the secondary button is pressed.

```rescript
let onSecondaryButtonClicked: (
  TelegramWebApp.WebApp.t,
  Events.secondaryButtonClicked,
) => unit
```

### WebAppAPI.offSecondaryButtonClicked

```rescript
let offSecondaryButtonClicked: (
  TelegramWebApp.WebApp.t,
  Events.secondaryButtonClicked,
) => unit
```

### WebAppAPI.onBackButtonClicked

Occurrs when the back button is pressed.

```rescript
let onBackButtonClicked: (TelegramWebApp.WebApp.t, Events.backButtonClicked) => unit
```

### WebAppAPI.offBackButtonClicked

```rescript
let offBackButtonClicked: (TelegramWebApp.WebApp.t, Events.backButtonClicked) => unit
```

### WebAppAPI.onSettingsButtonClicked

Occurrs when the Settings item in context menu is pressed.

```rescript
let onSettingsButtonClicked: (
  TelegramWebApp.WebApp.t,
  Events.settingsButtonClicked,
) => unit
```

### WebAppAPI.offSettingsButtonClicked

```rescript
let offSettingsButtonClicked: (
  TelegramWebApp.WebApp.t,
  Events.settingsButtonClicked,
) => unit
```

### WebAppAPI.onInvoiceClosed

Occurrs when the opened invoice is closed.

eventHandler receives an object with the two fields: url – invoice link provided and status – one of the invoice statuses.

```rescript
let onInvoiceClosed: (TelegramWebApp.WebApp.t, Events.invoiceClosed) => unit
```

### WebAppAPI.offInvoiceClosed

```rescript
let offInvoiceClosed: (TelegramWebApp.WebApp.t, Events.invoiceClosed) => unit
```

### WebAppAPI.onPopupClosed

Occurrs when the opened popup is closed.

eventHandler receives an object with the single field button_id – the value of the field id of the pressed button. If no buttons were pressed, the field button_id will be null.

```rescript
let onPopupClosed: (TelegramWebApp.WebApp.t, Events.popupClosed) => unit
```

### WebAppAPI.offPopupClosed

```rescript
let offPopupClosed: (TelegramWebApp.WebApp.t, Events.popupClosed) => unit
```

### WebAppAPI.onQrTextReceived

Occurs when the QR code scanner catches a code with text data.

eventHandler receives an object with the single field data containing text data from the QR code.

```rescript
let onQrTextReceived: (TelegramWebApp.WebApp.t, Events.qrTextReceived) => unit
```

### WebAppAPI.offQrTextReceived

```rescript
let offQrTextReceived: (TelegramWebApp.WebApp.t, Events.qrTextReceived) => unit
```

### WebAppAPI.onScanQrPopupClosed

Occurs when the QR code scanner popup is closed by the user.

```rescript
let onScanQrPopupClosed: (TelegramWebApp.WebApp.t, Events.scanQrPopupClosed) => unit
```

### WebAppAPI.offScanQrPopupClosed

```rescript
let offScanQrPopupClosed: (TelegramWebApp.WebApp.t, Events.scanQrPopupClosed) => unit
```

### WebAppAPI.onClipboardTextReceived

Occurrs when the readTextFromClipboard method is called.

eventHandler receives an object with the single field data containing text data from the clipboard. If the clipboard contains non-text data, the field data will be an empty string. If the Mini App has no access to the clipboard, the field data will be null.

```rescript
let onClipboardTextReceived: (
  TelegramWebApp.WebApp.t,
  Events.clipboardTextReceived,
) => unit
```

### WebAppAPI.offClipboardTextReceived

```rescript
let offClipboardTextReceived: (
  TelegramWebApp.WebApp.t,
  Events.clipboardTextReceived,
) => unit
```

### WebAppAPI.onWriteAccessRequested

Occurs when the write permission was requested.

eventHandler receives an object with the single field status containing one of the statuses.

```rescript
let onWriteAccessRequested: (
  TelegramWebApp.WebApp.t,
  Events.writeAccessRequested,
) => unit
```

### WebAppAPI.offWriteAccessRequested

```rescript
let offWriteAccessRequested: (
  TelegramWebApp.WebApp.t,
  Events.writeAccessRequested,
) => unit
```

### WebAppAPI.onContactRequested

Occurrs when the user's phone number was requested.

eventHandler receives an object with the single field status containing one of the statuses.

```rescript
let onContactRequested: (TelegramWebApp.WebApp.t, Events.contactRequested) => unit
```

### WebAppAPI.offContactRequested

```rescript
let offContactRequested: (TelegramWebApp.WebApp.t, Events.contactRequested) => unit
```

### WebAppAPI.onBiometricManagerUpdated

Occurs whenever BiometricManager object is changed.

```rescript
let onBiometricManagerUpdated: (
  TelegramWebApp.WebApp.t,
  Events.biometricManagerUpdated,
) => unit
```

### WebAppAPI.offBiometricManagerUpdated

```rescript
let offBiometricManagerUpdated: (
  TelegramWebApp.WebApp.t,
  Events.biometricManagerUpdated,
) => unit
```

### WebAppAPI.onBiometricAuthRequested

Occurs whenever biometric authentication was requested.

eventHandler receives an object with the field isAuthenticated containing a boolean indicating whether the user was authenticated successfully. If isAuthenticated is true, the field biometricToken will contain the biometric token stored in secure storage on the device.

```rescript
let onBiometricAuthRequested: (
  TelegramWebApp.WebApp.t,
  Events.biometricAuthRequested,
) => unit
```

### WebAppAPI.offBiometricAuthRequested

```rescript
let offBiometricAuthRequested: (
  TelegramWebApp.WebApp.t,
  Events.biometricAuthRequested,
) => unit
```

### WebAppAPI.onBiometricTokenUpdated

Occurs whenever the biometric token was updated.

eventHandler receives an object with the single field isUpdated, containing a boolean indicating whether the token was updated.

```rescript
let onBiometricTokenUpdated: (
  TelegramWebApp.WebApp.t,
  Events.biometricTokenUpdated,
) => unit
```

### WebAppAPI.offBiometricTokenUpdated

```rescript
let offBiometricTokenUpdated: (
  TelegramWebApp.WebApp.t,
  Events.biometricTokenUpdated,
) => unit
```

### WebAppAPI.onFullscreenChanged

Occurs whenever the Mini App enters or exits fullscreen mode.

eventHandler receives no parameters. The current fullscreen state can be checked via this.isFullscreen.

```rescript
let onFullscreenChanged: (TelegramWebApp.WebApp.t, Events.fullscreenChanged) => unit
```

### WebAppAPI.offFullscreenChanged

```rescript
let offFullscreenChanged: (TelegramWebApp.WebApp.t, Events.fullscreenChanged) => unit
```

### WebAppAPI.onFullscreenFailed

Occurs if a request to enter fullscreen mode fails.

eventHandler receives an object with the single field error, describing the reason for the failure.

```rescript
let onFullscreenFailed: (TelegramWebApp.WebApp.t, Events.fullscreenFailed) => unit
```

### WebAppAPI.offFullscreenFailed

```rescript
let offFullscreenFailed: (TelegramWebApp.WebApp.t, Events.fullscreenFailed) => unit
```

### WebAppAPI.onHomeScreenAdded

Occurs when the Mini App is successfully added to the home screen.

```rescript
let onHomeScreenAdded: (TelegramWebApp.WebApp.t, Events.homeScreenAdded) => unit
```

### WebAppAPI.offHomeScreenAdded

```rescript
let offHomeScreenAdded: (TelegramWebApp.WebApp.t, Events.homeScreenAdded) => unit
```

### WebAppAPI.onHomeScreenChecked

Occurs after checking the home screen status.

eventHandler receives an object with the field status, which is a string indicating the current home screen status.

```rescript
let onHomeScreenChecked: (TelegramWebApp.WebApp.t, Events.homeScreenChecked) => unit
```

### WebAppAPI.offHomeScreenChecked

```rescript
let offHomeScreenChecked: (TelegramWebApp.WebApp.t, Events.homeScreenChecked) => unit
```

### WebAppAPI.onAccelerometerStarted

Occurs when accelerometer tracking has started successfully.

```rescript
let onAccelerometerStarted: (
  TelegramWebApp.WebApp.t,
  Events.accelerometerStarted,
) => unit
```

### WebAppAPI.offAccelerometerStarted

```rescript
let offAccelerometerStarted: (
  TelegramWebApp.WebApp.t,
  Events.accelerometerStarted,
) => unit
```

### WebAppAPI.onAccelerometerStopped

Occurs when accelerometer tracking has stopped.

```rescript
let onAccelerometerStopped: (
  TelegramWebApp.WebApp.t,
  Events.accelerometerStopped,
) => unit
```

### WebAppAPI.offAccelerometerStopped

```rescript
let offAccelerometerStopped: (
  TelegramWebApp.WebApp.t,
  Events.accelerometerStopped,
) => unit
```

### WebAppAPI.onAccelerometerChanged

Occurs with the specified frequency after calling the start method, sending the current accelerometer data.

eventHandler receives no parameters, the current acceleration values can be received via this.x, this.y and this.z respectively.

```rescript
let onAccelerometerChanged: (
  TelegramWebApp.WebApp.t,
  Events.accelerometerChanged,
) => unit
```

### WebAppAPI.offAccelerometerChanged

```rescript
let offAccelerometerChanged: (
  TelegramWebApp.WebApp.t,
  Events.accelerometerChanged,
) => unit
```

### WebAppAPI.onAccelerometerFailed

Occurs if a request to start accelerometer tracking fails.

eventHandler receives an object with the single field error, describing the reason for the failure.

```rescript
let onAccelerometerFailed: (
  TelegramWebApp.WebApp.t,
  Events.accelerometerFailed,
) => unit
```

### WebAppAPI.offAccelerometerFailed

```rescript
let offAccelerometerFailed: (
  TelegramWebApp.WebApp.t,
  Events.accelerometerFailed,
) => unit
```

### WebAppAPI.onDeviceOrientationStarted

Occurs when device orientation tracking has started successfully.

```rescript
let onDeviceOrientationStarted: (
  TelegramWebApp.WebApp.t,
  Events.deviceOrientationStarted,
) => unit
```

### WebAppAPI.offDeviceOrientationStarted

```rescript
let offDeviceOrientationStarted: (
  TelegramWebApp.WebApp.t,
  Events.deviceOrientationStarted,
) => unit
```

### WebAppAPI.onDeviceOrientationStopped

Occurs when device orientation tracking has stopped.

```rescript
let onDeviceOrientationStopped: (
  TelegramWebApp.WebApp.t,
  Events.deviceOrientationStopped,
) => unit
```

### WebAppAPI.offDeviceOrientationStopped

```rescript
let offDeviceOrientationStopped: (
  TelegramWebApp.WebApp.t,
  Events.deviceOrientationStopped,
) => unit
```

### WebAppAPI.onDeviceOrientationChanged

Occurs with the specified frequency after calling the start method, sending the current orientation data.

eventHandler receives no parameters, the current device orientation values can be received via this.alpha, this.beta and this.gamma respectively.

```rescript
let onDeviceOrientationChanged: (
  TelegramWebApp.WebApp.t,
  Events.deviceOrientationChanged,
) => unit
```

### WebAppAPI.offDeviceOrientationChanged

```rescript
let offDeviceOrientationChanged: (
  TelegramWebApp.WebApp.t,
  Events.deviceOrientationChanged,
) => unit
```

### WebAppAPI.onDeviceOrientationFailed

Occurs if a request to start device orientation tracking fails.

eventHandler receives an object with the single field error, describing the reason for the failure.

```rescript
let onDeviceOrientationFailed: (
  TelegramWebApp.WebApp.t,
  Events.deviceOrientationFailed,
) => unit
```

### WebAppAPI.offDeviceOrientationFailed

```rescript
let offDeviceOrientationFailed: (
  TelegramWebApp.WebApp.t,
  Events.deviceOrientationFailed,
) => unit
```

### WebAppAPI.onGyroscopeStarted

Occurs when gyroscope tracking has started successfully.

```rescript
let onGyroscopeStarted: (TelegramWebApp.WebApp.t, Events.gyroscopeStarted) => unit
```

### WebAppAPI.offGyroscopeStarted

```rescript
let offGyroscopeStarted: (TelegramWebApp.WebApp.t, Events.gyroscopeStarted) => unit
```

### WebAppAPI.onGyroscopeStopped

Occurs when gyroscope tracking has stopped.

```rescript
let onGyroscopeStopped: (TelegramWebApp.WebApp.t, Events.gyroscopeStopped) => unit
```

### WebAppAPI.offGyroscopeStopped

```rescript
let offGyroscopeStopped: (TelegramWebApp.WebApp.t, Events.gyroscopeStopped) => unit
```

### WebAppAPI.onGyroscopeChanged

Occurs with the specified frequency after calling the start method, sending the current gyroscope data.

eventHandler receives no parameters, the current rotation rates can be received via this.x, this.y and this.z respectively.

```rescript
let onGyroscopeChanged: (TelegramWebApp.WebApp.t, Events.gyroscopeChanged) => unit
```

### WebAppAPI.offGyroscopeChanged

```rescript
let offGyroscopeChanged: (TelegramWebApp.WebApp.t, Events.gyroscopeChanged) => unit
```

### WebAppAPI.onGyroscopeFailed

Occurs if a request to start gyroscope tracking fails.

eventHandler receives an object with the single field error, describing the reason for the failure.

```rescript
let onGyroscopeFailed: (TelegramWebApp.WebApp.t, Events.gyroscopeFailed) => unit
```

### WebAppAPI.offGyroscopeFailed

```rescript
let offGyroscopeFailed: (TelegramWebApp.WebApp.t, Events.gyroscopeFailed) => unit
```

### WebAppAPI.onLocationManagerUpdated

Occurs whenever LocationManager object is changed.

```rescript
let onLocationManagerUpdated: (
  TelegramWebApp.WebApp.t,
  Events.locationManagerUpdated,
) => unit
```

### WebAppAPI.offLocationManagerUpdated

```rescript
let offLocationManagerUpdated: (
  TelegramWebApp.WebApp.t,
  Events.locationManagerUpdated,
) => unit
```

### WebAppAPI.onLocationRequested

Occurs when location data is requested.

eventHandler receives an object with the single field locationData of type LocationData, containing the current location information.

```rescript
let onLocationRequested: (TelegramWebApp.WebApp.t, Events.locationRequested) => unit
```

### WebAppAPI.offLocationRequested

```rescript
let offLocationRequested: (TelegramWebApp.WebApp.t, Events.locationRequested) => unit
```

### WebAppAPI.onShareMessageSent

Occurs when the message is successfully shared by the user.

```rescript
let onShareMessageSent: (TelegramWebApp.WebApp.t, Events.shareMessageSent) => unit
```

### WebAppAPI.offShareMessageSent

```rescript
let offShareMessageSent: (TelegramWebApp.WebApp.t, Events.shareMessageSent) => unit
```

### WebAppAPI.onShareMessageFailed

Occurs if sharing the message fails.

eventHandler receives an object with the single field error, describing the reason for the failure.

```rescript
let onShareMessageFailed: (TelegramWebApp.WebApp.t, Events.shareMessageFailed) => unit
```

### WebAppAPI.offShareMessageFailed

```rescript
let offShareMessageFailed: (TelegramWebApp.WebApp.t, Events.shareMessageFailed) => unit
```

### WebAppAPI.onEmojiStatusSet

Occurs when the emoji status is successfully set.

```rescript
let onEmojiStatusSet: (TelegramWebApp.WebApp.t, Events.emojiStatusSet) => unit
```

### WebAppAPI.offEmojiStatusSet

```rescript
let offEmojiStatusSet: (TelegramWebApp.WebApp.t, Events.emojiStatusSet) => unit
```

### WebAppAPI.onEmojiStatusFailed

Occurs if setting the emoji status fails.

eventHandler receives an object with the single field error, describing the reason for the failure.

```rescript
let onEmojiStatusFailed: (TelegramWebApp.WebApp.t, Events.emojiStatusFailed) => unit
```

### WebAppAPI.offEmojiStatusFailed

```rescript
let offEmojiStatusFailed: (TelegramWebApp.WebApp.t, Events.emojiStatusFailed) => unit
```

### WebAppAPI.onEmojiStatusAccessRequested

Occurs when the write permission was requested.

eventHandler receives an object with the single field status containing one of the statuses

```rescript
let onEmojiStatusAccessRequested: (
  TelegramWebApp.WebApp.t,
  Events.emojiStatusAccessRequested,
) => unit
```

### WebAppAPI.offEmojiStatusAccessRequested

```rescript
let offEmojiStatusAccessRequested: (
  TelegramWebApp.WebApp.t,
  Events.emojiStatusAccessRequested,
) => unit
```

### WebAppAPI.onFileDownloadRequested

Occurs when the user responds to the file download request.

eventHandler receives an object with the single field status containing one of the statuses.

```rescript
let onFileDownloadRequested: (
  TelegramWebApp.WebApp.t,
  Events.fileDownloadRequested,
) => unit
```

### WebAppAPI.offFileDownloadRequested

```rescript
let offFileDownloadRequested: (
  TelegramWebApp.WebApp.t,
  Events.fileDownloadRequested,
) => unit
```

### WebAppAPI.onEvent

A method that sets the app event handler.

```rescript
let onEvent: (TelegramWebApp.WebApp.t, string, unit => unit) => unit
```

### WebAppAPI.offEvent

A method that deletes a previously set event handler.

```rescript
let offEvent: (TelegramWebApp.WebApp.t, string, unit => unit) => unit
```

### WebAppAPI.onEvent1

A method that sets the app event handler.

```rescript
let onEvent1: (TelegramWebApp.WebApp.t, string, 'a => unit) => unit
```

### WebAppAPI.offEvent1

A method that deletes a previously set event handler.

```rescript
let offEvent1: (TelegramWebApp.WebApp.t, string, 'a => unit) => unit
```

### WebAppAPI.sendData

A method used to send data to the bot. When this method is called, a service message is sent to the bot containing the data data of the length up to 4096 bytes, and the Mini App is closed. See the field web_app_data in the class Message.

This method is only available for Mini Apps launched via a Keyboard button.

```rescript
let sendData: (TelegramWebApp.WebApp.t, string) => unit
```

### WebAppAPI.chooseChatType

```rescript
type chooseChatType =
  | @as("users") Users
  | @as("bots") Bots
  | @as("groups") Groups
  | @as("channels") Channels
```

### WebAppAPI.switchInlineQuery

A method that inserts the bot's username and the specified inline query in the current chat's input field. Query may be empty, in which case only the bot's username will be inserted. If an optional choose_chat_types parameter was passed, the client prompts the user to choose a specific chat, then opens that chat and inserts the bot's username and the specified inline query in the input field. You can specify which types of chats the user will be able to choose from.

```rescript
let switchInlineQuery: (
  TelegramWebApp.WebApp.t,
  string,
  ~choose_chat_types: array<chooseChatType>=?,
) => unit
```

### WebAppAPI.openLinkOptions

```rescript
type openLinkOptions = {try_instant_view: bool}
```

### WebAppAPI.openLink

A method that opens a link in an external browser. The Mini App will not be closed.

Bot API 6.4+ If the optional options parameter is passed with the field try_instant_view=true, the link will be opened in Instant View mode if possible.

Note that this method can be called only in response to user interaction with the Mini App interface (e.g. a click inside the Mini App or on the main button)

```rescript
let openLink: (
  TelegramWebApp.WebApp.t,
  string,
  ~options: openLinkOptions=?,
) => unit
```

### WebAppAPI.openTelegramLink

A method that opens a telegram link inside the Telegram app. The Mini App will not be closed after this method is called.

Up to Bot API 7.0 The Mini App will be closed after this method is called.

```rescript
let openTelegramLink: (TelegramWebApp.WebApp.t, string) => unit
```

### WebAppAPI.openInvoice

A method that opens an invoice using the link url. The Mini App will receive the event invoiceClosed when the invoice is closed. If an optional callback parameter was passed, the callback function will be called and the invoice status will be passed as the first argument.

```rescript
let openInvoice: (
  TelegramWebApp.WebApp.t,
  string,
  ~callback: invoiceStatus => unit=?,
) => unit
```

### WebAppAPI.storyWidgetLink

```rescript
type storyWidgetLink = {url: string, name?: string}
```

### WebAppAPI.shareToStoryParams

```rescript
type shareToStoryParams = {
  text?: string,
  widget_link?: storyWidgetLink,
}
```

### WebAppAPI.shareToStory

A method that opens the native story editor with the media specified in the media_url parameter as an HTTPS URL. An optional params argument of the type StoryShareParams describes additional sharing settings.

```rescript
let shareToStory: (
  TelegramWebApp.WebApp.t,
  string,
  ~params: shareToStoryParams=?,
) => unit
```

### WebAppAPI.shareMessage

A method that opens a dialog allowing the user to share a message provided by the bot. If an optional callback parameter is provided, the callback function will be called with a boolean as the first argument, indicating whether the message was successfully sent. The message id passed to this method must belong to a PreparedInlineMessage previously obtained via the Bot API method savePreparedInlineMessage.

```rescript
let shareMessage: (
  TelegramWebApp.WebApp.t,
  string,
  ~callback: bool => unit=?,
) => unit
```

### WebAppAPI.emojiStatusParams

```rescript
type emojiStatusParams = {duration?: int}
```

### WebAppAPI.setEmojiStatus

A method that opens a dialog allowing the user to set the specified custom emoji as their status. An optional params argument of type EmojiStatusParams specifies additional settings, such as duration. If an optional callback parameter is provided, the callback function will be called with a boolean as the first argument, indicating whether the status was set.

Note: this method opens a native dialog and cannot be used to set the emoji status without manual user interaction. For fully programmatic changes, you should instead use the Bot API method setUserEmojiStatus after obtaining authorization to do so via the Mini App method requestEmojiStatusAccess.

```rescript
let setEmojiStatus: (
  TelegramWebApp.WebApp.t,
  string,
  ~params: emojiStatusParams=?,
  ~callback: bool => unit=?,
) => unit
```

### WebAppAPI.requestEmojiStatusAccess

A method that shows a native popup requesting permission for the bot to manage user's emoji status. If an optional callback parameter was passed, the callback function will be called when the popup is closed and the first argument will be a boolean indicating whether the user granted this access.

```rescript
let requestEmojiStatusAccess: (TelegramWebApp.WebApp.t, ~callback: bool => unit=?) => unit
```

### WebAppAPI.downloadFileParams

```rescript
type downloadFileParams = {url: string, file_name: string}
```

### WebAppAPI.downloadFile

A method that displays a native popup prompting the user to download a file specified by the params argument of type DownloadFileParams. If an optional callback parameter is provided, the callback function will be called when the popup is closed, with the first argument as a boolean indicating whether the user accepted the download request.

```rescript
let downloadFile: (
  TelegramWebApp.WebApp.t,
  ~params: downloadFileParams=?,
  ~callback: bool => unit=?,
) => unit
```

### WebAppAPI.hideKeyboard

A method that hides the on-screen keyboard, if it is currently visible. Does nothing if the keyboard is not active.

```rescript
let hideKeyboard: TelegramWebApp.WebApp.t => unit
```

### WebAppAPI.popupButtonType

```rescript
type popupButtonType =
  | @as("default") Default
  | @as("ok") Ok
  | @as("close") Close
  | @as("cancel") Cancel
  | @as("destructive") Destructive
```

### WebAppAPI.popupButton

```rescript
type popupButton = {
  id?: string,
  type_?: popupButtonType,
  text?: string,
}
```

### WebAppAPI.popupParams

```rescript
type popupParams = {
  title?: string,
  message: string,
  buttons: array<popupButton>,
}
```

### WebAppAPI.showPopup

A method that shows a native popup described by the params argument of the type PopupParams. The Mini App will receive the event popupClosed when the popup is closed. If an optional callback parameter was passed, the callback function will be called and the field id of the pressed button will be passed as the first argument.

```rescript
let showPopup: (
  TelegramWebApp.WebApp.t,
  ~params: popupParams=?,
  ~callback: string => unit=?,
) => unit
```

### WebAppAPI.showAlert

A method that shows message in a simple alert with a 'Close' button. If an optional callback parameter was passed, the callback function will be called when the popup is closed.

```rescript
let showAlert: (
  TelegramWebApp.WebApp.t,
  string,
  ~callback: unit => unit=?,
) => unit
```

### WebAppAPI.showConfirm

A method that shows message in a simple confirmation window with 'OK' and 'Cancel' buttons. If an optional callback parameter was passed, the callback function will be called when the popup is closed and the first argument will be a boolean indicating whether the user pressed the 'OK' button.

```rescript
let showConfirm: (
  TelegramWebApp.WebApp.t,
  string,
  ~callback: bool => unit=?,
) => unit
```

### WebAppAPI.scanQrPopupParams

```rescript
type scanQrPopupParams = {text?: string}
```

### WebAppAPI.showScanQrPopup

A method that shows a native popup for scanning a QR code described by the params argument of the type ScanQrPopupParams. The Mini App will receive the event qrTextReceived every time the scanner catches a code with text data. If an optional callback parameter was passed, the callback function will be called and the text from the QR code will be passed as the first argument. Returning true inside this callback function causes the popup to be closed. Starting from Bot API 7.7, the Mini App will receive the scanQrPopupClosed event if the user closes the native popup for scanning a QR code.

```rescript
let showScanQrPopup: (
  TelegramWebApp.WebApp.t,
  ~params: scanQrPopupParams,
  ~callback: string => bool=?,
) => unit
```

### WebAppAPI.closeScanQrPopup

A method that closes the native popup for scanning a QR code opened with the showScanQrPopup method. Run it if you received valid data in the event qrTextReceived.

```rescript
let closeScanQrPopup: TelegramWebApp.WebApp.t => unit
```

### WebAppAPI.readTextFromClipboard

A method that requests text from the clipboard. The Mini App will receive the event clipboardTextReceived. If an optional callback parameter was passed, the callback function will be called and the text from the clipboard will be passed as the first argument.

Note: this method can be called only for Mini Apps launched from the attachment menu and only in response to a user interaction with the Mini App interface (e.g. a click inside the Mini App or on the main button).

```rescript
let readTextFromClipboard: (
  TelegramWebApp.WebApp.t,
  ~callback: string => unit=?,
) => unit
```

### WebAppAPI.requestWriteAccess

A method that shows a native popup requesting permission for the bot to send messages to the user. If an optional callback parameter was passed, the callback function will be called when the popup is closed and the first argument will be a boolean indicating whether the user granted this access.

```rescript
let requestWriteAccess: (TelegramWebApp.WebApp.t, ~callback: bool => unit=?) => unit
```

### WebAppAPI.requestContact

A method that shows a native popup prompting the user for their phone number. If an optional callback parameter was passed, the callback function will be called when the popup is closed and the first argument will be a boolean indicating whether the user shared its phone number.

```rescript
let requestContact: (TelegramWebApp.WebApp.t, ~callback: bool => unit=?) => unit
```

### WebAppAPI.ready

A method that informs the Telegram app that the Mini App is ready to be displayed.

It is recommended to call this method as early as possible, as soon as all essential interface elements are loaded. Once this method is called, the loading placeholder is hidden and the Mini App is shown.

If the method is not called, the placeholder will be hidden only when the page is fully loaded.

```rescript
let ready: TelegramWebApp.WebApp.t => unit
```

### WebAppAPI.expand

A method that expands the Mini App to the maximum available height. To find out if the Mini App is expanded to the maximum height, refer to the value of the Telegram.WebApp.isExpanded parameter

```rescript
let expand: TelegramWebApp.WebApp.t => unit
```

### WebAppAPI.close

A method that closes the Mini App.

```rescript
let close: TelegramWebApp.WebApp.t => unit
```

## Events

### WebAppAPI.Events.activated

```rescript
type activated = unit => unit
```

### WebAppAPI.Events.deactivated

```rescript
type deactivated = unit => unit
```

### WebAppAPI.Events.themeChanged

```rescript
type themeChanged = unit => unit
```

### WebAppAPI.Events.viewportChangedEvent

```rescript
type viewportChangedEvent = {isStateStable: bool}
```

### WebAppAPI.Events.viewportChanged

```rescript
type viewportChanged = viewportChangedEvent => unit
```

### WebAppAPI.Events.safeAreaChanged

```rescript
type safeAreaChanged = unit => unit
```

### WebAppAPI.Events.contentSafeAreaChanged

```rescript
type contentSafeAreaChanged = unit => unit
```

### WebAppAPI.Events.mainButtonClicked

```rescript
type mainButtonClicked = unit => unit
```

### WebAppAPI.Events.secondaryButtonClicked

```rescript
type secondaryButtonClicked = unit => unit
```

### WebAppAPI.Events.backButtonClicked

```rescript
type backButtonClicked = unit => unit
```

### WebAppAPI.Events.settingsButtonClicked

```rescript
type settingsButtonClicked = unit => unit
```

### WebAppAPI.Events.invoiceClosedEvent

```rescript
type invoiceClosedEvent = {
  url: string,
  status: invoiceStatus,
}
```

### WebAppAPI.Events.invoiceClosed

```rescript
type invoiceClosed = invoiceClosedEvent => unit
```

### WebAppAPI.Events.popupClosedEvent

```rescript
type popupClosedEvent = {button_id: Null.t<string>}
```

### WebAppAPI.Events.popupClosed

```rescript
type popupClosed = popupClosedEvent => unit
```

### WebAppAPI.Events.qrTextReceivedEvent

```rescript
type qrTextReceivedEvent = {data: string}
```

### WebAppAPI.Events.qrTextReceived

```rescript
type qrTextReceived = qrTextReceivedEvent => unit
```

### WebAppAPI.Events.scanQrPopupClosed

```rescript
type scanQrPopupClosed = unit => unit
```

### WebAppAPI.Events.clipboardTextReceivedEvent

```rescript
type clipboardTextReceivedEvent = {data: Null.t<string>}
```

### WebAppAPI.Events.clipboardTextReceived

```rescript
type clipboardTextReceived = clipboardTextReceivedEvent => unit
```

### WebAppAPI.Events.writeAccessRequestedStatus

```rescript
@unboxed
type writeAccessRequestedStatus =
  | @as("allowed") Allowed
  | @as("cancelled") Cancelled
  | UndocumentedStatus(string)
```

### WebAppAPI.Events.writeAccessRequestedEvent

```rescript
type writeAccessRequestedEvent = {
  status: writeAccessRequestedStatus,
}
```

### WebAppAPI.Events.writeAccessRequested

```rescript
type writeAccessRequested = writeAccessRequestedEvent => unit
```

### WebAppAPI.Events.contactRequestedStatus

```rescript
@unboxed
type contactRequestedStatus =
  | @as("sent") Sent
  | @as("cancelled") Cancelled
  | UndocumentedStatus(string)
```

### WebAppAPI.Events.contactRequestedEvent

```rescript
type contactRequestedEvent = {
  status: contactRequestedStatus,
}
```

### WebAppAPI.Events.contactRequested

```rescript
type contactRequested = contactRequestedEvent => unit
```

### WebAppAPI.Events.biometricManagerUpdated

```rescript
type biometricManagerUpdated = unit => unit
```

### WebAppAPI.Events.biometricAuthRequestedEvent

```rescript
type biometricAuthRequestedEvent = {
  isAuthenticated: bool,
  biometricToken?: string,
}
```

### WebAppAPI.Events.biometricAuthRequested

```rescript
type biometricAuthRequested = biometricAuthRequestedEvent => unit
```

### WebAppAPI.Events.biometricTokenUpdatedEvent

```rescript
type biometricTokenUpdatedEvent = {isUpdated: bool}
```

### WebAppAPI.Events.biometricTokenUpdated

```rescript
type biometricTokenUpdated = biometricTokenUpdatedEvent => unit
```

### WebAppAPI.Events.fullscreenChanged

```rescript
type fullscreenChanged = unit => unit
```

### WebAppAPI.Events.fullscreenError

```rescript
@unboxed
type fullscreenError =
  | @as("UNSUPPORTED") Unsupported
  | @as("ALREADY_FULLSCREEN") AlreadyFullscreen
  | UndocumentedError(string)
```

### WebAppAPI.Events.fullscreenFailedEvent

```rescript
type fullscreenFailedEvent = {error: fullscreenError}
```

### WebAppAPI.Events.fullscreenFailed

```rescript
type fullscreenFailed = fullscreenFailedEvent => unit
```

### WebAppAPI.Events.homeScreenAdded

```rescript
type homeScreenAdded = unit => unit
```

### WebAppAPI.Events.homeScreenCheckedEvent

```rescript
type homeScreenCheckedEvent = {status: homeScreenStatus}
```

### WebAppAPI.Events.homeScreenChecked

```rescript
type homeScreenChecked = homeScreenCheckedEvent => unit
```

### WebAppAPI.Events.accelerometerStarted

```rescript
type accelerometerStarted = unit => unit
```

### WebAppAPI.Events.accelerometerStopped

```rescript
type accelerometerStopped = unit => unit
```

### WebAppAPI.Events.accelerometerChanged

```rescript
type accelerometerChanged = unit => unit
```

### WebAppAPI.Events.accelerometerFailedError

```rescript
@unboxed
type accelerometerFailedError =
  | @as("UNSUPPORTED") Unsupported
  | UndocumentedError(string)
```

### WebAppAPI.Events.accelerometerFailedEvent

```rescript
type accelerometerFailedEvent = {
  error: accelerometerFailedError,
}
```

### WebAppAPI.Events.accelerometerFailed

```rescript
type accelerometerFailed = accelerometerFailedEvent => unit
```

### WebAppAPI.Events.deviceOrientationStarted

```rescript
type deviceOrientationStarted = unit => unit
```

### WebAppAPI.Events.deviceOrientationStopped

```rescript
type deviceOrientationStopped = unit => unit
```

### WebAppAPI.Events.deviceOrientationChanged

```rescript
type deviceOrientationChanged = unit => unit
```

### WebAppAPI.Events.deviceOrientationFailedError

```rescript
@unboxed
type deviceOrientationFailedError =
  | @as("UNSUPPORTED") Unsupported
  | UndocumentedError(string)
```

### WebAppAPI.Events.deviceOrientationFailedEvent

```rescript
type deviceOrientationFailedEvent = {
  error: deviceOrientationFailedError,
}
```

### WebAppAPI.Events.deviceOrientationFailed

```rescript
type deviceOrientationFailed = deviceOrientationFailedEvent => unit
```

### WebAppAPI.Events.gyroscopeStarted

```rescript
type gyroscopeStarted = unit => unit
```

### WebAppAPI.Events.gyroscopeStopped

```rescript
type gyroscopeStopped = unit => unit
```

### WebAppAPI.Events.gyroscopeChanged

```rescript
type gyroscopeChanged = unit => unit
```

### WebAppAPI.Events.gyroscopeFailedError

```rescript
@unboxed
type gyroscopeFailedError =
  | @as("UNSUPPORTED") Unsupported
  | UndocumentedError(string)
```

### WebAppAPI.Events.gyroscopeFailedEvent

```rescript
type gyroscopeFailedEvent = {error: gyroscopeFailedError}
```

### WebAppAPI.Events.gyroscopeFailed

```rescript
type gyroscopeFailed = gyroscopeFailedEvent => unit
```

### WebAppAPI.Events.locationManagerUpdated

```rescript
type locationManagerUpdated = unit => unit
```

### WebAppAPI.Events.locationRequestedEvent

```rescript
type locationRequestedEvent = {
  locationData: TelegramWebApp.LocationManager.locationData,
}
```

### WebAppAPI.Events.locationRequested

```rescript
type locationRequested = locationRequestedEvent => unit
```

### WebAppAPI.Events.shareMessageSent

```rescript
type shareMessageSent = unit => unit
```

### WebAppAPI.Events.shareMessageError

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

### WebAppAPI.Events.shareMessageFailedEvent

```rescript
type shareMessageFailedEvent = {error: shareMessageError}
```

### WebAppAPI.Events.shareMessageFailed

```rescript
type shareMessageFailed = shareMessageFailedEvent => unit
```

### WebAppAPI.Events.emojiStatusError

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

### WebAppAPI.Events.emojiStatusFailedEvent

```rescript
type emojiStatusFailedEvent = {error: emojiStatusError}
```

### WebAppAPI.Events.emojiStatusSet

```rescript
type emojiStatusSet = unit => unit
```

### WebAppAPI.Events.emojiStatusFailed

```rescript
type emojiStatusFailed = emojiStatusFailedEvent => unit
```

### WebAppAPI.Events.emojiStatusAccessStatus

```rescript
@unboxed
type emojiStatusAccessStatus =
  | @as("allowed") Allowed
  | @as("cancelled") Cancelled
  | UndocumentedError(string)
```

### WebAppAPI.Events.emojiStatusAccessRequestedEvent

```rescript
type emojiStatusAccessRequestedEvent = {
  status: emojiStatusAccessStatus,
}
```

### WebAppAPI.Events.emojiStatusAccessRequested

```rescript
type emojiStatusAccessRequested = emojiStatusAccessRequestedEvent => unit
```

### WebAppAPI.Events.fileDownloadStatus

```rescript
@unboxed
type fileDownloadStatus =
  | @as("downloading") Downloading
  | @as("cancelled") Cancelled
  | UndocumentedError(string)
```

### WebAppAPI.Events.fileDownloadRequestedEvent

```rescript
type fileDownloadRequestedEvent = {
  status: fileDownloadStatus,
}
```

### WebAppAPI.Events.fileDownloadRequested

```rescript
type fileDownloadRequested = fileDownloadRequestedEvent => unit
```

## Global

### Global.telegramWebApp

A reference to global Telegram.WebApp object.

Assumes `<script src="https://telegram.org/js/telegram-web-app.js?59"></script>`
is connectede beforehand.

```rescript
let telegramWebApp: TelegramWebApp.WebApp.t
```

## Accelerometer

### Accelerometer.t

```rescript
type t = {isStarted: bool, x: float, y: float, z: float}
```

## AccelerometerAPI

### AccelerometerAPI.accelerometerStartParams

```rescript
type accelerometerStartParams = {refresh_rate?: int}
```

### AccelerometerAPI.start

Starts tracking accelerometer data using params of type AccelerometerStartParams. If an optional callback parameter is provided, the callback function will be called with a boolean indicating whether tracking was successfully started.

```rescript
let start: (
  TelegramWebApp.Accelerometer.t,
  accelerometerStartParams,
  ~callback: bool => unit=?,
) => TelegramWebApp.Accelerometer.t
```

### AccelerometerAPI.stop

Stops tracking accelerometer data. If an optional callback parameter is provided, the callback function will be called with a boolean indicating whether tracking was successfully stopped.

```rescript
let stop: (
  TelegramWebApp.Accelerometer.t,
  ~callback: bool => unit=?,
) => TelegramWebApp.Accelerometer.t
```

## BackButton

### BackButton.t

```rescript
type t = {mutable isVisible: bool}
```

## BackButtonAPI

### BackButtonAPI.onClick

A method that sets the button press event handler. An alias for Telegram.WebApp.onEvent('backButtonClicked', callback)

```rescript
let onClick: (
  TelegramWebApp.BackButton.t,
  ~callback: unit => unit,
) => TelegramWebApp.BackButton.t
```

### BackButtonAPI.offClick

A method that removes the button press event handler. An alias for Telegram.WebApp.offEvent('backButtonClicked', callback)

```rescript
let offClick: (
  TelegramWebApp.BackButton.t,
  ~callback: unit => unit,
) => TelegramWebApp.BackButton.t
```

### BackButtonAPI.show

A method to make the button active and visible.

```rescript
let show: TelegramWebApp.BackButton.t => TelegramWebApp.BackButton.t
```

### BackButtonAPI.hide

A method to hide the button.

```rescript
let hide: TelegramWebApp.BackButton.t => TelegramWebApp.BackButton.t
```

## BiometricManager

### BiometricManager.t

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

## BiometricManagerAPI

### BiometricManagerAPI.init

A method that initializes the BiometricManager object. It should be called before the object's first use. If an optional callback parameter was passed, the callback function will be called when the object is initialized.

```rescript
let init: (
  TelegramWebApp.BiometricManager.t,
  ~callback: unit => unit=?,
) => TelegramWebApp.BiometricManager.t
```

### BiometricManagerAPI.biometricRequestAccessParams

```rescript
type biometricRequestAccessParams = {reason?: string}
```

### BiometricManagerAPI.requestAccess

A method that requests permission to use biometrics according to the params argument of type BiometricRequestAccessParams. If an optional callback parameter was passed, the callback function will be called and the first argument will be a boolean indicating whether the user granted access.

```rescript
let requestAccess: (
  TelegramWebApp.BiometricManager.t,
  biometricRequestAccessParams,
  ~callback: bool => unit=?,
) => TelegramWebApp.BiometricManager.t
```

### BiometricManagerAPI.biometricAuthenticateParams

```rescript
type biometricAuthenticateParams = {reason?: string}
```

### BiometricManagerAPI.authenticate

A method that authenticates the user using biometrics according to the params argument of type BiometricAuthenticateParams. If an optional callback parameter was passed, the callback function will be called and the first argument will be a boolean indicating whether the user authenticated successfully. If so, the second argument will be a biometric token.

```rescript
let authenticate: (
  TelegramWebApp.BiometricManager.t,
  biometricAuthenticateParams,
  ~callback: (bool, string) => unit=?,
) => TelegramWebApp.BiometricManager.t
```

### BiometricManagerAPI.updateBiometricToken

A method that updates the biometric token in secure storage on the device. To remove the token, pass an empty string. If an optional callback parameter was passed, the callback function will be called and the first argument will be a boolean indicating whether the token was updated.

```rescript
let updateBiometricToken: (
  TelegramWebApp.BiometricManager.t,
  string,
  ~callback: bool => unit=?,
) => TelegramWebApp.BiometricManager.t
```

### BiometricManagerAPI.openSettings

A method that opens the biometric access settings for bots. Useful when you need to request biometrics access to users who haven't granted it yet.

Note that this method can be called only in response to user interaction with the Mini App interface (e.g. a click inside the Mini App or on the main button)

```rescript
let openSettings: TelegramWebApp.BiometricManager.t => TelegramWebApp.BiometricManager.t
```

## BottomButton

### BottomButton.bottomButtonType

```rescript
type bottomButtonType =
  | @as("main") Main
  | @as("secondary") Secondary
```

### BottomButton.bottomButtonPosition

```rescript
type bottomButtonPosition =
  | @as("left") Left
  | @as("right") Right
  | @as("top") Top
  | @as("bottom") Bottom
```

### BottomButton.t

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

## BottomButtonAPI

### BottomButtonAPI.setText

A method to set the button text.

```rescript
let setText: (
  TelegramWebApp.BottomButton.t,
  string,
) => TelegramWebApp.BottomButton.t
```

### BottomButtonAPI.onClick

A method that sets the button's press event handler. An alias for Telegram.WebApp.onEvent('mainButtonClicked', callback)

```rescript
let onClick: (
  TelegramWebApp.BottomButton.t,
  ~callback: unit => unit,
) => TelegramWebApp.BottomButton.t
```

### BottomButtonAPI.offClick

A method that removes the button's press event handler. An alias for Telegram.WebApp.offEvent('mainButtonClicked', callback)

```rescript
let offClick: (
  TelegramWebApp.BottomButton.t,
  ~callback: unit => unit,
) => TelegramWebApp.BottomButton.t
```

### BottomButtonAPI.show

A method to make the button visible.
Note that opening the Mini App from the attachment menu hides the main button until the user interacts with the Mini App interface.

```rescript
let show: TelegramWebApp.BottomButton.t => TelegramWebApp.BottomButton.t
```

### BottomButtonAPI.hide

A method to hide the button.

```rescript
let hide: TelegramWebApp.BottomButton.t => TelegramWebApp.BottomButton.t
```

### BottomButtonAPI.enable

A method to enable the button.

```rescript
let enable: TelegramWebApp.BottomButton.t => TelegramWebApp.BottomButton.t
```

### BottomButtonAPI.disable

A method to disable the button.

```rescript
let disable: TelegramWebApp.BottomButton.t => TelegramWebApp.BottomButton.t
```

### BottomButtonAPI.showProgress

A method to show a loading indicator on the button.

It is recommended to display loading progress if the action tied to the button may take a long time. By default, the button is disabled while the action is in progress. If the parameter leaveActive=true is passed, the button remains enabled.

```rescript
let showProgress: (
  TelegramWebApp.BottomButton.t,
  bool,
) => TelegramWebApp.BottomButton.t
```

### BottomButtonAPI.hideProgress

A method to hide the loading indicator.

```rescript
let hideProgress: TelegramWebApp.BottomButton.t => TelegramWebApp.BottomButton.t
```

### BottomButtonAPI.params

```rescript
type params = {
  text?: string,
  color?: string,
  text_color?: string,
  has_shine_effect?: bool,
  position?: TelegramWebApp.BottomButton.bottomButtonPosition,
  is_active?: bool,
  is_visible?: bool,
}
```

### BottomButtonAPI.setParams

A method to set the button parameters. The params parameter is an object containing one or several fields that need to be changed.

```rescript
let setParams: (
  TelegramWebApp.BottomButton.t,
  params,
) => TelegramWebApp.BottomButton.t
```

## CloudStorage

### CloudStorage.t

```rescript
type t
```

## CloudStorageAPI

### CloudStorageAPI.cloudStorageError

```rescript
@unboxed
type cloudStorageError =
  | @as("UNKNOWN_ERROR") UnknownError
  | UndocumentedError(string)
```

### CloudStorageAPI.setItem

A method that stores a value in the cloud storage using the specified key. The key should contain 1-128 characters, only A-Z, a-z, 0-9, \_ and - are allowed. The value should contain 0-4096 characters. You can store up to 1024 keys in the cloud storage. If an optional callback parameter was passed, the callback function will be called. In case of an error, the first argument will contain the error. In case of success, the first argument will be null and the second argument will be a boolean indicating whether the value was stored.

```rescript
let setItem: (
  TelegramWebApp.CloudStorage.t,
  string,
  string,
  ~callback: (
    Null.t<cloudStorageError>,
    option<bool>,
  ) => unit=?,
) => TelegramWebApp.CloudStorage.t
```

### CloudStorageAPI.getItem

A method that receives a value from the cloud storage using the specified key. The key should contain 1-128 characters, only A-Z, a-z, 0-9, \_ and - are allowed. In case of an error, the callback function will be called and the first argument will contain the error. In case of success, the first argument will be null and the value will be passed as the second argument.

```rescript
let getItem: (
  TelegramWebApp.CloudStorage.t,
  string,
  ~callback: (
    Null.t<cloudStorageError>,
    option<string>,
  ) => unit,
) => TelegramWebApp.CloudStorage.t
```

### CloudStorageAPI.getItems

A method that receives values from the cloud storage using the specified keys. The keys should contain 1-128 characters, only A-Z, a-z, 0-9, \_ and - are allowed. In case of an error, the callback function will be called and the first argument will contain the error. In case of success, the first argument will be null and the values will be passed as the second argument.

```rescript
let getItems: (
  TelegramWebApp.CloudStorage.t,
  array<string>,
  ~callback: (
    Null.t<cloudStorageError>,
    option<array<string>>,
  ) => unit,
) => TelegramWebApp.CloudStorage.t
```

### CloudStorageAPI.removeItem

```rescript
let removeItem: (
  TelegramWebApp.CloudStorage.t,
  string,
  ~callback: (
    Null.t<cloudStorageError>,
    option<bool>,
  ) => unit,
) => TelegramWebApp.CloudStorage.t
```

### CloudStorageAPI.removeItems

A method that removes values from the cloud storage using the specified keys. The keys should contain 1-128 characters, only A-Z, a-z, 0-9, \_ and - are allowed. If an optional callback parameter was passed, the callback function will be called. In case of an error, the first argument will contain the error. In case of success, the first argument will be null and the second argument will be a boolean indicating whether the values were removed.

```rescript
let removeItems: (
  TelegramWebApp.CloudStorage.t,
  array<string>,
  ~callback: (
    Null.t<cloudStorageError>,
    option<bool>,
  ) => unit,
) => TelegramWebApp.CloudStorage.t
```

### CloudStorageAPI.getKeys

A method that receives the list of all keys stored in the cloud storage. In case of an error, the callback function will be called and the first argument will contain the error. In case of success, the first argument will be null and the list of keys will be passed as the second argument.

```rescript
let getKeys: (
  TelegramWebApp.CloudStorage.t,
  ~callback: (
    Null.t<cloudStorageError>,
    option<array<string>>,
  ) => unit,
) => TelegramWebApp.CloudStorage.t
```

## DeviceOrientation

### DeviceOrientation.t

```rescript
type t = {
  isStarted: bool,
  absolute: bool,
  alpha: float,
  beta: float,
  gamma: float,
}
```

## DeviceOrientationAPI

### DeviceOrientationAPI.deviceOrientationStartParams

```rescript
type deviceOrientationStartParams = {
  refresh_rate?: int,
  need_absolute?: bool,
}
```

### DeviceOrientationAPI.start

Starts tracking device orientation data using params of type DeviceOrientationStartParams. If an optional callback parameter is provided, the callback function will be called with a boolean indicating whether tracking was successfully started.

```rescript
let start: (
  TelegramWebApp.DeviceOrientation.t,
  deviceOrientationStartParams,
  ~callback: bool => unit=?,
) => TelegramWebApp.DeviceOrientation.t
```

### DeviceOrientationAPI.stop

Stops tracking device orientation data. If an optional callbackparameter is provided, the callback function will be called with a boolean indicating whether tracking was successfully stopped.

```rescript
let stop: (
  TelegramWebApp.DeviceOrientation.t,
  ~callback: bool => unit=?,
) => TelegramWebApp.DeviceOrientation.t
```

## DeviceStorage

### DeviceStorage.t

```rescript
type t
```

## DeviceStorageAPI

### DeviceStorageAPI.deviceStorageError

```rescript
@unboxed
type deviceStorageError =
  | @as("UNKNOWN_ERROR") UnknownError
  | UndocumentedError(string)
```

### DeviceStorageAPI.setItem

A method that stores a value in the device's local storage using the specified key. If an optional callback parameter was passed, the callback function will be called. In case of an error, the first argument will contain the error. In case of success, the first argument will be null and the second argument will be a boolean indicating whether the value was stored.

```rescript
let setItem: (
  TelegramWebApp.DeviceStorage.t,
  string,
  string,
  ~callback: (
    Null.t<deviceStorageError>,
    option<bool>,
  ) => unit=?,
) => TelegramWebApp.DeviceStorage.t
```

### DeviceStorageAPI.getItem

A method that receives a value from the device's local storage using the specified key. In case of an error, the callback function will be called and the first argument will contain the error. In case of success, the first argument will be null and the value will be passed as the second argument.

```rescript
let getItem: (
  TelegramWebApp.DeviceStorage.t,
  string,
  ~callback: (
    Null.t<deviceStorageError>,
    option<string>,
  ) => unit,
) => TelegramWebApp.DeviceStorage.t
```

### DeviceStorageAPI.removeItem

A method that removes a value from the device's local storage using the specified key. If an optional callback parameter was passed, the callbackfunction will be called. In case of an error, the first argument will contain the error. In case of success, the first argument will be null and the second argument will be a boolean indicating whether the value was removed.

```rescript
let removeItem: (
  TelegramWebApp.DeviceStorage.t,
  string,
  ~callback: (
    Null.t<deviceStorageError>,
    option<bool>,
  ) => unit=?,
) => TelegramWebApp.DeviceStorage.t
```

### DeviceStorageAPI.clear

A method that clears all keys previously stored by the bot in the device's local storage. If an optional callback parameter was passed, the callbackfunction will be called. In case of an error, the first argument will contain the error. In case of success, the first argument will be null and the second argument will be a boolean indicating whether all values were removed.

```rescript
let clear: (
  TelegramWebApp.DeviceStorage.t,
  ~callback: (
    Null.t<deviceStorageError>,
    option<bool>,
  ) => unit=?,
) => TelegramWebApp.DeviceStorage.t
```

## Gyroscope

### Gyroscope.t

```rescript
type t = {isStarted: bool, x: float, y: float, z: float}
```

## GyroscopeAPI

### GyroscopeAPI.gyroscopeStartParams

```rescript
type gyroscopeStartParams = {refresh_rate?: int}
```

### GyroscopeAPI.start

Starts tracking gyroscope data using params of type GyroscopeStartParams. If an optional callback parameter is provided, the callbackfunction will be called with a boolean indicating whether tracking was successfully started.

```rescript
let start: (
  TelegramWebApp.Gyroscope.t,
  gyroscopeStartParams,
  ~callback: bool => unit=?,
) => TelegramWebApp.Gyroscope.t
```

### GyroscopeAPI.stop

Stops tracking gyroscope data. If an optional callback parameter is provided, the callback function will be called with a boolean indicating whether tracking was successfully stopped.

```rescript
let stop: (
  TelegramWebApp.Gyroscope.t,
  ~callback: bool => unit=?,
) => TelegramWebApp.Gyroscope.t
```

## HapticFeedback

### HapticFeedback.t

```rescript
type t
```

## HapticFeedbackAPI

### HapticFeedbackAPI.impactStyle

```rescript
type impactStyle =
  | @as("light") Light
  | @as("medium") Medium
  | @as("heavy") Heavy
  | @as("rigid") Rigid
  | @as("soft") Soft
```

### HapticFeedbackAPI.impactOccurred

A method tells that an impact occurred. The Telegram app may play the appropriate haptics based on style value passed.

```rescript
let impactOccurred: (TelegramWebApp.HapticFeedback.t, impactStyle) => unit
```

### HapticFeedbackAPI.notificationType

```rescript
type notificationType =
  | @as("error") Error
  | @as("success") Success
  | @as("warning") Warning
```

### HapticFeedbackAPI.notificationOccurred

A method tells that a task or action has succeeded, failed, or produced a warning. The Telegram app may play the appropriate haptics based on type value passed.

```rescript
let notificationOccurred: (TelegramWebApp.HapticFeedback.t, notificationType) => unit
```

### HapticFeedbackAPI.selectionChanged

A method tells that the user has changed a selection. The Telegram app may play the appropriate haptics.

Do not use this feedback when the user makes or confirms a selection; use it only when the selection changes.

```rescript
let selectionChanged: (TelegramWebApp.HapticFeedback.t, notificationType) => unit
```

## LocationManager

### LocationManager.t

```rescript
type t = {
  isInited: bool,
  isLocationAvailable: bool,
  isAccessRequested: bool,
  isAccessGranted: bool,
}
```

### LocationManager.locationData

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

## LocationManagerAPI

### LocationManagerAPI.init

A method that initializes the LocationManager object. It should be called before the object's first use. If an optional callback parameter is provided, the callback function will be called when the object is initialized.

```rescript
let init: (
  TelegramWebApp.LocationManager.t,
  ~callback: unit => unit=?,
) => TelegramWebApp.LocationManager.t
```

### LocationManagerAPI.getLocation

A method that requests location data. The callback function will be called with null as the first argument if access to location was not granted, or an object of type LocationData as the first argument if access was successful.

```rescript
let getLocation: (
  TelegramWebApp.LocationManager.t,
  ~callback: TelegramWebApp.LocationManager.locationData => unit,
) => TelegramWebApp.LocationManager.t
```

### LocationManagerAPI.openSetting

A method that opens the location access settings for bots. Useful when you need to request location access from users who haven't granted it yet.

Note that this method can be called only in response to user interaction with the Mini App interface (e.g., a click inside the Mini App or on the main button)."

```rescript
let openSetting: TelegramWebApp.LocationManager.t => TelegramWebApp.LocationManager.t
```

## SecureStorage

### SecureStorage.t

```rescript
type t
```

## SecureStorageAPI

### SecureStorageAPI.secureStorageError

```rescript
@unboxed
type secureStorageError =
  | @as("UNKNOWN_ERROR") UnknownError
  | UndocumentedError(string)
```

### SecureStorageAPI.setItem

A method that stores a value in the device's secure storage using the specified key. If an optional callback parameter was passed, the callback function will be called. In case of an error, the first argument will contain the error. In case of success, the first argument will be null and the second argument will be a boolean indicating whether the value was stored.

```rescript
let setItem: (
  TelegramWebApp.SecureStorage.t,
  string,
  string,
  ~callback: (
    Null.t<secureStorageError>,
    option<bool>,
  ) => unit=?,
) => TelegramWebApp.SecureStorage.t
```

### SecureStorageAPI.getItem

A method that receives a value from the device's secure storage using the specified key. In case of an error, the callback function will be called and the first argument will contain the error. In case of success, the first argument will be null and the value will be passed as the second argument. If the key was not found, the second argument will be null, and the third argument will be a boolean indicating whether the key can be restored from the current device.

```rescript
let getItem: (
  TelegramWebApp.SecureStorage.t,
  string,
  ~callback: (
    Null.t<secureStorageError>,
    option<string>,
  ) => unit,
) => TelegramWebApp.SecureStorage.t
```

### SecureStorageAPI.restoreItem

Attempts to restore a key that previously existed on the current device. When called, the user will be asked for permission to restore the value. If the user declines or an error occurs, the first argument in the callback will contain the error. If restored successfully, the first argument will be null and the second argument will contain the restored value.

```rescript
let restoreItem: (
  TelegramWebApp.SecureStorage.t,
  string,
  ~callback: (
    Null.t<secureStorageError>,
    option<string>,
  ) => unit=?,
) => TelegramWebApp.SecureStorage.t
```

### SecureStorageAPI.removeItem

A method that removes a value from the device's secure storage using the specified key. If an optional callback parameter was passed, the callbackfunction will be called. In case of an error, the first argument will contain the error. In case of success, the first argument will be null and the second argument will be a boolean indicating whether the value was removed.

```rescript
let removeItem: (
  TelegramWebApp.SecureStorage.t,
  string,
  ~callback: (
    Null.t<secureStorageError>,
    option<bool>,
  ) => unit=?,
) => TelegramWebApp.SecureStorage.t
```

### SecureStorageAPI.clear

A method that clears all keys previously stored by the bot in the device's secure storage. If an optional callback parameter was passed, the callbackfunction will be called. In case of an error, the first argument will contain the error. In case of success, the first argument will be null and the second argument will be a boolean indicating whether all values were removed.

```rescript
let clear: (
  TelegramWebApp.SecureStorage.t,
  ~callback: (
    Null.t<secureStorageError>,
    option<bool>,
  ) => unit=?,
) => TelegramWebApp.SecureStorage.t
```

## SettingsButton

### SettingsButton.t

```rescript
type t = {mutable isVisible: bool}
```

## SettingsButtonAPI

### SettingsButtonAPI.onClick

A method that sets the press event handler for the Settings item in the context menu. An alias for Telegram.WebApp.onEvent('settingsButtonClicked', callback)

```rescript
let onClick: (
  TelegramWebApp.SettingsButton.t,
  ~callback: unit => unit,
) => TelegramWebApp.SettingsButton.t
```

### SettingsButtonAPI.offClick

A method that removes the press event handler from the Settings item in the context menu. An alias for Telegram.WebApp.offEvent('settingsButtonClicked', callback)

```rescript
let offClick: (
  TelegramWebApp.SettingsButton.t,
  ~callback: unit => unit,
) => TelegramWebApp.SettingsButton.t
```

### SettingsButtonAPI.show

A method to make the Settings item in the context menu visible.

```rescript
let show: TelegramWebApp.SettingsButton.t => TelegramWebApp.SettingsButton.t
```

### SettingsButtonAPI.hide

A method to hide the Settings item in the context menu.

```rescript
let hide: TelegramWebApp.SettingsButton.t => TelegramWebApp.SettingsButton.t
```
