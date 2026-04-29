import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class UploadCard extends StatelessWidget {
  final VoidCallback onTap;
  final File? selectedImage;

  const UploadCard({
    Key? key,
    required this.onTap,
    this.selectedImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: selectedImage != null
          ? Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                image: DecorationImage(
                  image: FileImage(selectedImage!),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: 12,
                    top: 12,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Colors.black54,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.edit, color: Colors.white, size: 20),
                    ),
                  ),
                ],
              ),
            )
          : DottedBorder(
              options: const RoundedRectDottedBorderOptions(
                color: Colors.black38,
                strokeWidth: 2,
                dashPattern: [8, 4],
                radius: Radius.circular(24),
              ),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 40),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    const Icon(
                      Icons.add_photo_alternate_outlined,
                      size: 48,
                      color: Colors.black54,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Tap to upload image",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "JPG, PNG up to 10MB",
                      style: TextStyle(color: Colors.black54, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
