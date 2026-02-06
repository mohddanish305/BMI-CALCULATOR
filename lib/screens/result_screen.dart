import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../utils/bmi_utils.dart';

class ResultScreen extends StatelessWidget {
  final double bmi;
  final bool isMale;
  final bool isDark;
  final VoidCallback onReset;

  const ResultScreen({
    super.key,
    required this.bmi,
    required this.isMale,
    required this.isDark,
    required this.onReset,
  });

  List<Color> bmiGradient(double bmi) {
    if (bmi < 18.5) return [Colors.blue.shade200, Colors.blue];
    if (bmi < 25) return [Colors.green.shade200, Colors.green];
    if (bmi < 30) return [Colors.orange.shade200, Colors.orange];
    return [Colors.red.shade200, Colors.red];
  }

  @override
  Widget build(BuildContext context) {
    final bg = isDark ? AppColors.darkBg : AppColors.lightBg;
    final card = isDark ? AppColors.darkCard : AppColors.lightCard;
    final text = isDark ? AppColors.darkText : AppColors.lightText;

    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        title: const Text("BMI RESULTS"),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 20),

            // MAIN RESULT CARD
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: bmiGradient(bmi)),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: card,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("BMI Results", style: TextStyle(color: text)),
                    const SizedBox(height: 14),

                    // BMI animation
                    TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0, end: bmi),
                      duration: const Duration(milliseconds: 700),
                      builder: (context, value, child) {
                        return Text(
                          value.toStringAsFixed(2),
                          style: const TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 6),

                    Text(
                      bmiCategory(bmi),
                      style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 1,
                        color: text,
                      ),
                    ),

                    const SizedBox(height: 16),

                    // ✅ IMAGE BIGGER (space fixed)
                    Image.asset(
                      bmiImage(bmi, isMale),
                      height: 260, // ✅ bigger
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
            ),

            const Spacer(),

            // ✅ RESET BUTTON BOTTOM
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: onReset,
                child: const Text(
                  "Reset",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
