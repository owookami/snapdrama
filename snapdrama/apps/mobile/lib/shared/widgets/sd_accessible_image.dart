import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SdAccessibleImage extends StatelessWidget {
  final String imageUrl;
  final String semanticLabel;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Widget? placeholderWidget;
  final Widget? errorWidget;

  const SdAccessibleImage({
    Key? key,
    required this.imageUrl,
    required this.semanticLabel,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.placeholderWidget,
    this.errorWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Semantics(
      image: true,
      label: semanticLabel,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: fit,
        placeholder: (context, url) =>
            placeholderWidget ??
            Container(
              width: width,
              height: height,
              color: theme.colorScheme.surfaceVariant,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
        errorWidget: (context, url, error) =>
            errorWidget ??
            Container(
              width: width,
              height: height,
              color: theme.colorScheme.surfaceVariant,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.broken_image,
                    color: theme.colorScheme.onSurfaceVariant,
                    size: 32,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '이미지를 불러올 수 없습니다',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
