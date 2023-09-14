import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension OnTextExtension on Widget {
  Widget reusableText(String text, {required TextStyle style}) {
    return Text(text, style: style);
  }
}

extension OnWidthSpacer on num {
  Widget get sbW => SizedBox(width: w);
}

extension OnHeightSpacer on num {
  Widget get sbH => SizedBox(height: h);
}

extension OnCenter on Widget {
  Widget get center => Center();
}

// ? if it is a double

extension WidgetDExtensions on double {
  Widget get sbH => SizedBox(
        height: h,
      );
  Widget get sbW => SizedBox(
        height: w,
      );
  EdgeInsetsGeometry get padA => EdgeInsets.all(this);
  EdgeInsetsGeometry get padV => EdgeInsets.symmetric(vertical: h);
  EdgeInsetsGeometry get padH => EdgeInsets.symmetric(vertical: w);
}

// extension WidgetAnimation on Widget {
//   Animate fadeInFromTop({
//     Duration? delay,
//     Duration? animationDuration,
//     Offset? offset,
//   }) =>
//       animate(delay: delay ?? 500.ms)
//           .move(
//               duration: animationDuration ?? 500.ms,
//               begin: offset ?? const Offset(0, -1))
//           .fade(duration: animationDuration ?? 500.ms);

//   Animate fadeIFromBottom({
//     Duration? delay,
//     Duration? animationDuration,
//     Offset? offset,
//   }) =>
//       animate(delay: delay ?? 500.ms)
//           .move(
//               duration: animationDuration ?? 500.ms,
//               begin: offset ?? const Offset(0, 10))
//           .fade(duration: animationDuration ?? 500.ms);

//   Animate transitionToLeft({
//     Duration? delay,
//     Duration? animationDuration,
//     Offset? offset,
//   }) =>
//       animate(delay: delay ?? 500.ms).moveX();
// }
