type bottomButtonType =
  | @as("main") Main
  | @as("secondary") Secondary

type bottomButtonPosition =
  | @as("left") Left // displayed to the left of the main button,
  | @as("right") Right // displayed to the right of the main button,
  | @as("top") Top // displayed above the main button,
  | @as("bottom") Bottom // displayed below the main button.

@editor.completeFrom(BottomButtonAPI)
type t = {
  @as("type") type_: bottomButtonType,
  mutable text: string,
  mutable color: string,
  mutable textColor: string,
  mutable isVisible: bool,
  mutable isActive: bool,
  mutable hasShineEffect: bool,
  mutable position: option<bottomButtonPosition>,
  isProgressVisible: bool,
}
