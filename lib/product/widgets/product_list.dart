import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/current_product_index_provider.dart';
import 'product_item.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20, // Example item count
      itemBuilder: (context, index) {
        // Add a parent ProviderScope for each ProductItem
        return ProviderScope(
          overrides: [
            // Override currentProductIndexProvider with the index
            currentProductIndexProvider.overrideWithValue(index),
          ],
          // Return a const ProductItem with no constructor arguments
          child: const ProductItem(),
        );
      },
    );
  }
}
