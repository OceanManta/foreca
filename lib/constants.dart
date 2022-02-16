import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const kTextColor = Color(0xFF535353);
const kTextLightColor = Color(0xFFACACAC);
const mediColor = Color.fromARGB(255, 4, 37, 65);
const kDefaultPaddin = 20.0;

const kSpacingUnit = 10;

const kDarkPrimaryColor = Color(0xFF616161);
const kDarkSecondaryColor = Color(0xFFFFFFFF);
const kLightPrimaryColor = Color.fromARGB(255, 4, 37, 65);
const kLightSecondaryColor = Color(0xFFB2EBF2);
const kAccentColor = Color(0xFF00838F);
const kLightBoxShadowColor = Color(0xFF1A237E);
const kDarkBoxShadowColor = Color(0xFFFFFFFF);
const klightButtonColor = Color(0xFFFF1744);
const kDarkButtonColor = Color(0xFF37474F);

final kTitleTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.7),
  fontWeight: FontWeight.w600,
);

final kCaptionTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.3),
  fontWeight: FontWeight.w100,
);

final kButtonTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.5),
  fontWeight: FontWeight.w400,
  color: kDarkPrimaryColor,
);

BoxDecoration defaultBoxDecoration(BuildContext context) {
  return BoxDecoration(
      borderRadius: BorderRadius.circular(25),
      color: Theme.of(context).primaryColor,
      boxShadow: [
        BoxShadow(
            color: kLightBoxShadowColor.withOpacity(0.2),
            blurRadius: 20,
            spreadRadius: 5,
            offset: Offset(10, -10)),
      ]);
}

final kDarkTheme = ThemeData(
  fontFamily: 'Circular',
  primaryColor: kDarkPrimaryColor,
  canvasColor: kDarkPrimaryColor,
  backgroundColor: kDarkSecondaryColor,
  buttonTheme: ButtonThemeData(
    buttonColor: kDarkButtonColor,
    textTheme: ButtonTextTheme.normal,
  ),
  dialogTheme: DialogTheme(
      backgroundColor: kDarkPrimaryColor,
      titleTextStyle: TextStyle(color: kLightSecondaryColor),
      contentTextStyle: TextStyle(color: kLightSecondaryColor)),
  appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: kLightSecondaryColor),
      titleTextStyle: TextStyle(color: kLightSecondaryColor),
      actionsIconTheme: IconThemeData(color: kLightSecondaryColor),
      backgroundColor: kDarkPrimaryColor),
  iconTheme: ThemeData.dark().iconTheme.copyWith(
        color: kLightSecondaryColor,
      ),
  textTheme: ThemeData.dark().textTheme.apply(
        fontFamily: 'Circular',
        bodyColor: kLightSecondaryColor,
        displayColor: kLightSecondaryColor,
      ),
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: kAccentColor),
);

final kLightTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'Circular',
  primaryColor: kLightPrimaryColor,
  canvasColor: kLightPrimaryColor,
  backgroundColor: kLightSecondaryColor,
  indicatorColor: klightButtonColor,
  buttonTheme: ButtonThemeData(
    buttonColor: klightButtonColor,
    textTheme: ButtonTextTheme.normal,
  ),
  appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: kDarkSecondaryColor),
      titleTextStyle: TextStyle(color: kDarkSecondaryColor),
      actionsIconTheme: IconThemeData(color: kDarkSecondaryColor),
      backgroundColor: kLightPrimaryColor),
  iconTheme: ThemeData.light().iconTheme.copyWith(
        color: kDarkSecondaryColor,
      ),
  textTheme: ThemeData.light().textTheme.apply(
        fontFamily: 'Circular',
        bodyColor: kDarkSecondaryColor,
        displayColor: kDarkSecondaryColor,
      ),
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: kAccentColor),
);
