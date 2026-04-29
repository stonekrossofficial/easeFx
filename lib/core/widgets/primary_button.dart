import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isSecondary;

  const PrimaryButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.isSecondary = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          color: isSecondary ? Colors.transparent : Colors.black,
          borderRadius: BorderRadius.circular(100),
          border: isSecondary ? Border.all(color: Colors.black, width: 2) : null,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isSecondary ? Colors.black : const Color(0xFFFFECA3),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
