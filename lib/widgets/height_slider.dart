import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/style.dart';

class HeightSlider extends StatelessWidget {
  final double height;
  final ValueChanged<double> onChanged;
  final bool isDark;

  const HeightSlider({
    super.key,
    required this.height,
    required this.onChanged,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final cardColor = isDark ? AppColors.darkCard : AppColors.lightCard;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: cardColor, // ✅ FIX
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text("Height: ${height.toInt()} cm", style: AppText.heading),
          Slider(
            min: 100,
            max: 220,
            value: height,
            activeColor: AppColors.primary,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
