import 'package:flutter/material.dart';

class GenderToggle extends StatelessWidget {
  final String gender;
  final ValueChanged<String> onGenderChanged;

  const GenderToggle({
    super.key,
    required this.gender,
    required this.onGenderChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildGenderButton("Laki-laki", Icons.male, gender == "Laki-laki"),
        const SizedBox(width: 20),
        _buildGenderButton("Perempuan", Icons.female, gender == "Perempuan"),
      ],
    );
  }

  Widget _buildGenderButton(String label, IconData icon, bool isSelected) {
    return GestureDetector(
      onTap: () {
        onGenderChanged(label);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(28),
        ),
        child: Row(
          children: [
            Icon(icon, color: isSelected ? Colors.indigoAccent : Colors.white),
            const SizedBox(width: 10),
            Text(
              label,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.indigoAccent : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
