import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../data/repositories/text_to_image_repository.dart';

class TextToImagePage extends StatefulWidget {
  const TextToImagePage({Key? key}) : super(key: key);

  @override
  State<TextToImagePage> createState() => _TextToImagePageState();
}

class _TextToImagePageState extends State<TextToImagePage> {
  final TextEditingController _promptController = TextEditingController();
  final TextToImageRepository _repository = TextToImageRepository();
  bool _isLoading = false;

  void _generateImage() async {
    final prompt = _promptController.text.trim();
    if (prompt.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a prompt first.')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final result = await _repository.generateImage(prompt);

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
          'resultUrl': imageUrl,
          'feature': 'Text to Image',
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
          "Text to Image",
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
              // PREVIEW IMAGE
              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                  image: const DecorationImage(
                    image: AssetImage('asset/text_to_img_preview_screen.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              
              // TEXT FIELD
              const Text(
                "Describe your imagination",
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
                  maxLines: 4,
                  decoration: const InputDecoration(
                    hintText: "E.g., A girl running on the beach looking at the sky...",
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
