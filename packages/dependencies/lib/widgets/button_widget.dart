import 'package:flutter/material.dart';

///
///
///
class ButtonWidget extends ElevatedButton {
  ///
  ButtonWidget({
    super.key,
    required super.onPressed,
    required String text,
  }) : super(
          child: Text(text),
        );
}
