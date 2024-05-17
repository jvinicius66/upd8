import 'package:flutter/material.dart';

///
/// extensions of widgets
///
extension WidgetExt on Widget {
  /// add SizedBox in widget
  /// params: width [double], height [double]
  Widget addBox({double? width, double? height}) => SizedBox(
        width: width,
        height: height,
        child: this,
      );

  /// add expanded in widget
  /// params: flex = 1 [int]
  Widget addExpanded({int flex = 1}) => Expanded(
        flex: flex,
        child: this,
      );

  /// add flexible in widget
  /// params: flex = 1 [int]
  Widget addFlexible({int flex = 1}) => Flexible(
        flex: flex,
        child: this,
      );

  /// add center widget
  Widget addCenter() => Center(
        child: this,
      );

  /// add padding widget
  /// params: padding [EdgeInsets]
  Widget addPadding(EdgeInsets padding) => Padding(
        padding: padding,
        child: this,
      );

  /// add margin widget
  /// params: margin [EdgeInsets]
  Widget addMargin(EdgeInsets margin) => Container(
        margin: margin,
        child: this,
      );

  /// add tap on widget
  /// params:
  ///   onTap [GestureTapCallback],
  ///   highlightColor [Color],
  ///   splashColor [Color]
  Widget addOnTap(
    GestureTapCallback onTap, {
    GestureLongPressCallback? onLongPress,
    Color? highlightColor,
    Color? splashColor,
    Color? hoverColor,
    ShapeBorder? shapeBorder,
  }) =>
      Material(
        color: Colors.transparent,
        child: InkWell(
          customBorder: shapeBorder,
          onTap: onTap,
          onLongPress: onLongPress,
          highlightColor: highlightColor,
          splashColor: highlightColor,
          hoverColor: hoverColor,
          child: this,
        ),
      );

  /// add alignment in widget
  /// params: alignment [AlignmentGeometry]
  Widget addAlign(AlignmentGeometry alignment) => Align(
        alignment: alignment,
        child: this,
      );

  /// add tooltip message in widget
  Widget addTooltip(String tip, {EdgeInsets? padding}) => Tooltip(
        message: tip,
        padding: padding,
        child: this,
      );

  /// add hero effect in widget
  Widget addHero(Object? tag) => tag == null
      ? this
      : Hero(
          tag: tag,
          child: this,
        );

  /// add banner
  Widget addBanner({
    required String message,
    required Color color,
    bool show = true,
    Key? key,
    BannerLocation location = BannerLocation.topStart,
    TextDirection direction = TextDirection.ltr,
  }) =>
      !show
          ? this
          : SafeArea(
              child: ClipRect(
                child: Banner(
                  key: key ?? const Key('keyBanner'),
                  location: location,
                  message: message,
                  color: color,
                  textDirection: direction,
                  child: this,
                ),
              ),
            );

  /// add ignore pointer
  Widget addIgnorePointer() => IgnorePointer(
        child: this,
      );

  /// convert gray scale widget
  Widget addGrayScale([bool apply = true]) => !apply
      ? this
      : ColorFiltered(
          colorFilter: const ColorFilter.mode(
            Colors.grey,
            BlendMode.saturation,
          ),
          child: this,
        );

  /// add opacity in widget
  Widget addOpacity(double opacity) => opacity == 1.0
      ? this
      : Opacity(
          opacity: opacity,
          child: this,
        );

  /// add crip in widget
  Widget addClip([
    Clip clip = Clip.antiAliasWithSaveLayer,
    double borderRadius = 10,
  ]) =>
      ClipRRect(
        clipBehavior: clip,
        borderRadius: BorderRadius.circular(borderRadius),
        child: this,
      );
}
