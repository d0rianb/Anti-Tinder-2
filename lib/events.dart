enum ButtonType { Like, Info, Nope, None }

class ActionButtonFocusedEvent {
  final ButtonType buttonType;

  ActionButtonFocusedEvent(this.buttonType);
}
