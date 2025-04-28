import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 테마 모드 프로바이더
final themeModeProvider = StateNotifierProvider<ThemeModeNotifier, ThemeMode>(
  (ref) => ThemeModeNotifier(),
);

class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  // 기본값은 시스템 설정
  ThemeModeNotifier() : super(ThemeMode.system) {
    _init();
  }

  // SharedPreferences 키
  static const _themePrefsKey = 'theme_mode';

  // 초기화
  Future<void> _init() async {
    final prefs = await SharedPreferences.getInstance();
    final themeString = prefs.getString(_themePrefsKey);

    if (themeString != null) {
      final themeMode = _stringToThemeMode(themeString);
      state = themeMode;
    }
  }

  // 테마 변경
  Future<void> changeTheme(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themePrefsKey, _themeModeToString(mode));
    state = mode;
  }

  // 문자열을 ThemeMode로 변환
  ThemeMode _stringToThemeMode(String themeString) {
    switch (themeString) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  // ThemeMode를 문자열로 변환
  String _themeModeToString(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'light';
      case ThemeMode.dark:
        return 'dark';
      case ThemeMode.system:
        return 'system';
    }
  }
}
