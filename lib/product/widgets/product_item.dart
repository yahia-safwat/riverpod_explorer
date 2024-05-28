import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/current_product_index_provider.dart';

class ProductItem extends ConsumerWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Access the index via WidgetRef
    final index = ref.watch(currentProductIndexProvider);

    return ListTile(
      title: Text('Product $index'),
    );
  }
}
