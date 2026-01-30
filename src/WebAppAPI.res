open WebApp

/**
 Returns true if the user's app supports a version of the Bot API that is equal to or higher than the version passed as the parameter.
 */
@send
external isVersionAtLeast: (t, string) => bool = "isVersionAtLeast"

/**
 A method that sets the app header color in the #RRGGBB format. You can also use keywords bg_color and secondary_bg_color.

 Up to Bot API 6.9 You can only pass Telegram.WebApp.themeParams.bg_color or Telegram.WebApp.themeParams.secondary_bg_color as a color or bg_color, secondary_bg_color keywords.
 */
@send
external setHeaderColor: (t, string) => unit = "setHeaderColor"

/**
 A method that sets the app background color in the #RRGGBB format. You can also use keywords bg_color and secondary_bg_color.
 */
@send
external setBackgroundColor: (t, string) => unit = "setBackgroundColor"

/**
 A method that sets the app's bottom bar color in the #RRGGBB format. You can also use the keywords bg_color, secondary_bg_color, and bottom_bar_bg_color. This color is also applied to the navigation bar on Android.
 */
@send
external setBottomBarColor: (t, string) => unit = "setBottomBarColor"

/**
 A method that enables a confirmation dialog while the user is trying to close the Mini App.
 */
@send
external enableClosingConfirmation: t => unit = "enableClosingConfirmation"

/**
 A method that disables the confirmation dialog while the user is trying to close the Mini App.
 */
@send
external disableClosingConfirmation: t => unit = "disableClosingConfirmation"

/**
 A method that enables vertical swipes to close or minimize the Mini App. For user convenience, it is recommended to always enable swipes unless they conflict with the Mini App's own gestures.
 */
@send
external enableVerticalSwipes: t => unit = "enableVerticalSwipes"

/**
 A method that disables vertical swipes to close or minimize the Mini App. This method is useful if your Mini App uses swipe gestures that may conflict with the gestures for minimizing and closing the app.
 */
@send
external disableVerticalSwipes: t => unit = "disableVerticalSwipes"

/**
 A method that requests opening the Mini App in fullscreen mode. Although the header is transparent in fullscreen mode, it is recommended that the Mini App sets the header color using the setHeaderColor method. This color helps determine a contrasting color for the status bar and other UI controls.
 */
@send
external requestFullscreen: t => unit = "requestFullscreen"

/**
 A method that requests exiting fullscreen mode.
 */
@send
external exitFullscreen: t => unit = "exitFullscreen"

/**
 A method that locks the Mini App’s orientation to its current mode (either portrait or landscape). Once locked, the orientation remains fixed, regardless of device rotation. This is useful if a stable orientation is needed during specific interactions.
 */
@send
external lockOrientation: t => unit = "lockOrientation"

/**
 A method that unlocks the Mini App’s orientation, allowing it to follow the device's rotation freely. Use this to restore automatic orientation adjustments based on the device orientation.
 */
@send
external unlockOrientation: t => unit = "unlockOrientation"

/**
 A method that prompts the user to add the Mini App to the home screen. After successfully adding the icon, the homeScreenAdded event will be triggered if supported by the device. Note that if the device cannot determine the installation status, the event may not be received even if the icon has been added.
 */
@send
external addToHomeScreen: t => unit = "addToHomeScreen"

type homeScreenStatus =
  | @as("unsupported") Unsupported // the feature is not supported, and it is not possible to add the icon to the home screen,
  | @as("unknown") Unknown // the feature is supported, and the icon can be added, but it is not possible to determine if the icon has already been added,
  | @as("added") Added // the icon has already been added to the home screen,
  | @as("missed") Missed // the icon has not been added to the home screen.
  | UndocumentedStatus(string)

/**
 A method that checks if adding to the home screen is supported and if the Mini App has already been added. If an optional callback parameter is provided, the callback function will be called with a single argument status, which is a string indicating the home screen status.
 */
@send
external checkHomeScreenStatus: (t, ~callback: homeScreenStatus => unit=?) => unit =
  "checkHomeScreenStatus"

@unboxed
type invoiceStatus =
  | @as("paid") Paid // – invoice was paid successfully,
  | @as("cancelled") Cancelled // – user closed this invoice without paying,
  | @as("failed") Failed // – user tried to pay, but the payment was failed,
  | @as("pending") Pending // – the payment is still processing. The bot will receive a service
  | UndocumentedStatus(string)

/**
 Events Available for Mini Apps

 The Mini App can receive events from the Telegram app, onto which a handler can be attached using the Telegram.WebApp.onEvent(eventType, eventHandler) method. Inside eventHandler the this object refers to Telegram.WebApp, the set of parameters sent to the handler depends on the event type.
 */
module Events = {
  type activated = unit => unit

  type deactivated = unit => unit

  type themeChanged = unit => unit

  type viewportChangedEvent = {isStateStable: bool}

  type viewportChanged = viewportChangedEvent => unit

  type safeAreaChanged = unit => unit

  type contentSafeAreaChanged = unit => unit

  type mainButtonClicked = unit => unit

  type secondaryButtonClicked = unit => unit

  type backButtonClicked = unit => unit

  type settingsButtonClicked = unit => unit

  type invoiceClosedEvent = {
    url: string,
    status: invoiceStatus,
  }

  type invoiceClosed = invoiceClosedEvent => unit

  type popupClosedEvent = {button_id: Null.t<string>}

  type popupClosed = popupClosedEvent => unit

  type qrTextReceivedEvent = {data: string}

  type qrTextReceived = qrTextReceivedEvent => unit

  type scanQrPopupClosed = unit => unit

  type clipboardTextReceivedEvent = {data: Null.t<string>}

  type clipboardTextReceived = clipboardTextReceivedEvent => unit

  @unboxed
  type writeAccessRequestedStatus =
    | @as("allowed") Allowed // user granted write permission to the bot,
    | @as("cancelled") Cancelled // user declined this request.
    | UndocumentedStatus(string)

  type writeAccessRequestedEvent = {status: writeAccessRequestedStatus}

  type writeAccessRequested = writeAccessRequestedEvent => unit

  @unboxed
  type contactRequestedStatus =
    | @as("sent") Sent // user shared their phone number with the bot,
    | @as("cancelled") Cancelled // user declined this request.
    | UndocumentedStatus(string)

  type contactRequestedEvent = {status: contactRequestedStatus}

  type contactRequested = contactRequestedEvent => unit

  type biometricManagerUpdated = unit => unit

  type biometricAuthRequestedEvent = {
    isAuthenticated: bool,
    biometricToken?: string,
  }

  type biometricAuthRequested = biometricAuthRequestedEvent => unit

  type biometricTokenUpdatedEvent = {isUpdated: bool}

  type biometricTokenUpdated = biometricTokenUpdatedEvent => unit

  type fullscreenChanged = unit => unit

  @unboxed
  type fullscreenError =
    | @as("UNSUPPORTED") Unsupported // Fullscreen mode is not supported on this device or platform.
    | @as("ALREADY_FULLSCREEN") AlreadyFullscreen // The Mini App is already in fullscreen mode
    | UndocumentedError(string)

  type fullscreenFailedEvent = {error: fullscreenError}

  type fullscreenFailed = fullscreenFailedEvent => unit

  type homeScreenAdded = unit => unit

  type homeScreenCheckedEvent = {status: homeScreenStatus}

  type homeScreenChecked = homeScreenCheckedEvent => unit

  type accelerometerStarted = unit => unit

  type accelerometerStopped = unit => unit

  type accelerometerChanged = unit => unit

  @unboxed
  type accelerometerFailedError =
    | @as("UNSUPPORTED") Unsupported // Accelerometer tracking is not supported on this device or platform.
    | UndocumentedError(string)

  type accelerometerFailedEvent = {error: accelerometerFailedError}

  type accelerometerFailed = accelerometerFailedEvent => unit

  type deviceOrientationStarted = unit => unit

  type deviceOrientationStopped = unit => unit

  type deviceOrientationChanged = unit => unit

  @unboxed
  type deviceOrientationFailedError =
    | @as("UNSUPPORTED") Unsupported // Device orientation tracking is not supported on this device or platform.
    | UndocumentedError(string)

  type deviceOrientationFailedEvent = {error: deviceOrientationFailedError}

  type deviceOrientationFailed = deviceOrientationFailedEvent => unit

  type gyroscopeStarted = unit => unit

  type gyroscopeStopped = unit => unit

  type gyroscopeChanged = unit => unit

  @unboxed
  type gyroscopeFailedError =
    | @as("UNSUPPORTED") Unsupported // Device orientation tracking is not supported on this device or platform.
    | UndocumentedError(string)

  type gyroscopeFailedEvent = {error: gyroscopeFailedError}

  type gyroscopeFailed = gyroscopeFailedEvent => unit

  type locationManagerUpdated = unit => unit

  type locationRequestedEvent = {locationData: LocationManager.locationData}

  type locationRequested = locationRequestedEvent => unit

  type shareMessageSent = unit => unit

  @unboxed
  type shareMessageError =
    | @as("UNSUPPORTED") Unsupported // The feature is not supported by the client.
    | @as("MESSAGE_EXPIRED") MessageExpired // The message could not be retrieved because it has expired.
    | @as("MESSAGE_SEND_FAILED") MessageSendFailed // An error occurred while attempting to send the message.
    | @as("USER_DECLINED") UserDeclined // The user closed the dialog without sharing the message.
    | @as("UNKNOWN_ERROR") UnknownError // An unknown error occurred.
    | UndocumentedError(string)

  type shareMessageFailedEvent = {error: shareMessageError}

  type shareMessageFailed = shareMessageFailedEvent => unit

  @unboxed
  type emojiStatusError =
    | @as("UNSUPPORTED") Unsupported // The feature is not supported by the client.
    | @as("SUGGESTED_EMOJI_INVALID") SuggestedEmojiInvalid // One or more emoji identifiers are invalid.
    | @as("DURATION_INVALID") DurationInvalid // The specified duration is invalid.
    | @as("USER_DECLINED") UserDeclined // The user closed the dialog without setting a status.
    | @as("SERVER_ERROR") ServerError // A server error occurred when attempting to set the status.
    | @as("UNKNOWN_ERROR") UnknownError // An unknown error occurred.
    | UndocumentedError(string)

  type emojiStatusFailedEvent = {error: emojiStatusError}

  type emojiStatusSet = unit => unit

  type emojiStatusFailed = emojiStatusFailedEvent => unit

  @unboxed
  type emojiStatusAccessStatus =
    | @as("allowed") Allowed // user granted emoji status permission to the bot,
    | @as("cancelled") Cancelled // user declined this request.
    | UndocumentedError(string)

  type emojiStatusAccessRequestedEvent = {status: emojiStatusAccessStatus}

  type emojiStatusAccessRequested = emojiStatusAccessRequestedEvent => unit

  @unboxed
  type fileDownloadStatus =
    | @as("downloading") Downloading // the file download has started,
    | @as("cancelled") Cancelled // user declined this request.
    | UndocumentedError(string)

  type fileDownloadRequestedEvent = {status: fileDownloadStatus}

  type fileDownloadRequested = fileDownloadRequestedEvent => unit
}

/**
 Occurs when the Mini App becomes active (e.g., opened from minimized state or selected among tabs).
 */
@send
external onActivated: (t, @as("activated") _, Events.activated) => unit = "onEvent"
@send
external offActivated: (t, @as("activated") _, Events.activated) => unit = "offEvent"

/**
 Occurs when the Mini App becomes inactive (e.g., minimized or moved to an inactive tab).
 */
@send
external onDeactivated: (t, @as("deactivated") _, Events.deactivated) => unit = "onEvent"
@send
external offDeactivated: (t, @as("deactivated") _, Events.deactivated) => unit = "offEvent"

/**
 Occurs whenever theme settings are changed in the user's Telegram app (including switching to night mode).

 eventHandler receives no parameters, new theme settings and color scheme can be received via this.themeParams and this.colorScheme respectively.
 */
@send
external onThemeChanged: (t, @as("themeChanged") _, Events.themeChanged) => unit = "onEvent"
@send
external offThemeChanged: (t, @as("themeChanged") _, Events.themeChanged) => unit = "offEvent"

/**
 Occurs when the visible section of the Mini App is changed.

 eventHandler receives an object with the single field isStateStable. If isStateStable is true, the resizing of the Mini App is finished. If it is false, the resizing is ongoing (the user is expanding or collapsing the Mini App or an animated object is playing). The current value of the visible section’s height is available in this.viewportHeight.
 */
@send
external onViewportChanged: (t, @as("viewportChanged") _, Events.viewportChanged) => unit =
  "onEvent"
@send
external offViewportChanged: (t, @as("viewportChanged") _, Events.viewportChanged) => unit =
  "offEvent"

/**
 Occurs when the device's safe area insets change (e.g., due to orientation change or screen adjustments).

 eventHandler receives no parameters. The current inset values can be accessed via this.safeAreaInset.
 */
@send
external onSafeAreaChanged: (t, @as("safeAreaChanged") _, Events.safeAreaChanged) => unit =
  "onEvent"
@send
external offSafeAreaChanged: (t, @as("safeAreaChanged") _, Events.safeAreaChanged) => unit =
  "offEvent"

/**
 Occurs when the safe area for content changes (e.g., due to orientation change or screen adjustments).

 eventHandler receives no parameters. The current inset values can be accessed via this.contentSafeAreaInset.
 */
@send
external onContentSafeAreaChanged: (
  t,
  @as("contentSafeAreaChanged") _,
  Events.contentSafeAreaChanged,
) => unit = "onEvent"
@send
external offContentSafeAreaChanged: (
  t,
  @as("contentSafeAreaChanged") _,
  Events.contentSafeAreaChanged,
) => unit = "offEvent"

/**
 Occurs when the main button is pressed.
 */
@send
external onMainButtonClicked: (t, @as("mainButtonClicked") _, Events.mainButtonClicked) => unit =
  "onEvent"
@send
external offMainButtonClicked: (t, @as("mainButtonClicked") _, Events.mainButtonClicked) => unit =
  "offEvent"

/**
 Occurs when the secondary button is pressed.
 */
@send
external onSecondaryButtonClicked: (
  t,
  @as("secondaryButtonClicked") _,
  Events.secondaryButtonClicked,
) => unit = "onEvent"
@send
external offSecondaryButtonClicked: (
  t,
  @as("secondaryButtonClicked") _,
  Events.secondaryButtonClicked,
) => unit = "offEvent"

/**
   Occurrs when the back button is pressed.
 */
@send
external onBackButtonClicked: (t, @as("backButtonClicked") _, Events.backButtonClicked) => unit =
  "onEvent"
@send
external offBackButtonClicked: (t, @as("backButtonClicked") _, Events.backButtonClicked) => unit =
  "offEvent"

/**
   Occurrs when the Settings item in context menu is pressed.
 */
@send
external onSettingsButtonClicked: (
  t,
  @as("settingsButtonClicked") _,
  Events.settingsButtonClicked,
) => unit = "onEvent"
@send
external offSettingsButtonClicked: (
  t,
  @as("settingsButtonClicked") _,
  Events.settingsButtonClicked,
) => unit = "offEvent"

/**
   Occurrs when the opened invoice is closed.

 eventHandler receives an object with the two fields: url – invoice link provided and status – one of the invoice statuses.
 */
@send
external onInvoiceClosed: (t, @as("invoiceClosed") _, Events.invoiceClosed) => unit = "onEvent"
@send
external offInvoiceClosed: (t, @as("invoiceClosed") _, Events.invoiceClosed) => unit = "offEvent"

/**
   Occurrs when the opened popup is closed.

 eventHandler receives an object with the single field button_id – the value of the field id of the pressed button. If no buttons were pressed, the field button_id will be null.
 */
@send
external onPopupClosed: (t, @as("popupClosed") _, Events.popupClosed) => unit = "onEvent"
@send
external offPopupClosed: (t, @as("popupClosed") _, Events.popupClosed) => unit = "offEvent"

/**
 Occurs when the QR code scanner catches a code with text data.

 eventHandler receives an object with the single field data containing text data from the QR code.
 */
@send
external onQrTextReceived: (t, @as("qrTextReceived") _, Events.qrTextReceived) => unit = "onEvent"
@send
external offQrTextReceived: (t, @as("qrTextReceived") _, Events.qrTextReceived) => unit = "offEvent"

/**
 Occurs when the QR code scanner popup is closed by the user.
 */
@send
external onScanQrPopupClosed: (t, @as("scanQrPopupClosed") _, Events.scanQrPopupClosed) => unit =
  "onEvent"
@send
external offScanQrPopupClosed: (t, @as("scanQrPopupClosed") _, Events.scanQrPopupClosed) => unit =
  "offEvent"

/**
   Occurrs when the readTextFromClipboard method is called.

 eventHandler receives an object with the single field data containing text data from the clipboard. If the clipboard contains non-text data, the field data will be an empty string. If the Mini App has no access to the clipboard, the field data will be null.
 */
@send
external onClipboardTextReceived: (
  t,
  @as("clipboardTextReceived") _,
  Events.clipboardTextReceived,
) => unit = "onEvent"
@send
external offClipboardTextReceived: (
  t,
  @as("clipboardTextReceived") _,
  Events.clipboardTextReceived,
) => unit = "offEvent"

/**
 Occurs when the write permission was requested.

 eventHandler receives an object with the single field status containing one of the statuses.
 */
@send
external onWriteAccessRequested: (
  t,
  @as("writeAccessRequested") _,
  Events.writeAccessRequested,
) => unit = "onEvent"
@send
external offWriteAccessRequested: (
  t,
  @as("writeAccessRequested") _,
  Events.writeAccessRequested,
) => unit = "offEvent"

/**
   Occurrs when the user's phone number was requested.

 eventHandler receives an object with the single field status containing one of the statuses.
 */
@send
external onContactRequested: (t, @as("contactRequested") _, Events.contactRequested) => unit =
  "onEvent"
@send
external offContactRequested: (t, @as("contactRequested") _, Events.contactRequested) => unit =
  "offEvent"
/**
 Occurs whenever BiometricManager object is changed.
 */
@send
external onBiometricManagerUpdated: (
  t,
  @as("biometricManagerUpdated") _,
  Events.biometricManagerUpdated,
) => unit = "onEvent"
@send
external offBiometricManagerUpdated: (
  t,
  @as("biometricManagerUpdated") _,
  Events.biometricManagerUpdated,
) => unit = "offEvent"

/**
 Occurs whenever biometric authentication was requested.

 eventHandler receives an object with the field isAuthenticated containing a boolean indicating whether the user was authenticated successfully. If isAuthenticated is true, the field biometricToken will contain the biometric token stored in secure storage on the device.
 */
@send
external onBiometricAuthRequested: (
  t,
  @as("biometricAuthRequested") _,
  Events.biometricAuthRequested,
) => unit = "onEvent"
@send
external offBiometricAuthRequested: (
  t,
  @as("biometricAuthRequested") _,
  Events.biometricAuthRequested,
) => unit = "offEvent"

/**
 Occurs whenever the biometric token was updated.

 eventHandler receives an object with the single field isUpdated, containing a boolean indicating whether the token was updated.
 */
@send
external onBiometricTokenUpdated: (
  t,
  @as("biometricTokenUpdated") _,
  Events.biometricTokenUpdated,
) => unit = "onEvent"
@send
external offBiometricTokenUpdated: (
  t,
  @as("biometricTokenUpdated") _,
  Events.biometricTokenUpdated,
) => unit = "offEvent"

/**
 Occurs whenever the Mini App enters or exits fullscreen mode.

 eventHandler receives no parameters. The current fullscreen state can be checked via this.isFullscreen.
 */
@send
external onFullscreenChanged: (t, @as("fullscreenChanged") _, Events.fullscreenChanged) => unit =
  "onEvent"
@send
external offFullscreenChanged: (t, @as("fullscreenChanged") _, Events.fullscreenChanged) => unit =
  "offEvent"

/**
 Occurs if a request to enter fullscreen mode fails.

 eventHandler receives an object with the single field error, describing the reason for the failure.
 */
@send
external onFullscreenFailed: (t, @as("fullscreenFailed") _, Events.fullscreenFailed) => unit =
  "onEvent"
@send
external offFullscreenFailed: (t, @as("fullscreenFailed") _, Events.fullscreenFailed) => unit =
  "offEvent"

/**
 Occurs when the Mini App is successfully added to the home screen.
 */
@send
external onHomeScreenAdded: (t, @as("homeScreenAdded") _, Events.homeScreenAdded) => unit =
  "onEvent"
@send
external offHomeScreenAdded: (t, @as("homeScreenAdded") _, Events.homeScreenAdded) => unit =
  "offEvent"

/**
 Occurs after checking the home screen status.

  eventHandler receives an object with the field status, which is a string indicating the current home screen status.
 */
@send
external onHomeScreenChecked: (t, @as("homeScreenChecked") _, Events.homeScreenChecked) => unit =
  "onEvent"
@send
external offHomeScreenChecked: (t, @as("homeScreenChecked") _, Events.homeScreenChecked) => unit =
  "offEvent"

/**
 Occurs when accelerometer tracking has started successfully.
 */
@send
external onAccelerometerStarted: (
  t,
  @as("accelerometerStarted") _,
  Events.accelerometerStarted,
) => unit = "onEvent"
@send
external offAccelerometerStarted: (
  t,
  @as("accelerometerStarted") _,
  Events.accelerometerStarted,
) => unit = "offEvent"

/**
 Occurs when accelerometer tracking has stopped.
 */
@send
external onAccelerometerStopped: (
  t,
  @as("accelerometerStopped") _,
  Events.accelerometerStopped,
) => unit = "onEvent"
@send
external offAccelerometerStopped: (
  t,
  @as("accelerometerStopped") _,
  Events.accelerometerStopped,
) => unit = "offEvent"

/**
 Occurs with the specified frequency after calling the start method, sending the current accelerometer data.

 eventHandler receives no parameters, the current acceleration values can be received via this.x, this.y and this.z respectively.
 */
@send
external onAccelerometerChanged: (
  t,
  @as("accelerometerChanged") _,
  Events.accelerometerChanged,
) => unit = "onEvent"
@send
external offAccelerometerChanged: (
  t,
  @as("accelerometerChanged") _,
  Events.accelerometerChanged,
) => unit = "offEvent"

/**
 Occurs if a request to start accelerometer tracking fails.

 eventHandler receives an object with the single field error, describing the reason for the failure.
 */
@send
external onAccelerometerFailed: (
  t,
  @as("accelerometerFailed") _,
  Events.accelerometerFailed,
) => unit = "onEvent"
@send
external offAccelerometerFailed: (
  t,
  @as("accelerometerFailed") _,
  Events.accelerometerFailed,
) => unit = "offEvent"

/**
 Occurs when device orientation tracking has started successfully.
 */
@send
external onDeviceOrientationStarted: (
  t,
  @as("deviceOrientationStarted") _,
  Events.deviceOrientationStarted,
) => unit = "onEvent"
@send
external offDeviceOrientationStarted: (
  t,
  @as("deviceOrientationStarted") _,
  Events.deviceOrientationStarted,
) => unit = "offEvent"

/**
 Occurs when device orientation tracking has stopped.
 */
@send
external onDeviceOrientationStopped: (
  t,
  @as("deviceOrientationStopped") _,
  Events.deviceOrientationStopped,
) => unit = "onEvent"
@send
external offDeviceOrientationStopped: (
  t,
  @as("deviceOrientationStopped") _,
  Events.deviceOrientationStopped,
) => unit = "offEvent"

/**
 Occurs with the specified frequency after calling the start method, sending the current orientation data.

 eventHandler receives no parameters, the current device orientation values can be received via this.alpha, this.beta and this.gamma respectively.
 */
@send
external onDeviceOrientationChanged: (
  t,
  @as("deviceOrientationChanged") _,
  Events.deviceOrientationChanged,
) => unit = "onEvent"
@send
external offDeviceOrientationChanged: (
  t,
  @as("deviceOrientationChanged") _,
  Events.deviceOrientationChanged,
) => unit = "offEvent"

/**
 Occurs if a request to start device orientation tracking fails.

 eventHandler receives an object with the single field error, describing the reason for the failure.
 */
@send
external onDeviceOrientationFailed: (
  t,
  @as("deviceOrientationFailed") _,
  Events.deviceOrientationFailed,
) => unit = "onEvent"
@send
external offDeviceOrientationFailed: (
  t,
  @as("deviceOrientationFailed") _,
  Events.deviceOrientationFailed,
) => unit = "offEvent"

/**
 Occurs when gyroscope tracking has started successfully.
 */
@send
external onGyroscopeStarted: (t, @as("gyroscopeStarted") _, Events.gyroscopeStarted) => unit =
  "onEvent"
@send
external offGyroscopeStarted: (t, @as("gyroscopeStarted") _, Events.gyroscopeStarted) => unit =
  "offEvent"

/**
 Occurs when gyroscope tracking has stopped.
 */
@send
external onGyroscopeStopped: (t, @as("gyroscopeStopped") _, Events.gyroscopeStopped) => unit =
  "onEvent"
@send
external offGyroscopeStopped: (t, @as("gyroscopeStopped") _, Events.gyroscopeStopped) => unit =
  "offEvent"

/**
 Occurs with the specified frequency after calling the start method, sending the current gyroscope data.

 eventHandler receives no parameters, the current rotation rates can be received via this.x, this.y and this.z respectively.
 */
@send
external onGyroscopeChanged: (t, @as("gyroscopeChanged") _, Events.gyroscopeChanged) => unit =
  "onEvent"
@send
external offGyroscopeChanged: (t, @as("gyroscopeChanged") _, Events.gyroscopeChanged) => unit =
  "offEvent"

/**
 Occurs if a request to start gyroscope tracking fails.

 eventHandler receives an object with the single field error, describing the reason for the failure.
 */
@send
external onGyroscopeFailed: (t, @as("gyroscopeFailed") _, Events.gyroscopeFailed) => unit =
  "onEvent"
@send
external offGyroscopeFailed: (t, @as("gyroscopeFailed") _, Events.gyroscopeFailed) => unit =
  "offEvent"

/**
 Occurs whenever LocationManager object is changed.
 */
@send
external onLocationManagerUpdated: (
  t,
  @as("locationManagerUpdated") _,
  Events.locationManagerUpdated,
) => unit = "onEvent"
@send
external offLocationManagerUpdated: (
  t,
  @as("locationManagerUpdated") _,
  Events.locationManagerUpdated,
) => unit = "offEvent"

/**
 Occurs when location data is requested.

 eventHandler receives an object with the single field locationData of type LocationData, containing the current location information.
 */
@send
external onLocationRequested: (t, @as("locationRequested") _, Events.locationRequested) => unit =
  "onEvent"
@send
external offLocationRequested: (t, @as("locationRequested") _, Events.locationRequested) => unit =
  "offEvent"

/**
 Occurs when the message is successfully shared by the user.
 */
@send
external onShareMessageSent: (t, @as("shareMessageSent") _, Events.shareMessageSent) => unit =
  "onEvent"
@send
external offShareMessageSent: (t, @as("shareMessageSent") _, Events.shareMessageSent) => unit =
  "offEvent"

/**
 Occurs if sharing the message fails.

 eventHandler receives an object with the single field error, describing the reason for the failure.
 */
@send
external onShareMessageFailed: (t, @as("shareMessageFailed") _, Events.shareMessageFailed) => unit =
  "onEvent"
@send
external offShareMessageFailed: (
  t,
  @as("shareMessageFailed") _,
  Events.shareMessageFailed,
) => unit = "offEvent"

/**
 Occurs when the emoji status is successfully set.
 */
@send
external onEmojiStatusSet: (t, @as("emojiStatusSet") _, Events.emojiStatusSet) => unit = "onEvent"
@send
external offEmojiStatusSet: (t, @as("emojiStatusSet") _, Events.emojiStatusSet) => unit = "offEvent"

/**
 Occurs if setting the emoji status fails.

 eventHandler receives an object with the single field error, describing the reason for the failure.
 */
@send
external onEmojiStatusFailed: (t, @as("emojiStatusFailed") _, Events.emojiStatusFailed) => unit =
  "onEvent"
@send
external offEmojiStatusFailed: (t, @as("emojiStatusFailed") _, Events.emojiStatusFailed) => unit =
  "offEvent"

/**
 Occurs when the write permission was requested.

 eventHandler receives an object with the single field status containing one of the statuses
 */
@send
external onEmojiStatusAccessRequested: (
  t,
  @as("emojiStatusAccessRequested") _,
  Events.emojiStatusAccessRequested,
) => unit = "onEvent"
@send
external offEmojiStatusAccessRequested: (
  t,
  @as("emojiStatusAccessRequested") _,
  Events.emojiStatusAccessRequested,
) => unit = "offEvent"

/**
 Occurs when the user responds to the file download request.

 eventHandler receives an object with the single field status containing one of the statuses.
 */
@send
external onFileDownloadRequested: (
  t,
  @as("fileDownloadRequested") _,
  Events.fileDownloadRequested,
) => unit = "onEvent"
@send
external offFileDownloadRequested: (
  t,
  @as("fileDownloadRequested") _,
  Events.fileDownloadRequested,
) => unit = "offEvent"

/**
 A method that sets the app event handler.
 */
@send
external onEvent: (t, string, unit => unit) => unit = "onEvent"

/**
 A method that deletes a previously set event handler.
 */
@send
external offEvent: (t, string, unit => unit) => unit = "offEvent"

/**
 A method that sets the app event handler.
 */
@send
external onEvent1: (t, string, 'a => unit) => unit = "onEvent"

/**
 A method that deletes a previously set event handler.
 */
@send
external offEvent1: (t, string, 'a => unit) => unit = "offEvent"

/**
 A method used to send data to the bot. When this method is called, a service message is sent to the bot containing the data data of the length up to 4096 bytes, and the Mini App is closed. See the field web_app_data in the class Message.

 This method is only available for Mini Apps launched via a Keyboard button.
 */
@send
external sendData: (t, string) => unit = "sendData"

type chooseChatType =
  | @as("users") Users
  | @as("bots") Bots
  | @as("groups") Groups
  | @as("channels") Channels

/**
 A method that inserts the bot's username and the specified inline query in the current chat's input field. Query may be empty, in which case only the bot's username will be inserted. If an optional choose_chat_types parameter was passed, the client prompts the user to choose a specific chat, then opens that chat and inserts the bot's username and the specified inline query in the input field. You can specify which types of chats the user will be able to choose from.
 */
@send
external switchInlineQuery: (t, string, ~choose_chat_types: array<chooseChatType>=?) => unit =
  "switchInlineQuery"

type openLinkOptions = {try_instant_view: bool}

/**
 A method that opens a link in an external browser. The Mini App will not be closed.
 
 Bot API 6.4+ If the optional options parameter is passed with the field try_instant_view=true, the link will be opened in Instant View mode if possible.

 Note that this method can be called only in response to user interaction with the Mini App interface (e.g. a click inside the Mini App or on the main button)
 */
@send
external openLink: (t, string, ~options: openLinkOptions=?) => unit = "openLink"

/**
 A method that opens a telegram link inside the Telegram app. The Mini App will not be closed after this method is called.

 Up to Bot API 7.0 The Mini App will be closed after this method is called.
 */
@send
external openTelegramLink: (t, string) => unit = "openTelegramLink"

/**
 A method that opens an invoice using the link url. The Mini App will receive the event invoiceClosed when the invoice is closed. If an optional callback parameter was passed, the callback function will be called and the invoice status will be passed as the first argument.
 */
@send
external openInvoice: (t, string, ~callback: invoiceStatus => unit=?) => unit = "openInvoice"

type storyWidgetLink = {
  url: string,
  name?: string,
}
type shareToStoryParams = {
  text?: string,
  widget_link?: storyWidgetLink,
}

/**
 A method that opens the native story editor with the media specified in the media_url parameter as an HTTPS URL. An optional params argument of the type StoryShareParams describes additional sharing settings.
 */
@send
external shareToStory: (t, string, ~params: shareToStoryParams=?) => unit = "shareToStory"

/**
 A method that opens a dialog allowing the user to share a message provided by the bot. If an optional callback parameter is provided, the callback function will be called with a boolean as the first argument, indicating whether the message was successfully sent. The message id passed to this method must belong to a PreparedInlineMessage previously obtained via the Bot API method savePreparedInlineMessage.
 */
@send
external shareMessage: (t, string, ~callback: bool => unit=?) => unit = "shareMessage"

type emojiStatusParams = {duration?: int}

/**
 A method that opens a dialog allowing the user to set the specified custom emoji as their status. An optional params argument of type EmojiStatusParams specifies additional settings, such as duration. If an optional callback parameter is provided, the callback function will be called with a boolean as the first argument, indicating whether the status was set.

 Note: this method opens a native dialog and cannot be used to set the emoji status without manual user interaction. For fully programmatic changes, you should instead use the Bot API method setUserEmojiStatus after obtaining authorization to do so via the Mini App method requestEmojiStatusAccess.
 */
@send
external setEmojiStatus: (
  t,
  string,
  ~params: emojiStatusParams=?,
  ~callback: bool => unit=?,
) => unit = "setEmojiStatus"

/**
 A method that shows a native popup requesting permission for the bot to manage user's emoji status. If an optional callback parameter was passed, the callback function will be called when the popup is closed and the first argument will be a boolean indicating whether the user granted this access.
 */
@send
external requestEmojiStatusAccess: (t, ~callback: bool => unit=?) => unit =
  "requestEmojiStatusAccess"

type downloadFileParams = {
  url: string,
  file_name: string,
}

/**
 A method that displays a native popup prompting the user to download a file specified by the params argument of type DownloadFileParams. If an optional callback parameter is provided, the callback function will be called when the popup is closed, with the first argument as a boolean indicating whether the user accepted the download request.
 */
@send
external downloadFile: (t, ~params: downloadFileParams=?, ~callback: bool => unit=?) => unit =
  "downloadFile"

/**
 A method that hides the on-screen keyboard, if it is currently visible. Does nothing if the keyboard is not active.
 */
@send
external hideKeyboard: t => unit = "hideKeyboard"

type popupButtonType =
  | @as("default") Default // a button with the default style,
  | @as("ok") Ok // a button with the localized text “OK”,
  | @as("close") Close // a button with the localized text “Close”,
  | @as("cancel") Cancel // a button with the localized text “Cancel”,
  | @as("destructive") Destructive // a button with a style that indicates a destructive action (e.g. “Remove”, “Delete”, etc.).

type popupButton = {
  id?: string,
  @as("type") type_?: popupButtonType,
  text?: string,
}

type popupParams = {
  title?: string,
  message: string,
  buttons: array<popupButton>,
}
/**
 A method that shows a native popup described by the params argument of the type PopupParams. The Mini App will receive the event popupClosed when the popup is closed. If an optional callback parameter was passed, the callback function will be called and the field id of the pressed button will be passed as the first argument.
 */
@send
external showPopup: (t, ~params: popupParams=?, ~callback: string => unit=?) => unit = "showPopup"

/**
 A method that shows message in a simple alert with a 'Close' button. If an optional callback parameter was passed, the callback function will be called when the popup is closed.
 */
@send
external showAlert: (t, string, ~callback: unit => unit=?) => unit = "showAlert"

/**
 A method that shows message in a simple confirmation window with 'OK' and 'Cancel' buttons. If an optional callback parameter was passed, the callback function will be called when the popup is closed and the first argument will be a boolean indicating whether the user pressed the 'OK' button.
 */
@send
external showConfirm: (t, string, ~callback: bool => unit=?) => unit = "showConfirm"

type scanQrPopupParams = {text?: string}

/**
 A method that shows a native popup for scanning a QR code described by the params argument of the type ScanQrPopupParams. The Mini App will receive the event qrTextReceived every time the scanner catches a code with text data. If an optional callback parameter was passed, the callback function will be called and the text from the QR code will be passed as the first argument. Returning true inside this callback function causes the popup to be closed. Starting from Bot API 7.7, the Mini App will receive the scanQrPopupClosed event if the user closes the native popup for scanning a QR code.
 */
@send
external showScanQrPopup: (t, ~params: scanQrPopupParams, ~callback: string => bool=?) => unit =
  "showScanQrPopup"

/**
 A method that closes the native popup for scanning a QR code opened with the showScanQrPopup method. Run it if you received valid data in the event qrTextReceived.
 */
@send
external closeScanQrPopup: t => unit = "closeScanQrPopup"

/**
 A method that requests text from the clipboard. The Mini App will receive the event clipboardTextReceived. If an optional callback parameter was passed, the callback function will be called and the text from the clipboard will be passed as the first argument.

 Note: this method can be called only for Mini Apps launched from the attachment menu and only in response to a user interaction with the Mini App interface (e.g. a click inside the Mini App or on the main button).
 */
@send
external readTextFromClipboard: (t, ~callback: string => unit=?) => unit = "readTextFromClipboard"

/**
 A method that shows a native popup requesting permission for the bot to send messages to the user. If an optional callback parameter was passed, the callback function will be called when the popup is closed and the first argument will be a boolean indicating whether the user granted this access.
 */
@send
external requestWriteAccess: (t, ~callback: bool => unit=?) => unit = "requestWriteAccess"

/**
 A method that shows a native popup prompting the user for their phone number. If an optional callback parameter was passed, the callback function will be called when the popup is closed and the first argument will be a boolean indicating whether the user shared its phone number.
 */
@send
external requestContact: (t, ~callback: bool => unit=?) => unit = "requestContact"

/**
 A method that informs the Telegram app that the Mini App is ready to be displayed.

 It is recommended to call this method as early as possible, as soon as all essential interface elements are loaded. Once this method is called, the loading placeholder is hidden and the Mini App is shown.

 If the method is not called, the placeholder will be hidden only when the page is fully loaded.
 */
@send
external ready: t => unit = "ready"

/**
 A method that expands the Mini App to the maximum available height. To find out if the Mini App is expanded to the maximum height, refer to the value of the Telegram.WebApp.isExpanded parameter
 */
@send
external expand: t => unit = "expand"

/**
 A method that closes the Mini App.
 */
@send
external close: t => unit = "close"
