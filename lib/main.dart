import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Myhomepage(),
    );
  }
}

final countProvider = StateProvider((ref) {
  return 0;
});

class Myhomepage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(countProvider);
    final counter = ref.watch(countProvider.notifier);
    return Scaffold(
        appBar: AppBar(
          title: Text('demoplay'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                '${count}',
                style: Theme.of(context).textTheme.headline4,
              ),
              const Text(
                'botton:',
              ),
              const Text('patren'),
              TextButton(
                  onPressed: () => counter.state++, child: Text('button'))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => counter.state++,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ));
  }
}
