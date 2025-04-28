import 'package:flutter/material.dart';

/// SnapDrama 앱의 테마를 정의합니다.
class AppTheme {
  // 라이트 테마
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF77D8D8),
      brightness: Brightness.light,
      primary: const Color(0xFF77D8D8),
      primaryContainer: const Color(0xFF9DEDEA),
      secondary: const Color(0xFFFFD166),
      secondaryContainer: const Color(0xFFFFB677),
      tertiary: const Color(0xFFFF6363),
      error: const Color(0xFFFA5252),
      background: const Color(0xFFF8F9FA),
      surface: Colors.white,
    ),
    // 커스텀 컬러
    extensions: [
      CustomColors.light,
    ],
    // 텍스트 테마
    textTheme: _textTheme,
    // 앱바 테마
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.white,
      foregroundColor: const Color(0xFF212529),
      titleTextStyle: _textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.bold,
      ),
    ),
    // 버튼 테마
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    // 카드 테마
    cardTheme: CardTheme(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias,
    ),
    // 입력 필드 테마
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFFF1F3F5),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    ),
  );

  // 다크 테마
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF77D8D8),
      brightness: Brightness.dark,
      primary: const Color(0xFFAC8CD2),
      primaryContainer: const Color(0xFF61398F),
      secondary: const Color(0xFFFFD166),
      secondaryContainer: const Color(0xFFFFB677),
      tertiary: const Color(0xFFFF6363),
      error: const Color(0xFFFA5252),
      background: const Color(0xFF121212),
      surface: const Color(0xFF2A2A2A),
    ),
    // 커스텀 컬러
    extensions: [
      CustomColors.dark,
    ],
    // 텍스트 테마
    textTheme: _textTheme.apply(
      bodyColor: const Color(0xFFE6E6E6),
      displayColor: const Color(0xFFE6E6E6),
    ),
    // 앱바 테마
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: const Color(0xFF121212),
      foregroundColor: Colors.white,
      titleTextStyle: _textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    // 버튼 테마
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    // 카드 테마
    cardTheme: CardTheme(
      elevation: 2,
      color: const Color(0xFF2A2A2A),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias,
    ),
    // 입력 필드 테마
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFF2A2A2A),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    ),
  );

  // 공통 텍스트 테마
  static const TextTheme _textTheme = TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'Pretendard',
      fontSize: 32,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: TextStyle(
      fontFamily: 'Pretendard',
      fontSize: 28,
      fontWeight: FontWeight.bold,
    ),
    displaySmall: TextStyle(
      fontFamily: 'Pretendard',
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: TextStyle(
      fontFamily: 'Pretendard',
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    titleLarge: TextStyle(
      fontFamily: 'Pretendard',
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: TextStyle(
      fontFamily: 'Pretendard',
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Pretendard',
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Pretendard',
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Pretendard',
      fontSize: 12,
      fontWeight: FontWeight.normal,
    ),
  );
}

/// 커스텀 컬러 확장
class CustomColors extends ThemeExtension<CustomColors> {
  final Color primary100;
  final Color primary200;
  final Color primary300;
  final Color secondary100;
  final Color secondary200;
  final Color neutral100;
  final Color neutral200;
  final Color neutral300;
  final Color neutral400;
  final Color textPrimary;
  final Color textSecondary;
  final Color textInverted;

  CustomColors({
    required this.primary100,
    required this.primary200,
    required this.primary300,
    required this.secondary100,
    required this.secondary200,
    required this.neutral100,
    required this.neutral200,
    required this.neutral300,
    required this.neutral400,
    required this.textPrimary,
    required this.textSecondary,
    required this.textInverted,
  });

  @override
  ThemeExtension<CustomColors> copyWith({
    Color? primary100,
    Color? primary200,
    Color? primary300,
    Color? secondary100,
    Color? secondary200,
    Color? neutral100,
    Color? neutral200,
    Color? neutral300,
    Color? neutral400,
    Color? textPrimary,
    Color? textSecondary,
    Color? textInverted,
  }) {
    return CustomColors(
      primary100: primary100 ?? this.primary100,
      primary200: primary200 ?? this.primary200,
      primary300: primary300 ?? this.primary300,
      secondary100: secondary100 ?? this.secondary100,
      secondary200: secondary200 ?? this.secondary200,
      neutral100: neutral100 ?? this.neutral100,
      neutral200: neutral200 ?? this.neutral200,
      neutral300: neutral300 ?? this.neutral300,
      neutral400: neutral400 ?? this.neutral400,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textInverted: textInverted ?? this.textInverted,
    );
  }

  @override
  ThemeExtension<CustomColors> lerp(
    ThemeExtension<CustomColors>? other,
    double t,
  ) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      primary100: Color.lerp(primary100, other.primary100, t)!,
      primary200: Color.lerp(primary200, other.primary200, t)!,
      primary300: Color.lerp(primary300, other.primary300, t)!,
      secondary100: Color.lerp(secondary100, other.secondary100, t)!,
      secondary200: Color.lerp(secondary200, other.secondary200, t)!,
      neutral100: Color.lerp(neutral100, other.neutral100, t)!,
      neutral200: Color.lerp(neutral200, other.neutral200, t)!,
      neutral300: Color.lerp(neutral300, other.neutral300, t)!,
      neutral400: Color.lerp(neutral400, other.neutral400, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textInverted: Color.lerp(textInverted, other.textInverted, t)!,
    );
  }

  // 라이트 테마 컬러
  static CustomColors get light => CustomColors(
        primary100: const Color(0xFF77D8D8),
        primary200: const Color(0xFF5CC1C1),
        primary300: const Color(0xFF9DEDEA),
        secondary100: const Color(0xFFFFD166),
        secondary200: const Color(0xFFFFB677),
        neutral100: const Color(0xFFFFFFFF),
        neutral200: const Color(0xFFF8F9FA),
        neutral300: const Color(0xFFF1F3F5),
        neutral400: const Color(0xFF9A9A9A),
        textPrimary: const Color(0xFF212529),
        textSecondary: const Color(0xFF495057),
        textInverted: const Color(0xFFFFFFFF),
      );

  // 다크 테마 컬러
  static CustomColors get dark => CustomColors(
        primary100: const Color(0xFFAC8CD2),
        primary200: const Color(0xFF8B5FBF),
        primary300: const Color(0xFF61398F),
        secondary100: const Color(0xFFFFD166),
        secondary200: const Color(0xFFFFB677),
        neutral100: const Color(0xFF121212),
        neutral200: const Color(0xFF2A2A2A),
        neutral300: const Color(0xFF3A3A3A),
        neutral400: const Color(0xFF666666),
        textPrimary: const Color(0xFFE6E6E6),
        textSecondary: const Color(0xFFB0B0B0),
        textInverted: const Color(0xFF121212),
      );
}

/// 테마 확장 사용을 위한 메서드
extension CustomColorsExtension on BuildContext {
  CustomColors get customColors => Theme.of(this).extension<CustomColors>()!;
}
