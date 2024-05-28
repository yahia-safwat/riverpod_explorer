import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../connection/models/connection.dart';
import '../connection/providers/connection_provider.dart';
import '../connection/widgets/bytes_received_text.dart';
import '../connection/widgets/bytes_sent_text.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final connectionState = ref.watch(connectionProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Select Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const BytesReceivedText(),
            const SizedBox(height: 10),
            const BytesSentText(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final current = connectionState;
                ref.read(connectionProvider.notifier).state = Connection(
                  bytesSent: current.bytesSent + 10,
                  bytesReceived: current.bytesReceived + 5,
                );
              },
              child: const Text('Update Connection'),
            ),
          ],
        ),
      ),
    );
  }
}
