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

type webAppChat = {
  id: int,
  @as("type") type_: string,
  title: string,
  username?: string,
  photo_url?: string,
}

/**
 This object contains data that is transferred to the Mini App when it is opened. It is empty if the Mini App was launched from a keyboard button or from inline mode.
 */
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

type colorScheme =
  | @as("light") Light
  | @as("dark") Dark

/**
 ThemeParams
 Mini Apps can adjust the appearance of the interface to match the Telegram user's app in real time. This object contains the user's current theme settings:
 */
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

type safeAreaInset = {
  top: int,
  bottom: int,
  left: int,
  right: int,
}

type contentSafeAreaInset = {
  top: int,
  bottom: int,
  left: int,
  right: int,
}

/**
 This object controls the back button, which can be displayed in the header of the Mini App in the Telegram interface.
 */
module BackButton = {
  type t = {mutable isVisible: bool}

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
}

/**
 This object controls the button that is displayed at the bottom of the Mini App in the Telegram interface.
 */
module BottomButton = {
  type bottomButtonType =
    | @as("main") Main
    | @as("secondary") Secondary

  type bottomButtonPosition =
    | @as("left") Left // displayed to the left of the main button,
    | @as("right") Right // displayed to the right of the main button,
    | @as("top") Top // displayed above the main button,
    | @as("bottom") Bottom // displayed below the main button.

  type t = {
    @as("type") type_: bottomButtonType,
    mutable text: string,
    mutable color: string,
    mutable textColor: string,
    mutable isVisible: bool,
    mutable isActive: bool,
    mutable hasShineEffect: bool,
    mutable position: option<bottomButtonPosition>,
    isProgressVisible: bool,
  }

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
}

/**
 This object controls the Settings item in the context menu of the Mini App in the Telegram interface.
 */
module SettingsButton = {
  type t = {mutable isVisible: bool}

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
}

/**
 An object for controlling haptic feedback.
 */
module HapticFeedback = {
  type t
  type impactStyle =
    | @as("light") Light // indicates a collision between small or lightweight UI objects,
    | @as("medium") Medium // indicates a collision between medium-sized or medium-weight UI objects,
    | @as("heavy") Heavy // indicates a collision between large or heavyweight UI objects,
    | @as("rigid") Rigid // indicates a collision between hard or inflexible UI objects,
    | @as("soft") Soft // indicates a collision between soft or flexible UI objects.

  /**
   A method tells that an impact occurred. The Telegram app may play the appropriate haptics based on style value passed.
   */
  @send
  external impactOccured: (t, impactStyle) => unit = "impactOccured"

  type notificationType =
    | @as("error") Error // indicates that a task or action has failed,
    | @as("success") Success // indicates that a task or action has completed successfully,
    | @as("warning") Warning // indicates that a task or action produced a warning.

  /**
   A method tells that a task or action has succeeded, failed, or produced a warning. The Telegram app may play the appropriate haptics based on type value passed.
   */
  @send
  external notificationOccurred: (t, notificationType) => unit = "notificationOccurred"

  /**
   A method tells that the user has changed a selection. The Telegram app may play the appropriate haptics.

   Do not use this feedback when the user makes or confirms a selection; use it only when the selection changes.
   */
  @send
  external selectionChanged: (t, notificationType) => unit = "selectionChanged"
}

/**
 This object controls the cloud storage. Each bot can store up to 1024 items per user in the cloud storage.
 */
module CloudStorage = {
  type t

  @unboxed
  type cloudStorageError =
    | @as("UNKNOWN_ERROR") UnknownError
    | UndocumentedError(string)

  /**
   A method that stores a value in the cloud storage using the specified key. The key should contain 1-128 characters, only A-Z, a-z, 0-9, _ and - are allowed. The value should contain 0-4096 characters. You can store up to 1024 keys in the cloud storage. If an optional callback parameter was passed, the callback function will be called. In case of an error, the first argument will contain the error. In case of success, the first argument will be null and the second argument will be a boolean indicating whether the value was stored.
   */
  @send
  external setItem: (
    t,
    string,
    string,
    ~callback: (Null.t<cloudStorageError>, option<bool>) => unit=?,
  ) => t = "setItem"

  /**
   A method that receives a value from the cloud storage using the specified key. The key should contain 1-128 characters, only A-Z, a-z, 0-9, _ and - are allowed. In case of an error, the callback function will be called and the first argument will contain the error. In case of success, the first argument will be null and the value will be passed as the second argument.
   */
  @send
  external getItem: (
    t,
    string,
    ~callback: (Null.t<cloudStorageError>, option<string>) => unit,
  ) => t = "getItem"

  /**
   A method that receives values from the cloud storage using the specified keys. The keys should contain 1-128 characters, only A-Z, a-z, 0-9, _ and - are allowed. In case of an error, the callback function will be called and the first argument will contain the error. In case of success, the first argument will be null and the values will be passed as the second argument.
   */
  @send
  external getItems: (
    t,
    array<string>,
    ~callback: (Null.t<cloudStorageError>, option<array<string>>) => unit,
  ) => t = "getItems"

  @send
  external removeItem: (
    t,
    string,
    ~callback: (Null.t<cloudStorageError>, option<bool>) => unit,
  ) => t = "removeItem"

  /**
   A method that removes values from the cloud storage using the specified keys. The keys should contain 1-128 characters, only A-Z, a-z, 0-9, _ and - are allowed. If an optional callback parameter was passed, the callback function will be called. In case of an error, the first argument will contain the error. In case of success, the first argument will be null and the second argument will be a boolean indicating whether the values were removed.
   */
  @send
  external removeItems: (
    t,
    array<string>,
    ~callback: (Null.t<cloudStorageError>, option<bool>) => unit,
  ) => t = "removeItems"

  /**
   A method that receives the list of all keys stored in the cloud storage. In case of an error, the callback function will be called and the first argument will contain the error. In case of success, the first argument will be null and the list of keys will be passed as the second argument.
   */
  @send
  external getKeys: (
    t,
    ~callback: (Null.t<cloudStorageError>, option<array<string>>) => unit,
  ) => t = "getKeys"
}

/**
 This object controls biometrics on the device. Before the first use of this object, it needs to be initialized using the init method.
 */
module BiometricManager = {
  type t = {
    isInited: bool,
    isBiometricAvailable: bool,
    biometricType: string,
    isAccessRequested: bool,
    isAccessGranted: bool,
    isBiometricTokenSaved: bool,
    deviceId: string,
  }

  /**
   A method that initializes the BiometricManager object. It should be called before the object's first use. If an optional callback parameter was passed, the callback function will be called when the object is initialized.
   */
  @send
  external init: (t, ~callback: unit => unit=?) => t = "init"

  type biometricRequestAccessParams = {reason?: string}

  /**
   A method that requests permission to use biometrics according to the params argument of type BiometricRequestAccessParams. If an optional callback parameter was passed, the callback function will be called and the first argument will be a boolean indicating whether the user granted access.
   */
  @send
  external requestAccess: (t, biometricRequestAccessParams, ~callback: bool => unit=?) => t =
    "requestAccess"

  type biometricAuthenticateParams = {reason?: string}

  /**
   A method that authenticates the user using biometrics according to the params argument of type BiometricAuthenticateParams. If an optional callback parameter was passed, the callback function will be called and the first argument will be a boolean indicating whether the user authenticated successfully. If so, the second argument will be a biometric token.
   */
  @send
  external authenticate: (
    t,
    biometricAuthenticateParams,
    ~callback: (bool, string) => unit=?,
  ) => t = "authenticate"

  /**
   A method that updates the biometric token in secure storage on the device. To remove the token, pass an empty string. If an optional callback parameter was passed, the callback function will be called and the first argument will be a boolean indicating whether the token was updated.
   */
  @send
  external updateBiometricToken: (t, string, ~callback: bool => unit=?) => t =
    "updateBiometricToken"

  /**
   A method that opens the biometric access settings for bots. Useful when you need to request biometrics access to users who haven't granted it yet.

   Note that this method can be called only in response to user interaction with the Mini App interface (e.g. a click inside the Mini App or on the main button)
   */
  @send
  external openSettings: t => t = "openSettings"
}

/**
 This object provides access to accelerometer data on the device.
 */
module Accelerometer = {
  type t = {
    isStarted: bool,
    x: float,
    y: float,
    z: float,
  }

  type accelerometerStartParams = {refresh_rate?: int}

  /**
   Starts tracking accelerometer data using params of type AccelerometerStartParams. If an optional callback parameter is provided, the callback function will be called with a boolean indicating whether tracking was successfully started.
   */
  @send
  external start: (t, accelerometerStartParams, ~callback: bool => unit=?) => t = "start"

  /**
   Stops tracking accelerometer data. If an optional callback parameter is provided, the callback function will be called with a boolean indicating whether tracking was successfully stopped.
   */
  @send
  external stop: (t, ~callback: bool => unit=?) => t = "stop"
}

/**
 This object provides access to orientation data on the device.
 */
module DeviceOrientation = {
  type t = {
    isStarted: bool,
    absolute: bool,
    alpha: float,
    beta: float,
    gamma: float,
  }

  type deviceOrientationStartParams = {
    refresh_rate?: int,
    need_absolute?: bool,
  }

  /**
   Starts tracking device orientation data using params of type DeviceOrientationStartParams. If an optional callback parameter is provided, the callback function will be called with a boolean indicating whether tracking was successfully started.
   */
  @send
  external start: (t, deviceOrientationStartParams, ~callback: bool => unit=?) => t = "start"

  /**
   Stops tracking device orientation data. If an optional callbackparameter is provided, the callback function will be called with a boolean indicating whether tracking was successfully stopped.
   */
  @send
  external stop: (t, ~callback: bool => unit=?) => t = "stop"
}

/**
 This object provides access to gyroscope data on the device.
 */
module Gyroscope = {
  type t = {
    isStarted: bool,
    x: float,
    y: float,
    z: float,
  }

  type gyroscopeStartParams = {refresh_rate?: int}

  /**
   Starts tracking gyroscope data using params of type GyroscopeStartParams. If an optional callback parameter is provided, the callbackfunction will be called with a boolean indicating whether tracking was successfully started.
   */
  @send
  external start: (t, gyroscopeStartParams, ~callback: bool => unit=?) => t = "start"

  /**
   Stops tracking gyroscope data. If an optional callback parameter is provided, the callback function will be called with a boolean indicating whether tracking was successfully stopped.
   */
  @send
  external stop: (t, ~callback: bool => unit=?) => t = "stop"
}

/**
 This object controls location access on the device. Before the first use of this object, it needs to be initialized using the init method.
 */
module LocationManager = {
  type t = {
    isInited: bool,
    isLocationAvailable: bool,
    isAccessRequested: bool,
    isAccessGranted: bool,
  }

  /**
   A method that initializes the LocationManager object. It should be called before the object's first use. If an optional callback parameter is provided, the callback function will be called when the object is initialized.
   */
  @send
  external init: (t, ~callback: unit => unit=?) => t = "init"

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

  /**
   A method that requests location data. The callback function will be called with null as the first argument if access to location was not granted, or an object of type LocationData as the first argument if access was successful.
   */
  @send
  external getLocation: (t, ~callback: locationData => unit) => t = "getLocation"

  /**
   A method that opens the location access settings for bots. Useful when you need to request location access from users who haven't granted it yet.

    Note that this method can be called only in response to user interaction with the Mini App interface (e.g., a click inside the Mini App or on the main button)."
   */
  @send
  external openSetting: t => t = "openSettings"
}

/**
 This object provides access to persistent local storage on the user’s device. It is conceptually similar to the browser's localStorage API, but integrated within the Telegram client. All data is stored locally and is available only to the bot that created it. Each bot can store up to 5 MB per user using this storage.
 */
module DeviceStorage = {
  type t

  @unboxed
  type deviceStorageError =
    | @as("UNKNOWN_ERROR") UnknownError
    | UndocumentedError(string)

  /**
   A method that stores a value in the device's local storage using the specified key. If an optional callback parameter was passed, the callback function will be called. In case of an error, the first argument will contain the error. In case of success, the first argument will be null and the second argument will be a boolean indicating whether the value was stored.
   */
  @send
  external setItem: (
    t,
    string,
    string,
    ~callback: (Null.t<deviceStorageError>, option<bool>) => unit=?,
  ) => t = "setItem"

  /**
   A method that receives a value from the device's local storage using the specified key. In case of an error, the callback function will be called and the first argument will contain the error. In case of success, the first argument will be null and the value will be passed as the second argument.
   */
  @send
  external getItem: (
    t,
    string,
    ~callback: (Null.t<deviceStorageError>, option<string>) => unit,
  ) => t = "getItem"

  /**
   A method that removes a value from the device's local storage using the specified key. If an optional callback parameter was passed, the callbackfunction will be called. In case of an error, the first argument will contain the error. In case of success, the first argument will be null and the second argument will be a boolean indicating whether the value was removed.
   */
  @send
  external removeItem: (
    t,
    string,
    ~callback: (Null.t<deviceStorageError>, option<bool>) => unit=?,
  ) => t = "removeItem"

  /**
   A method that clears all keys previously stored by the bot in the device's local storage. If an optional callback parameter was passed, the callbackfunction will be called. In case of an error, the first argument will contain the error. In case of success, the first argument will be null and the second argument will be a boolean indicating whether all values were removed.
   */
  @send
  external clear: (t, ~callback: (Null.t<deviceStorageError>, option<bool>) => unit=?) => t =
    "clear"
}

/**
 This object provides access to a secure storage on the user’s device for sensitive data. On iOS, it uses the system Keychain; on Android, it uses the Keystore. This ensures that all stored values are encrypted at rest and inaccessible to unauthorized applications.

 Secure storage is suitable for storing tokens, secrets, authentication state, and other sensitive user-specific information. Each bot can store up to 10 items per user.
 */
module SecureStorage = {
  type t

  @unboxed
  type secureStorageError =
    | @as("UNKNOWN_ERROR") UnknownError
    | UndocumentedError(string)

  /**
   A method that stores a value in the device's secure storage using the specified key. If an optional callback parameter was passed, the callback function will be called. In case of an error, the first argument will contain the error. In case of success, the first argument will be null and the second argument will be a boolean indicating whether the value was stored.
   */
  @send
  external setItem: (
    t,
    string,
    string,
    ~callback: (Null.t<secureStorageError>, option<bool>) => unit=?,
  ) => t = "setItem"

  /**
   A method that receives a value from the device's secure storage using the specified key. In case of an error, the callback function will be called and the first argument will contain the error. In case of success, the first argument will be null and the value will be passed as the second argument. If the key was not found, the second argument will be null, and the third argument will be a boolean indicating whether the key can be restored from the current device.
   */
  @send
  external getItem: (
    t,
    string,
    ~callback: (Null.t<secureStorageError>, option<string>) => unit,
  ) => t = "getItem"

  /**
   Attempts to restore a key that previously existed on the current device. When called, the user will be asked for permission to restore the value. If the user declines or an error occurs, the first argument in the callback will contain the error. If restored successfully, the first argument will be null and the second argument will contain the restored value.
   */
  @send
  external restoreItem: (
    t,
    string,
    ~callback: (Null.t<secureStorageError>, option<string>) => unit=?,
  ) => t = "restoreItem"

  /**
   A method that removes a value from the device's secure storage using the specified key. If an optional callback parameter was passed, the callbackfunction will be called. In case of an error, the first argument will contain the error. In case of success, the first argument will be null and the second argument will be a boolean indicating whether the value was removed.
   */
  @send
  external removeItem: (
    t,
    string,
    ~callback: (Null.t<secureStorageError>, option<bool>) => unit=?,
  ) => t = "removeItem"

  /**
   A method that clears all keys previously stored by the bot in the device's secure storage. If an optional callback parameter was passed, the callbackfunction will be called. In case of an error, the first argument will contain the error. In case of success, the first argument will be null and the second argument will be a boolean indicating whether all values were removed.
   */
  @send
  external clear: (t, ~callback: (Null.t<secureStorageError>, option<bool>) => unit=?) => t =
    "clear"
}

@editor.completeFrom([TelegramWebApp, Events])
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
  @as("BackButton") backButton: BackButton.t,
  @as("MainButton") mainButton: BottomButton.t,
  @as("SecondaryButton") secondaryButton: BottomButton.t,
  @as("Settings") settings: SettingsButton.t,
  @as("HapticFeedback") hapticFeedback: HapticFeedback.t,
  @as("CloudStorage") cloudStorage: CloudStorage.t,
  @as("BiometricManager") biometricManager: BiometricManager.t,
  @as("Accelerometer") accelerometer: Accelerometer.t,
  @as("DeviceOrientation") deviceOrientation: DeviceOrientation.t,
  @as("Gyroscope") gyroscope: Gyroscope.t,
  @as("LocationManager") locationManager: LocationManager.t,
  @as("DeviceStorage") deviceStorage: DeviceStorage.t,
  @as("SecureStorage") secureStorage: SecureStorage.t,
}

/**
 A reference to global Telegram.WebApp object.

 Assumes `<script src="https://telegram.org/js/telegram-web-app.js?59"></script>`
 is connectede beforehand.
 */
module Global = {
  @scope(("window", "Telegram")) @val
  external telegramWebApp: t = "WebApp"
}

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
