open CloudStorage

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
external getItem: (t, string, ~callback: (Null.t<cloudStorageError>, option<string>) => unit) => t =
  "getItem"

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
external getKeys: (t, ~callback: (Null.t<cloudStorageError>, option<array<string>>) => unit) => t =
  "getKeys"
