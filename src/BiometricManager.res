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
external authenticate: (t, biometricAuthenticateParams, ~callback: (bool, string) => unit=?) => t =
  "authenticate"

/**
 A method that updates the biometric token in secure storage on the device. To remove the token, pass an empty string. If an optional callback parameter was passed, the callback function will be called and the first argument will be a boolean indicating whether the token was updated.
 */
@send
external updateBiometricToken: (t, string, ~callback: bool => unit=?) => t = "updateBiometricToken"

/**
 A method that opens the biometric access settings for bots. Useful when you need to request biometrics access to users who haven't granted it yet.

 Note that this method can be called only in response to user interaction with the Mini App interface (e.g. a click inside the Mini App or on the main button)
 */
@send
external openSettings: t => t = "openSettings"
