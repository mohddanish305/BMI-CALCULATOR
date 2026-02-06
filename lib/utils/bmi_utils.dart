double calculateBMI(double heightCm, double weightKg) {
  double heightMeter = heightCm / 100;
  return weightKg / (heightMeter * heightMeter);
}

String bmiCategory(double bmi) {
  if (bmi < 18.5) return "Underweight";
  if (bmi < 25) return "Normal";
  if (bmi < 30) return "Overweight";
  return "Obese";
}

String bmiImage(double bmi, bool isMale) {
  if (isMale) {
    if (bmi < 18.5) return "assets/male/male_underweight.jpeg";
    if (bmi < 25) return "assets/male/male_normal.jpeg";
    if (bmi < 30) return "assets/male/male_overweight.jpeg";
    return "assets/male/male_obese.jpeg";
  } else {
    if (bmi < 18.5) return "assets/female/female_underweight.jpeg";
    if (bmi < 25) return "assets/female/female_normal.jpeg";
    if (bmi < 30) return "assets/female/female_overweight.jpeg";
    return "assets/female/female_obese.jpeg";
  }
}
