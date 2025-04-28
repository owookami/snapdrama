import 'package:flutter/material.dart';
import 'package:mobile/core/utils/accessibility_utils.dart';

class SdToggleButton extends StatelessWidget {
  final bool isToggled;
  final ValueChanged<bool> onToggled;
  final String label;
  final IconData? icon;
  final bool isEnabled;

  const SdToggleButton({
    Key? key,
    required this.isToggled,
    required this.onToggled,
    required this.label,
    this.icon,
    this.isEnabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // 색상 설정
    final Color backgroundColor =
        isToggled ? theme.colorScheme.primary : theme.colorScheme.surface;

    final Color foregroundColor =
        isToggled ? Colors.white : theme.colorScheme.onSurface;

    // 비활성화 시 색상 조정
    final Color actualBackgroundColor =
        isEnabled ? backgroundColor : theme.colorScheme.surfaceVariant;

    final Color actualForegroundColor =
        isEnabled ? foregroundColor : theme.colorScheme.onSurfaceVariant;

    // 접근성 레이블 생성
    final String accessibilityLabel =
        AccessibilityUtils.generateAccessibilityLabel(
      element: label,
      state: isToggled ? '활성화됨' : '비활성화됨',
      action: '토글하려면 탭하세요',
    );

    return AccessibilityUtils.wrapForAccessibility(
      label: accessibilityLabel,
      isButton: true,
      isSelected: isToggled,
      isEnabled: isEnabled,
      onTap: () => onToggled(!isToggled),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: actualBackgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isToggled ? Colors.transparent : theme.colorScheme.outline,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                size: 18,
                color: actualForegroundColor,
              ),
              const SizedBox(width: 8),
            ],
            Text(
              label,
              style: theme.textTheme.labelLarge?.copyWith(
                color: actualForegroundColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
