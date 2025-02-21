import 'package:flutter/material.dart';

class ResultCard extends StatelessWidget {
  final double bmi;
  final String category;
  final String gender;
  final String age;

  const ResultCard({
    super.key,
    required this.bmi,
    required this.category,
    required this.gender,
    required this.age,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.9),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "BMI Kamu: ${bmi.toStringAsFixed(2)}",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Kategori: $category",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: bmi < 18.5
                    ? Colors.lightBlue
                    : (bmi < 24.9
                    ? Colors.green
                    : (bmi < 29.9 ? Colors.orange : Colors.red)),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Gender: $gender",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Usia: $age tahun",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
