import 'package:flutter/material.dart';

enum SdButtonVariant {
  primary,
  secondary,
  text,
}

class SdButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final SdButtonVariant variant;
  final IconData? icon;
  final bool isLoading;
  final bool isFullWidth;

  const SdButton({
    Key? key,
    required this.label,
    this.onPressed,
    this.variant = SdButtonVariant.primary,
    this.icon,
    this.isLoading = false,
    this.isFullWidth = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // 버튼 스타일 결정
    ButtonStyle style;

    switch (variant) {
      case SdButtonVariant.primary:
        style = ElevatedButton.styleFrom(
          backgroundColor: theme.colorScheme.primary,
          foregroundColor: Colors.white,
        );
        break;
      case SdButtonVariant.secondary:
        style = ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: theme.colorScheme.primary,
          elevation: 0,
          side: BorderSide(
            color: theme.colorScheme.primary,
            width: 1,
          ),
        );
        break;
      case SdButtonVariant.text:
        style = TextButton.styleFrom(
          foregroundColor: theme.colorScheme.primary,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        );
        break;
    }

    // 버튼 내용물
    Widget content = Text(
      label,
      style: theme.textTheme.labelLarge?.copyWith(
        color: variant == SdButtonVariant.primary
            ? Colors.white
            : theme.colorScheme.primary,
      ),
    );

    // 아이콘이 있으면 아이콘 추가
    if (icon != null) {
      content = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18),
          const SizedBox(width: 8),
          content,
        ],
      );
    }

    // 로딩 상태이면 프로그레스 인디케이터 표시
    if (isLoading) {
      content = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 18,
            height: 18,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: variant == SdButtonVariant.primary
                  ? Colors.white
                  : theme.colorScheme.primary,
            ),
          ),
          const SizedBox(width: 8),
          content,
        ],
      );
    }

    // 변형에 따라 적절한 버튼 위젯 반환
    Widget button;
    switch (variant) {
      case SdButtonVariant.primary:
      case SdButtonVariant.secondary:
        button = ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: style,
          child: content,
        );
        break;
      case SdButtonVariant.text:
        button = TextButton(
          onPressed: isLoading ? null : onPressed,
          style: style,
          child: content,
        );
        break;
    }

    // 전체 너비 옵션
    if (isFullWidth) {
      return SizedBox(
        width: double.infinity,
        child: button,
      );
    }

    return button;
  }
}
