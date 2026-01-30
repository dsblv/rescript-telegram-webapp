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
