import 'dart:math';
import 'package:flutter/material.dart';
import '../widgets/gender_toggle.dart';
import '../widgets/input_fields.dart';
import '../widgets/result_card.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  String? heightError;
  String? weightError;
  String? ageError;

  double? bmi;
  String category = "";
  String gender = "";

  void calculateBMI() {
    setState(() {
      heightError = _validateInput(heightController.text);
      weightError = _validateInput(weightController.text);
      ageError = _validateInput(ageController.text);
    });

    if (heightError != null || weightError != null || ageError != null) return;

    double height = double.parse(heightController.text) / 100;
    double weight = double.parse(weightController.text);
    bmi = weight / pow(height, 2);
    if (bmi! < 18.5) {
      category = "Kurus";
    } else if (bmi! >= 18.5 && bmi! < 24.9) {
      category = "Ideal";
    } else if (bmi! >= 25 && bmi! < 29.9) {
      category = "Gemuk";
    } else {
      category = "Obesitas";
    }
    setState(() {});
  }

  String? _validateInput(String value) {
    if (value.isEmpty) {
      return 'Kolom harus diisi';
    }
    if (double.tryParse(value) == null) {
      return 'Input harus berupa angka';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text(
          'BMI Calculator',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 5,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2134A8), Color(0xFF4D0AE1)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Masukkan Data',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            GenderToggle(
              gender: gender,
              onGenderChanged: (selectedGender) {
                setState(() {
                  gender = selectedGender;
                });
              },
            ),
            const SizedBox(height: 20),
            InputField(
              controller: heightController,
              label: "Tinggi (cm)",
              icon: Icons.height,
              errorText: heightError,
            ),
            const SizedBox(height: 20),
            InputField(
              controller: weightController,
              label: "Berat (kg)",
              icon: Icons.monitor_weight,
              errorText: weightError,
            ),
            const SizedBox(height: 20),
            InputField(
              controller: ageController,
              label: "Usia (tahun)",
              icon: Icons.cake,
              errorText: ageError,
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: calculateBMI,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.indigo,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 50,
              ),
              child: const Text(
                "Hitung BMI",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (bmi != null)
              ResultCard(
                bmi: bmi!,
                category: category,
                gender: gender,
                age: ageController.text,
              ),
          ],
        ),
      ),
    );
  }
}
