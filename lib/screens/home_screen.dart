import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../settings/providers/settings_repository_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsRepository = ref.watch(settingsRepositoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Onboarding Complete: ${settingsRepository.onboardingComplete()}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final currentStatus = settingsRepository.onboardingComplete();
                await settingsRepository.setOnboardingComplete(!currentStatus);
                ref.refresh(settingsRepositoryProvider);
              },
              child: const Text('Toggle Onboarding Status'),
            ),
          ],
        ),
      ),
    );
  }
}
