import 'package:anti_tinder_2/events.dart';
import 'package:flutter/material.dart';

import 'main.dart' show eventBus;

class ActionButton extends StatefulWidget {
  final IconData icon;
  final ButtonType type;
  final Color buttonColor;
  final Function? action;

  const ActionButton(this.type, this.icon, this.buttonColor, this.action, {Key? key});

  @override
  ActionButtonState createState() => ActionButtonState();
}

class ActionButtonState extends State<ActionButton> {
  bool isFocus = false;

  @override
  void initState() {
    eventBus.on<ActionButtonFocusedEvent>().listen((event) {
      if (!mounted) return; // Avoid the `setState() called after dispose()` error
      if (event.buttonType == widget.type) {
        setState(() => isFocus = true);
      } else {
        setState(() => isFocus = false);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Material(
        key: widget.key,
        elevation: 2.0,
        type: MaterialType.circle,
        color: widget.buttonColor,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          child: Container(
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.buttonColor,
              boxShadow: const [
                BoxShadow(
                  color: Colors.white10,
                  blurRadius: 3.0,
                  spreadRadius: 0.0,
                  offset: Offset(0.0, 0.5),
                )
              ],
              gradient: RadialGradient(
                colors: [Colors.white, widget.buttonColor.withOpacity(0.1)],
                radius: isFocus ? 2.5 : 12.5,
              ),
            ),
            child: Icon(
              widget.icon,
              size: 50,
              color: widget.buttonColor,
            ),
          ),
          onTap: () => widget.action!(),
        ),
      );
}
