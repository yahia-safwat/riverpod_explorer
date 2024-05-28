import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/connection_provider.dart';

class BytesSentText extends ConsumerWidget {
  const BytesSentText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Only rebuild when bytesSent changes
    final bytesSent = ref.watch(connectionProvider.select(
      (connection) => connection.bytesSent,
    ));

    return Text('Bytes Sent: $bytesSent');
  }
}
