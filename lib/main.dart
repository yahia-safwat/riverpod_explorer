import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterStateProvider = StateProvider<int>((_) => 0);

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
      home: const CounterScreen(),
    );
  }
}

class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // if we use a StateProvider<T>, the type of the previous and current
    // values is StateController<T>
    ref.listen<int>(counterStateProvider, (previous, current) {
      // note: this callback executes when the provider value changes,
      // not when the build method is called

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Value is $current')),
      );
    });

    // watch the provider and rebuild when the value changes
    final counter = ref.watch(counterStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
      ),
      body: Center(
        child: ElevatedButton(
          // use the value
          child: Text('Value: $counter'),
          // change the state inside a button callback
          onPressed: () => ref.read(counterStateProvider.notifier).state++,
        ),
      ),
    );
  }
}
