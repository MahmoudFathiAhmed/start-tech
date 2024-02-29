
import 'package:flutter/material.dart';
import 'package:mahmoud_fathi_start_tech_task/core/utils/font_manager.dart';

TextStyle _getTextStyle(FontWeight fontWeight, double fontSize, Color color,{String fontFamily = FontConstants.alexFontFamily}) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    color: color,
  );
}

/// extra light Style
TextStyle getExtraLightStyle(
    {double fontSize = FontSize.s12, required Color color,String fontFamily=FontConstants.alexFontFamily}) {
  return _getTextStyle(FontWeightManager.extraLight, fontSize, color,fontFamily: fontFamily);
}
/// Light Style
TextStyle getLightStyle(
    {double fontSize = FontSize.s12, required Color color,String fontFamily=FontConstants.alexFontFamily}) {
  return _getTextStyle(FontWeightManager.light, fontSize, color,fontFamily: fontFamily);
}
/// Regular Style
TextStyle getRegularStyle(
    {double fontSize = FontSize.s12, required Color color,String fontFamily=FontConstants.alexFontFamily}) {
  return _getTextStyle(FontWeightManager.regular, fontSize, color,fontFamily: fontFamily);
}

/// medium Style
TextStyle getMediumStyle(
    {double fontSize = FontSize.s12, required Color color,String fontFamily=FontConstants.alexFontFamily}) {
  return _getTextStyle(FontWeightManager.medium, fontSize, color,fontFamily: fontFamily);
}

/// SimiBold Style
TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s12, required Color color,String fontFamily=FontConstants.alexFontFamily}) {
  return _getTextStyle(FontWeightManager.semiBold, fontSize, color,fontFamily: fontFamily);
}

/// Bold Style
TextStyle getBoldStyle({double fontSize = FontSize.s12, required Color color,String fontFamily=FontConstants.alexFontFamily}) {
  return _getTextStyle(FontWeightManager.bold, fontSize, color,fontFamily: fontFamily);
}

/// ExtraBold Style
TextStyle getExtraBoldStyle({double fontSize = FontSize.s12, required Color color,String fontFamily=FontConstants.alexFontFamily}) {
  return _getTextStyle(FontWeightManager.extraBold, fontSize, color,fontFamily: fontFamily);
}
/// Black Style
TextStyle getBlackStyle({double fontSize = FontSize.s12, required Color color,String fontFamily=FontConstants.alexFontFamily}) {
  return _getTextStyle(FontWeightManager.black, fontSize, color,fontFamily: fontFamily);
}