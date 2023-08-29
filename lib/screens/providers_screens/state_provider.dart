import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// https://marketplace.visualstudio.com/items?itemName=robert-brunhage.flutter-riverpod-snippets

final StateProvider<int> counterProvider = StateProvider<int>((_) {
  return 0;
});

final Provider<String> isTooMuchProvider =
    Provider<String>((ProviderRef<String> ref) {
  int value = ref.watch(counterProvider);
  return value > 10
      ? "Too much data i need a break"
      : "I can handle more flutter info";
});

final StateProvider<bool> isDarkModelProvider =
    StateProvider<bool>((StateProviderRef<bool> ref) {
  return false;
});

final Provider<ThemeData> anotherDarkModeProvider =
    Provider<ThemeData>((ProviderRef<ThemeData> ref) {
  return ref.watch(isDarkModelProvider) ? ThemeData.dark() : ThemeData.light();
});
// how to read provider on the scope of Widget
//1- StatelessWidget => ConsumerWidget
//2- add WidgetRef ref inside build(context,ref)

//read : get data without rebuilding + tap actions
//watch: trigger rebuild upon changing in provider value
// listen: can provide any action when provider value reaches a State(value)
//invalidate: will reset the provider to its original value

