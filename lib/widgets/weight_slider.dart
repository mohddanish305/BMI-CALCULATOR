import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/style.dart';

class WeightSlider extends StatelessWidget {
  final double weight;
  final ValueChanged<double> onChanged;
  final bool isDark;

  const WeightSlider({
    super.key,
    required this.weight,
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
          Text("Weight: ${weight.toInt()} kg", style: AppText.heading),
          Slider(
            min: 30,
            max: 150,
            value: weight,
            activeColor: AppColors.primary,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
