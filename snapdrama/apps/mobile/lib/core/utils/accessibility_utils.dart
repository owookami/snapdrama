import 'package:flutter/material.dart';

class AccessibilityUtils {
  /// 접근성 레이블 생성 도우미
  static String generateAccessibilityLabel({
    required String element,
    String? action,
    String? state,
  }) {
    String label = element;

    if (state != null) {
      label += ', $state';
    }

    if (action != null) {
      label += ', $action';
    }

    return label;
  }

  /// 컬러 대비 검사
  static bool hasAdequateContrast(Color foreground, Color background) {
    // WCAG 2.1 AA 기준 대비율 계산
    double luminance1 = foreground.computeLuminance();
    double luminance2 = background.computeLuminance();

    double brightest = luminance1 > luminance2 ? luminance1 : luminance2;
    double darkest = luminance1 < luminance2 ? luminance1 : luminance2;

    return (brightest + 0.05) / (darkest + 0.05) >= 4.5;
  }

  /// 접근성 위젯 래퍼
  static Widget wrapForAccessibility({
    required Widget child,
    required String label,
    String? hint,
    bool isButton = false,
    bool isSelected = false,
    bool isEnabled = true,
    VoidCallback? onTap,
  }) {
    return Semantics(
      label: label,
      hint: hint,
      button: isButton,
      enabled: isEnabled,
      selected: isSelected,
      child: ExcludeSemantics(
        child: GestureDetector(
          onTap: isEnabled ? onTap : null,
          child: child,
        ),
      ),
    );
  }
}
