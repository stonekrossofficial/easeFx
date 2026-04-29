import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/primary_button.dart';

import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import '../../../../core/data/creations_store.dart';

class ResultPage extends StatefulWidget {
  final Map<String, dynamic>? extraData;

  const ResultPage({Key? key, this.extraData}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  bool _isSaved = false;
  bool _isDownloading = false;

  Future<void> _downloadToGallery(String url) async {
    if (_isDownloading) return;
    setState(() => _isDownloading = true);
    
    try {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Downloading image...")),
      );
      
      var response = await http.get(Uri.parse(url));
      final result = await ImageGallerySaverPlus.saveImage(
        response.bodyBytes,
        quality: 100,
        name: "easefx_${DateTime.now().millisecondsSinceEpoch}",
      );

      if (mounted) {
        if (result['isSuccess']) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Saved to Gallery successfully!")),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Failed to save to Gallery.")),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error saving image: $e")),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isDownloading = false);
      }
    }
  }

  void _handleBack(BuildContext context) async {
    if (_isSaved) {
      context.pop();
      return;
    }

    final shouldPop = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Unsaved Changes'),
        content: const Text('Do you want to continue without saving your creation?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Continue'),
          ),
        ],
      ),
    );

    if (shouldPop == true) {
      if (context.mounted) context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) return;
        _handleBack(context);
      },
      child: Scaffold(
      backgroundColor: const Color(0xFFFFECA3),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => _handleBack(context),
        ),
        title: const Text(
          "Preview",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 30,
                      offset: const Offset(0, 15),
                    )
                  ],
                  image: DecorationImage(
                    image: (widget.extraData?['resultUrl'] != null && widget.extraData!['resultUrl'].isNotEmpty)
                        ? NetworkImage(widget.extraData!['resultUrl'])
                        : const NetworkImage("https://picsum.photos/id/1025/500/500") as ImageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 16,
                      right: 16,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.auto_awesome,
                          color: Colors.amber,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (widget.extraData?['originalPath'] != null && widget.extraData!['originalPath'].isNotEmpty) ...[
                const SizedBox(height: 24),
                const Text(
                  "Before & After",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                            image: FileImage(File(widget.extraData!['originalPath'])),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Icon(Icons.arrow_forward, color: Colors.black45),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.black, width: 2),
                          image: DecorationImage(
                            image: (widget.extraData?['resultUrl'] != null && widget.extraData!['resultUrl'].isNotEmpty)
                                ? NetworkImage(widget.extraData!['resultUrl'])
                                : const NetworkImage("https://picsum.photos/id/1025/500/500") as ImageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
              ] else ...[
                const SizedBox(height: 32),
              ],
              PrimaryButton(
                text: _isSaved ? "Saved" : "Save to My Creations",
                onTap: _isSaved ? () {} : () async {
                  final resultUrl = widget.extraData?['resultUrl'] ?? "https://picsum.photos/id/1025/500/500";
                  final feature = widget.extraData?['feature'] ?? "AI Edit";
                  
                  // Save locally in app store
                  CreationsStore().addCreation(
                    Creation(
                      imageUrl: resultUrl,
                      featureLabel: feature,
                      date: DateTime.now(),
                    ),
                  );
                  
                  // Save to Gallery
                  await _downloadToGallery(resultUrl);
                  
                  if (mounted) {
                    setState(() {
                      _isSaved = true;
                    });
                  }
                },
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: PrimaryButton(
                      text: "Download",
                      isSecondary: true,
                      onTap: () {
                        final resultUrl = widget.extraData?['resultUrl'] ?? "https://picsum.photos/id/1025/500/500";
                        _downloadToGallery(resultUrl);
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: PrimaryButton(
                      text: "Share",
                      isSecondary: true,
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Sharing...")),
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    ));
  }
}
