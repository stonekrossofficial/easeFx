import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/feature_detail_layout.dart';
import '../../../../core/widgets/image_style_selector.dart';
import '../../data/models/mock_ai_filters.dart';
import '../../data/models/ai_filter_model.dart';

class AiFiltersPage extends StatefulWidget {
  const AiFiltersPage({Key? key}) : super(key: key);

  @override
  State<AiFiltersPage> createState() => _AiFiltersPageState();
}

class _AiFiltersPageState extends State<AiFiltersPage> {
  late List<AiFilterStyle> _filters;
  AiFilterStyle? _selectedFilter;

  @override
  void initState() {
    super.initState();
    _filters = MockAiFilters.styles;
    if (_filters.isNotEmpty) {
      _selectedFilter = _filters.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FeatureDetailLayout(
      title: "AI Filters",
      description: "Transform your photos with stunning creative AI filters.",
      heroImageUrl: "https://picsum.photos/id/1014/500/500",
      chipsSelector: _selectedFilter == null
          ? const SizedBox.shrink()
          : ImageStyleSelector<AiFilterStyle>(
              items: _filters,
              selectedItem: _selectedFilter!,
              imageUrlBuilder: (item) => item.avatar,
              labelBuilder: (item) => item.styleName,
              onSelected: (val) {
                setState(() {
                  _selectedFilter = val;
                });
              },
            ),
      onGenerate: (image) async {
        final resultUrl = '';
        if (mounted) {
          context.push('/result', extra: {
            'feature': 'AI Filters',
            'style': _selectedFilter?.styleName ?? '',
            'resultUrl': resultUrl,
            'originalPath': image.path,
          });
        }
      },
    );
  }
}
