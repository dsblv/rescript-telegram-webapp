open SecureStorage

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
external clear: (t, ~callback: (Null.t<secureStorageError>, option<bool>) => unit=?) => t = "clear"
