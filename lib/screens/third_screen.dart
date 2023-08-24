import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/default_app_bar.dart';

int counter = 0;

var incr = StateProvider.autoDispose((ref) => counter++);

class TestScreen extends ConsumerWidget {
  const TestScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(incr);
    return Scaffold(
      appBar: MyAppBar(titleText: title),
      body: Center(
        child: Text("Count : $counter",style: const TextStyle(fontSize: 30),),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            ref.read(incr.notifier).update((state) => counter++) ;
          },
          child: const Icon(Icons.add)),
    );
  }
}
