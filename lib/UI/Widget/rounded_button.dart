import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Color color;
  final double width;
  final double height;
  final double elevation;
  final Widget widget;
  final VoidCallback? onPressed;
  const RoundedButton(
      {Key? key,
      required this.color,
      required this.widget,
      required this.onPressed, required this.elevation, required this.width, required this.height})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(

        elevation: elevation,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(

          minWidth: width,
          height: height,
          onPressed: onPressed,
          child: widget,
        ),
      ),
    );
  }
}
