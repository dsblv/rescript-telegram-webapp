@editor.completeFrom(BiometricManagerAPI)
type t = {
  isInited: bool,
  isBiometricAvailable: bool,
  biometricType: string,
  isAccessRequested: bool,
  isAccessGranted: bool,
  isBiometricTokenSaved: bool,
  deviceId: string,
}
