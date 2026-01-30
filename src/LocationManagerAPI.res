open LocationManager

/**
 A method that initializes the LocationManager object. It should be called before the object's first use. If an optional callback parameter is provided, the callback function will be called when the object is initialized.
 */
@send
external init: (t, ~callback: unit => unit=?) => t = "init"

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
