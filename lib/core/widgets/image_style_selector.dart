import 'package:flutter/material.dart';

class ImageStyleSelector<T> extends StatelessWidget {
  final List<T> items;
  final T selectedItem;
  final String Function(T) imageUrlBuilder;
  final String Function(T) labelBuilder;
  final ValueChanged<T> onSelected;

  const ImageStyleSelector({
    Key? key,
    required this.items,
    required this.selectedItem,
    required this.imageUrlBuilder,
    required this.labelBuilder,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          final isSelected = item == selectedItem;
          
          return GestureDetector(
            onTap: () => onSelected(item),
            child: Container(
              width: 90,
              margin: const EdgeInsets.only(right: 12),
              child: Column(
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isSelected ? Colors.black : Colors.transparent,
                        width: 3,
                      ),
                      image: DecorationImage(
                        image: NetworkImage(imageUrlBuilder(item)),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: isSelected
                        ? Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(13),
                            ),
                            child: const Center(
                              child: Icon(Icons.check_circle, color: Colors.white, size: 30),
                            ),
                          )
                        : null,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    labelBuilder(item),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      color: isSelected ? Colors.black : Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
