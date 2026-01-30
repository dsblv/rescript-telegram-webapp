@editor.completeFrom(LocationManagerAPI)
type t = {
  isInited: bool,
  isLocationAvailable: bool,
  isAccessRequested: bool,
  isAccessGranted: bool,
}

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
