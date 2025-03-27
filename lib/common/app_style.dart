// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';

// TextStyle appStyle(double size, Color color,FontWeight fontWeight){
//   return GoogleFonts.poppins(
//     fontSize: size.sp,
//     color: color,
//     fontWeight: fontWeight,

//   );
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle appStyle(double baseSize, Color color, FontWeight fontWeight, {String? text}) {
  final effectiveSize = text != null 
      ? _calculateAdaptiveSize(baseSize, text) 
      : baseSize.sp;

  return GoogleFonts.poppins(
    fontSize: effectiveSize,
    color: color,
    fontWeight: fontWeight,
  );
}

double _calculateAdaptiveSize(double baseSize, String text) {
  final words = text.trim().split(RegExp(r'\s+'));
  final wordCount = words.length;
  final longestWordLength = words.fold(0, (max, word) => word.length > max ? word.length : max);

  if (wordCount >= 3 || longestWordLength > 10) {
    return (baseSize * 0.8).sp; // 20% smaller for long text
  } else if (wordCount == 2 || longestWordLength > 7) {
    return (baseSize * 0.9).sp; // 10% smaller for medium text
  }
  return baseSize.sp; // Normal size for short text
}