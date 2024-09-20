import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A reusable widget to display SVG images from assets or network.
class SvgImage extends StatelessWidget {
  final String source;
  final double width;
  final double height;
  final Color? color;
  final bool isNetwork;

  /// Creates an SVG image widget.
  ///
  /// [source] is the path to the SVG file (either asset path or URL).
  /// [width] and [height] define the size of the SVG image.
  /// [color] is used to colorize the SVG image.
  /// [isNetwork] determines if the source is a network URL or asset path.
  const SvgImage({
    Key? key,
    required this.source,
    this.width = 24.0,
    this.height = 24.0,
    this.color,
    this.isNetwork = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isNetwork
        ? SvgPicture.network(
      source,
      width: width,
      height: height,
      color: color,
      placeholderBuilder: (context) => const CircularProgressIndicator(),
    )
        : SvgPicture.asset(
      source,
      width: width,
      height: height,
      color: color,
    );
  }
}
