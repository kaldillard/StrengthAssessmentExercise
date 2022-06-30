import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

var bubbleDiameter = 272.sp;

var bubbleBoxDecoration = BoxDecoration(
  color: Color(0xff53a99a),
  shape: BoxShape.circle,
  boxShadow: [
    BoxShadow(
      offset: Offset(0, 27),
      blurRadius: 33.r,
      color: Color(0x3827ae96),
    )
  ],
);

var labelTextStyle = TextStyle(
  fontFamily: 'Helvetica',
  fontWeight: FontWeight.bold,
  fontSize: 19.sp,
  color: Colors.white,
);

var weightTextStyle = TextStyle(
  fontFamily: 'League Gothic',
  fontSize: 127.sp,
  color: Colors.white,
);

var unitTextStyle = TextStyle(
  fontFamily: 'League Gothic',
  fontSize: 38.sp,
  color: Color(0x80ffffff),
);

var labelTextFieldStyle = InputDecoration(
    prefixIcon: Padding(
      padding: EdgeInsets.all(12.0.r),
      child: FaIcon(
        FontAwesomeIcons.tag,
        color: Color(0x80ffffff),
        size: 19.sp,
      ),
    ),
    prefixIconColor: Colors.white,
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.r),
        borderSide: const BorderSide(color: Colors.white)),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.r),
        borderSide: const BorderSide(color: const Color(0x80ffffff))),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.r),
        borderSide: const BorderSide(color: Color(0x80ffffff))),
    hintStyle: const TextStyle(
      color: Color(0x80ffffff),
      fontFamily: 'Helvetica',
    ),
    hintText: "Label",
    fillColor: const Color(0xff53a99a),
    floatingLabelAlignment: FloatingLabelAlignment.center);
