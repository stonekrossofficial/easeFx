import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/feature_detail_layout.dart';
import '../../../../core/widgets/image_style_selector.dart';
import '../../data/datasources/headshot_remote_data_source.dart';
import '../../data/models/headshot_style_model.dart';
import '../../../../features/editor/data/repositories/ai_ease_repository.dart';

class HeadshotGeneratorPage extends StatefulWidget {
  const HeadshotGeneratorPage({Key? key}) : super(key: key);

  @override
  State<HeadshotGeneratorPage> createState() => _HeadshotGeneratorPageState();
}

class _HeadshotGeneratorPageState extends State<HeadshotGeneratorPage> {
  late List<HeadshotStyleModel> _styles;
  HeadshotStyleModel? _selectedStyle;
  final _repo = AiEaseRepository();

  @override
  void initState() {
    super.initState();
    _styles = HeadshotRemoteDataSourceImpl.fallbackData
        .map((json) => HeadshotStyleModel.fromJson(json))
        .toList();
    if (_styles.isNotEmpty) {
      _selectedStyle = _styles.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FeatureDetailLayout(
      title: "Headshot Generator",
      description: "Create professional studio-quality headshots from any photo.",
      heroImageUrl: "https://picsum.photos/id/1013/500/500",
      chipsSelector: _selectedStyle == null
          ? const SizedBox.shrink()
          : ImageStyleSelector<HeadshotStyleModel>(
              items: _styles,
              selectedItem: _selectedStyle!,
              imageUrlBuilder: (item) => item.avatar,
              labelBuilder: (item) => item.style,
              onSelected: (val) {
                setState(() {
                  _selectedStyle = val;
                });
              },
            ),
      onGenerate: (image) async {
        final resultUrl = await _repo.generateHeadshot(image, _selectedStyle!.id.toString());
        if (mounted) {
          context.push('/result', extra: {
            'feature': 'Headshot',
            'style': _selectedStyle?.style ?? '',
            'resultUrl': resultUrl,
            'originalPath': image.path,
          });
        }
      },
    );
  }
}
