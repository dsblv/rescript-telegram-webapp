type t
type impactStyle =
  | @as("light") Light // indicates a collision between small or lightweight UI objects,
  | @as("medium") Medium // indicates a collision between medium-sized or medium-weight UI objects,
  | @as("heavy") Heavy // indicates a collision between large or heavyweight UI objects,
  | @as("rigid") Rigid // indicates a collision between hard or inflexible UI objects,
  | @as("soft") Soft // indicates a collision between soft or flexible UI objects.

/**
 A method tells that an impact occurred. The Telegram app may play the appropriate haptics based on style value passed.
 */
@send
external impactOccured: (t, impactStyle) => unit = "impactOccured"

type notificationType =
  | @as("error") Error // indicates that a task or action has failed,
  | @as("success") Success // indicates that a task or action has completed successfully,
  | @as("warning") Warning // indicates that a task or action produced a warning.

/**
 A method tells that a task or action has succeeded, failed, or produced a warning. The Telegram app may play the appropriate haptics based on type value passed.
 */
@send
external notificationOccurred: (t, notificationType) => unit = "notificationOccurred"

/**
 A method tells that the user has changed a selection. The Telegram app may play the appropriate haptics.

 Do not use this feedback when the user makes or confirms a selection; use it only when the selection changes.
 */
@send
external selectionChanged: (t, notificationType) => unit = "selectionChanged"
