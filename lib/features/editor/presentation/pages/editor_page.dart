import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/feature_detail_layout.dart';
import '../../../../core/widgets/image_style_selector.dart';
import '../../data/models/wardrobe_style_model.dart';
import '../../data/repositories/cloth_changer_repository.dart';

class EditorPage extends StatefulWidget {
  const EditorPage({Key? key}) : super(key: key);

  @override
  State<EditorPage> createState() => _EditorPageState();
}

class _EditorPageState extends State<EditorPage> {
  List<WardrobeStyleModel> _styles = [];
  WardrobeStyleModel? _selectedStyle;
  final _repo = ClothChangerRepository();
  bool _isLoadingStyles = true;

  @override
  void initState() {
    super.initState();
    _loadStyles();
  }

  Future<void> _loadStyles() async {
    try {
      final styles = await _repo.fetchStyles();
      if (mounted) {
        setState(() {
          _styles = styles;
          if (_styles.isNotEmpty) {
            _selectedStyle = _styles.first;
          }
          _isLoadingStyles = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoadingStyles = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to load styles: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FeatureDetailLayout(
      title: "Cloth Changer",
      description: "Try on new outfits instantly without changing clothes.",
      heroImageUrl: "https://picsum.photos/id/1012/500/500",
      chipsSelector: _isLoadingStyles
          ? const Center(child: Padding(
              padding: EdgeInsets.all(32.0),
              child: CircularProgressIndicator(color: Colors.black),
            ))
          : (_selectedStyle == null
              ? const SizedBox.shrink()
              : ImageStyleSelector<WardrobeStyleModel>(
                  items: _styles,
                  selectedItem: _selectedStyle!,
                  imageUrlBuilder: (item) => item.displayUrl,
                  labelBuilder: (item) => item.style,
                  onSelected: (val) {
                    setState(() {
                      _selectedStyle = val;
                    });
                  },
                )),
      onGenerate: (image) async {
        if (_selectedStyle == null) return;
        final resultUrl = await _repo.generateClothChange(image, _selectedStyle!.id.toString());
        if (mounted) {
          context.push('/result', extra: {
            'feature': 'Cloth Changer',
            'style': _selectedStyle?.style ?? '',
            'resultUrl': resultUrl,
            'originalPath': image.path,
          });
        }
      },
    );
  }
}
