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
