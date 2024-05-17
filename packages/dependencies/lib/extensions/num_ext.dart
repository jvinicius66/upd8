import 'package:flutter/material.dart';

///
/// extension of number
///
extension NumExt on num {
  /// return box with width
  SizedBox get spaceHorizontal => SizedBox(width: toDouble());

  /// return box with height
  SizedBox get spaceVertical => SizedBox(height: toDouble());

  /// return edge on top
  EdgeInsets get edgeTop => EdgeInsets.only(top: toDouble());

  /// return edge on left
  EdgeInsets get edgeLeft => EdgeInsets.only(left: toDouble());

  /// return edge on bottom
  EdgeInsets get edgeBottom => EdgeInsets.only(bottom: toDouble());

  /// return edge on right
  EdgeInsets get edgeRight => EdgeInsets.only(right: toDouble());

  /// return edge on horizontal
  EdgeInsets get edgeHorizontal => EdgeInsets.symmetric(horizontal: toDouble());

  /// return edge on vertical
  EdgeInsets get edgeVertical => EdgeInsets.symmetric(vertical: toDouble());

  /// return edge on all directions
  EdgeInsets get edgeAll => EdgeInsets.all(toDouble());
}
