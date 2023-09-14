import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle appMStyle(double size, Color color, FontWeight fw) {
  return GoogleFonts.poppins(fontSize: size.sp, color: color, fontWeight: fw);
}

TextStyle appBStyle(double size, Color color, FontWeight fw) {
  return GoogleFonts.inter(fontSize: size.sp, color: color, fontWeight: fw);
}
