import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/feature_detail_layout.dart';
import '../../../../core/widgets/image_style_selector.dart';
import '../../data/models/mock_hair_swap.dart';
import '../../data/models/hair_swap_model.dart';
import '../../../../features/editor/data/repositories/ai_ease_repository.dart';

class HairSwapPage extends StatefulWidget {
  const HairSwapPage({Key? key}) : super(key: key);

  @override
  State<HairSwapPage> createState() => _HairSwapPageState();
}

class _HairSwapPageState extends State<HairSwapPage> {
  late List<HairSwapModel> _styles;
  HairSwapModel? _selectedStyle;
  final _repo = AiEaseRepository();

  @override
  void initState() {
    super.initState();
    _styles = MockHairSwap.hairStyles;
    if (_styles.isNotEmpty) {
      _selectedStyle = _styles.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FeatureDetailLayout(
      title: "HairSwap",
      description: "Experiment with new hair colors instantly using AI.",
      heroImageUrl: "https://picsum.photos/id/1011/500/500",
      chipsSelector: _selectedStyle == null
          ? const SizedBox.shrink()
          : ImageStyleSelector<HairSwapModel>(
              items: _styles,
              selectedItem: _selectedStyle!,
              imageUrlBuilder: (item) => item.url,
              labelBuilder: (item) => item.name,
              onSelected: (val) {
                setState(() {
                  _selectedStyle = val;
                });
              },
            ),
      onGenerate: (image) async {
        final resultUrl = await _repo.generateHairSwap(image, _selectedStyle!.id.toString());
        if (mounted) {
          context.push('/result', extra: {
            'feature': 'HairSwap',
            'style': _selectedStyle?.name ?? '',
            'resultUrl': resultUrl,
            'originalPath': image.path,
          });
        }
      },
    );
  }
}
