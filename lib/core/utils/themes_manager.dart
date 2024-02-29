import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mahmoud_fathi_start_tech_task/core/utils/colors_manager.dart';
import 'package:mahmoud_fathi_start_tech_task/core/utils/font_manager.dart';
import 'package:mahmoud_fathi_start_tech_task/core/utils/styles_manager.dart';
import 'package:mahmoud_fathi_start_tech_task/core/utils/values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    //main colors
    primaryColor: ColorsManager.primaryColor,
    scaffoldBackgroundColor: ColorsManager.white,
    useMaterial3: true,
    //app bar theme
    appBarTheme: AppBarTheme(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: ColorsManager.primaryColor,
            statusBarIconBrightness: Brightness.light),
        color: ColorsManager.primaryColor,
        // shadowColor: ColorsManager.lightPrimary,
        elevation: AppSize.s0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: ColorsManager.white),
        titleTextStyle:
            getBoldStyle(color: ColorsManager.white, fontSize: FontSize.s18)),
    //icon theme
    iconTheme: const IconThemeData(color: ColorsManager.primaryColor),
    //button theme
    buttonTheme: const ButtonThemeData(
      disabledColor: ColorsManager.thinTextColor,
      buttonColor: ColorsManager.primaryColor,
      splashColor: ColorsManager.white,
    ),
    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(AppSize.s15),
          textStyle: getBoldStyle(color: ColorsManager.white, fontSize: AppSize.s22),
          backgroundColor: ColorsManager.primaryColor,
          foregroundColor: ColorsManager.white,
          disabledBackgroundColor: ColorsManager.thinTextColor,
          disabledForegroundColor: ColorsManager.white,
          // fixedSize: const Size(double.infinity,55 ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.s8))),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.all(AppSize.s15),
            textStyle:
                getBoldStyle(color: ColorsManager.primaryColor, fontSize: AppSize.s22),
            foregroundColor: ColorsManager.primaryColor,
            side: const BorderSide(color: ColorsManager.primaryColor),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s8),
                ))),
    //popup theme
    // text theme
    textTheme: TextTheme(
      displayLarge: getBoldStyle(
          color: ColorsManager.primaryColor, fontSize: FontSize.s28),
      labelLarge:
          getBoldStyle(color: ColorsManager.white, fontSize: FontSize.s24),
      bodyLarge:
          getBoldStyle(color: ColorsManager.formFieldColor, fontSize: FontSize.s16),
      displaySmall:
          getRegularStyle(color: ColorsManager.white, fontSize: FontSize.s24),
      titleSmall:
          getRegularStyle(color: ColorsManager.thinTextColor, fontSize: FontSize.s15),
      bodySmall:
          getBoldStyle(color: ColorsManager.black, fontSize: FontSize.s13),
    ),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
      textStyle: MaterialStateProperty.all(
          getBoldStyle(color: ColorsManager.primaryColor, fontSize: AppSize.s13)),
    )),
    // input decoration theme(text form field)
    inputDecorationTheme: InputDecorationTheme(
        hintStyle:
            getBoldStyle(color: ColorsManager.formFieldColor, fontSize: AppSize.s15),
        contentPadding: const EdgeInsets.all(AppSize.s16),
        suffixIconColor: ColorsManager.formFieldColor,
        errorStyle: getLightStyle(
          color: ColorsManager.errorColor,
          fontSize: AppSize.s12,
        ),
        disabledBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorsManager.formFieldColor, width: AppSize.s1),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),
        focusedErrorBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorsManager.formFieldColor, width: AppSize.s1),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorsManager.errorColor, width: AppSize.s1),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),
        enabledBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorsManager.formFieldColor, width: AppSize.s1),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),
        focusedBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorsManager.formFieldColor, width: AppSize.s1),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)))),
  );
}
