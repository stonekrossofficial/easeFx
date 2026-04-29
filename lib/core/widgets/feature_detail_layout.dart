import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'upload_card.dart';
import 'primary_button.dart';

class FeatureDetailLayout extends StatefulWidget {
  final String title;
  final String description;
  final String heroImageUrl;
  final Widget? chipsSelector;
  final Future<void> Function(File image) onGenerate;

  const FeatureDetailLayout({
    Key? key,
    required this.title,
    required this.description,
    required this.heroImageUrl,
    this.chipsSelector,
    required this.onGenerate,
  }) : super(key: key);

  @override
  State<FeatureDetailLayout> createState() => _FeatureDetailLayoutState();
}

class _FeatureDetailLayoutState extends State<FeatureDetailLayout> {
  File? _pickedImage;
  bool _isGenerating = false;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          _pickedImage = File(image.path);
        });
      }
    } catch (e) {
      debugPrint('Error picking image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: const Color(0xFFFFECA3),
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => context.pop(),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            image: DecorationImage(
                              image: NetworkImage(widget.heroImageUrl),
                              fit: BoxFit.cover,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          widget.title,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          widget.description,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 24),
                        UploadCard(
                          selectedImage: _pickedImage,
                          onTap: _pickImage,
                        ),
                        const SizedBox(height: 24),
                        if (widget.chipsSelector != null) ...[
                          widget.chipsSelector!,
                          const SizedBox(height: 24),
                        ],
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: PrimaryButton(
                    text: _isGenerating ? "Generating..." : "Generate",
                    onTap: _isGenerating
                        ? () {}
                        : () async {
                            if (_pickedImage == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please upload an image first!'),
                                  behavior: SnackBarBehavior.floating,
                                ),
                              );
                              return;
                            }
                            setState(() => _isGenerating = true);
                            try {
                              await widget.onGenerate(_pickedImage!);
                            } catch (e) {
                              if (mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Generation failed: $e'),
                                    behavior: SnackBarBehavior.floating,
                                  ),
                                );
                              }
                            } finally {
                              if (mounted) setState(() => _isGenerating = false);
                            }
                          },
                  ),
                ),
              ],
            ),
          ),
        ),
        if (_isGenerating)
          Container(
            color: Colors.black.withOpacity(0.4),
            child: const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          ),
      ],
    );
  }
}
