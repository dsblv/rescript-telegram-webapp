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

@editor.completeFrom(WebAppAPI)
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
