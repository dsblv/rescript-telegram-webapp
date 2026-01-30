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
