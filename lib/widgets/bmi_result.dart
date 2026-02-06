import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/style.dart';
import '../utils/bmi_utils.dart';

class BmiResult extends StatelessWidget {
  final double bmi;

  const BmiResult({super.key, required this.bmi});

  Color getColor() {
    if (bmi < 18.5) return AppColors.underweight;
    if (bmi < 24.9) return AppColors.normal;
    if (bmi < 29.9) return AppColors.overweight;
    return AppColors.obese;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [getColor().withOpacity(0.7), getColor()],
        ),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        children: [
          Text("BMI: ${bmi.toStringAsFixed(1)}", style: AppText.bmi),
          const SizedBox(height: 6),
          Text(bmiCategory(bmi), style: AppText.value),
        ],
      ),
    );
  }
}
