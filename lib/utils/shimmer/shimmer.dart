import 'package:flutter/material.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/helpers/helper_functions.dart';
import 'package:shimmer/shimmer.dart';

class SSShimmerEffect extends StatelessWidget {
  const SSShimmerEffect(
      {super.key,
      required this.width,
      required this.height,
      this.radius = 5,
      this.color});

  final double width, height, radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    return Shimmer.fromColors(
      baseColor: isDark ? Colors.grey[850]! : Colors.grey[300]!,
      highlightColor: isDark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ?? (isDark ? SSAppColors.darkerGrey : SSAppColors.white),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
