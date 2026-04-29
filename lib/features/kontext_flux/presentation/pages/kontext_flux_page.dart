import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../data/repositories/kontext_flux_repository.dart';

class KontextFluxPage extends StatefulWidget {
  const KontextFluxPage({Key? key}) : super(key: key);

  @override
  State<KontextFluxPage> createState() => _KontextFluxPageState();
}

class _KontextFluxPageState extends State<KontextFluxPage> {
  final TextEditingController _promptController = TextEditingController();
  final KontextFluxRepository _repository = KontextFluxRepository();
  final ImagePicker _picker = ImagePicker();
  
  File? _selectedImage;
  bool _isLoading = false;

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  void _generateImage() async {
    final prompt = _promptController.text.trim();
    if (prompt.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a prompt first.')),
      );
      return;
    }
    
    if (_selectedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select an image first.')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final result = await _repository.generateImage(_selectedImage!, prompt);

    if (!mounted) return;

    setState(() {
      _isLoading = false;
    });

    result.fold(
      (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error)),
        );
      },
      (imageUrl) {
        context.push('/result', extra: {
          'originalPath': _selectedImage!.path,
          'resultUrl': imageUrl,
          'feature': 'Kontext Flux',
        });
      },
    );
  }

  @override
  void dispose() {
    _promptController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFECA3),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          "Kontext Flux",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // IMAGE PICKER
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.black, width: 2),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(4, 4),
                      ),
                    ],
                    image: _selectedImage != null
                        ? DecorationImage(
                            image: FileImage(_selectedImage!),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: _selectedImage == null
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.add_photo_alternate, size: 64, color: Colors.black45),
                            SizedBox(height: 16),
                            Text(
                              "Tap to select an image",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        )
                      : null,
                ),
              ),
              const SizedBox(height: 32),
              
              // TEXT FIELD
              const Text(
                "Describe what to change",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.black, width: 2),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(4, 4),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _promptController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    hintText: "E.g., Replace the background with a sunny beach...",
                    hintStyle: TextStyle(color: Colors.black45),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(16),
                  ),
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              
              // GENERATE BUTTON
              _isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                      ),
                    )
                  : PrimaryButton(
                      text: "Generate Magic ✨",
                      onTap: _generateImage,
                    ),
              
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
