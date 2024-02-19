// ignore_for_file: non_constant_identifier_names

import 'package:resumemaker/utils/app_prefrence/prefrencekey.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPrefrence {
  static final AppPrefrence _appPreference = AppPrefrence._internal();
  factory AppPrefrence() {
    return _appPreference;
  }

  AppPrefrence._internal();
  SharedPreferences? preferences;
  Future<void> initialiAppPreferenc() async {
    preferences = await SharedPreferences.getInstance();
  }

  Future ClearSharedPrefernces() async {
    await preferences?.clear();
  }

  bool isLogin() {
    return (preferences?.getBool(PreferencesKey.isLogin)) ?? false;
  }

  Future setIsLogin(bool isLogin) async {
    return (preferences?.setBool(PreferencesKey.isLogin, isLogin));
  }

  String getemail() {
    return (preferences?.getString(PreferencesKey.isEmail)) ?? "";
  }

  Future setISemail(String isEmail) async {
    return (preferences?.setString(PreferencesKey.isEmail, isEmail));
  }

  String getpass() {
    return (preferences?.getString(PreferencesKey.ispass)) ?? "";
  }

  Future setISpass(String ispass) async {
    return (preferences?.setString(PreferencesKey.ispass, ispass));
  }
}
