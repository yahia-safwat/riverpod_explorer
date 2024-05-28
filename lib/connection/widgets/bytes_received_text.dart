import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/connection_provider.dart';

class BytesReceivedText extends ConsumerWidget {
  const BytesReceivedText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Only rebuild when bytesReceived changes
    final bytesReceived = ref.watch(connectionProvider.select(
      (connection) => connection.bytesReceived,
    ));
    return Text('Bytes Received: $bytesReceived');
  }
}
