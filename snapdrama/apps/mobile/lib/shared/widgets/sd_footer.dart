import 'package:flutter/material.dart';

class SdFooter extends StatelessWidget {
  final String? copyright;
  final List<Widget>? actions;
  final bool withDivider;

  const SdFooter({
    Key? key,
    this.copyright,
    this.actions,
    this.withDivider = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final year = DateTime.now().year;
    final copyrightText = copyright ?? '© $year SnapDrama. 모든 권리 보유.';

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (withDivider)
          Divider(color: theme.colorScheme.outline.withOpacity(0.5)),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 24,
          ),
          child: Column(
            children: [
              if (actions != null && actions!.isNotEmpty) ...[
                Wrap(
                  spacing: 16,
                  runSpacing: 8,
                  alignment: WrapAlignment.center,
                  children: actions!,
                ),
                const SizedBox(height: 16),
              ],
              Text(
                copyrightText,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(0.7),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
