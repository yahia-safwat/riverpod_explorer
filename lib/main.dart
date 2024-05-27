import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth/user.dart';
import 'providers/auth_providers.dart';

void main() {
  // ProviderScope is a widget that stores the state of all the providers we create.
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AuthScreen(),
    );
  }
}

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.watch(authControllerProvider);
    final isSignedIn = authController.isSignedIn;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Auth App'),
        actions: [
          if (isSignedIn)
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                ref.read(authControllerProvider).signOut();
              },
            ),
        ],
      ),
      body: Center(
        child: isSignedIn
            ? AuthenticatedView(user: authController.user!)
            : const UnauthenticatedView(),
      ),
    );
  }
}

class AuthenticatedView extends StatelessWidget {
  final User user;

  const AuthenticatedView({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Logged in as ${user.email}',
            style: const TextStyle(fontSize: 20)),
        const SizedBox(height: 20),
        Text('UID: ${user.uid}', style: const TextStyle(fontSize: 20)),
      ],
    );
  }
}

class UnauthenticatedView extends ConsumerWidget {
  const UnauthenticatedView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Not logged in', style: TextStyle(fontSize: 20)),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            ref
                .read(authControllerProvider)
                .signIn('12345', 'user@example.com');
          },
          child: const Text('Login'),
        ),
      ],
    );
  }
}
