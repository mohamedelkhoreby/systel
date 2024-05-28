import 'package:flutter/material.dart';
import 'package:systel/core/resources/font_manager.dart';

TextStyle _getTextStyle(
    double fontSize, String fontFamily, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      color: color,
      fontWeight: fontWeight);
}

TextStyle lightTajawalStyle(
    {required double fontSize, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.tajawal, FontWeightManager.light, color);
}
TextStyle regularTajawalStyle(
    {required double fontSize, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.tajawal, FontWeightManager.regular, color);
}

TextStyle blodTajawalStyle({required double fontSize, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.tajawal, FontWeightManager.bold, color);
}
TextStyle semiBlodTajawal({required double fontSize, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.tajawal, FontWeightManager.semiBold, color);
}
