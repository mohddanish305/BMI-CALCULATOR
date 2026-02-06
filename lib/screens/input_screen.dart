import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../utils/bmi_utils.dart';
import 'result_screen.dart';

class InputScreen extends StatefulWidget {
  final bool isDark;
  final VoidCallback onToggleTheme;

  const InputScreen({
    super.key,
    required this.isDark,
    required this.onToggleTheme,
  });

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  double height = 175;
  double weight = 78;
  bool isMale = true;

  void resetAll() {
    setState(() {
      height = 175;
      weight = 78;
      isMale = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bg = widget.isDark ? AppColors.darkBg : AppColors.lightBg;
    final card = widget.isDark ? AppColors.darkCard : AppColors.lightCard;
    final text = widget.isDark ? AppColors.darkText : AppColors.lightText;

    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        title: const Text("BMI CALCULATOR"),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        elevation: 0,
        actions: [
          // 🌙 Dark Mode Toggle
          IconButton(
            onPressed: widget.onToggleTheme,
            icon: Icon(widget.isDark ? Icons.light_mode : Icons.dark_mode),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // HEIGHT
            _buildCard(
              cardColor: card,
              child: Column(
                children: [
                  Text("Height (CM)", style: TextStyle(color: text)),
                  const SizedBox(height: 8),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    child: Text(
                      height.toInt().toString(),
                      key: ValueKey(height.toInt()),
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  Slider(
                    min: 50,
                    max: 300,
                    value: height,
                    activeColor: AppColors.primary,
                    inactiveColor: widget.isDark ? Colors.white24 : Colors.black12,
                    onChanged: (v) => setState(() => height = v),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // WEIGHT
            _buildCard(
              cardColor: card,
              child: Column(
                children: [
                  Text("Weight (KG)", style: TextStyle(color: text)),
                  const SizedBox(height: 8),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    child: Text(
                      weight.toInt().toString(),
                      key: ValueKey(weight.toInt()),
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  Slider(
                    min: 30,
                    max: 150,
                    value: weight,
                    activeColor: AppColors.primary,
                    inactiveColor: widget.isDark ? Colors.white24 : Colors.black12,
                    onChanged: (v) => setState(() => weight = v),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // GENDER
            _buildCard(
              cardColor: card,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      isMale ? "Male" : "Female",
                      style: TextStyle(fontSize: 16, color: text),
                    ),

                    // Switch ON = Female, OFF = Male
                    Switch(
                      value: !isMale,
                      activeColor: AppColors.primary,
                      onChanged: (v) {
                        setState(() {
                          isMale = !v;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),

            const Spacer(),

            // BUTTON
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
                child: const Text(
                  "Calculate BMI",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                onPressed: () {
                  double bmi = calculateBMI(height, weight);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ResultScreen(
                        bmi: bmi,
                        isMale: isMale,
                        isDark: widget.isDark,
                        onReset: () {
                          Navigator.pop(context);
                          resetAll();
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({required Widget child, required Color cardColor}) {
    return Card(
      color: cardColor,
      elevation: 7,
      shadowColor: Colors.black26,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: child,
      ),
    );
  }
}
