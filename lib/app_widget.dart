import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tab_bar/material_tab_bar.dart';
import 'package:tab_bar/tab_bar_notifier.dart';

class AppState {}

final StateProvider<AppState> appProvider = StateProvider((ref) {
  final tabBarState = ref.watch(tabBarProvider);

  tabBarState.model.icons = [Icons.announcement, Icons.alarm, Icons.warning];

  return AppState();
});

class AppWidget extends ConsumerWidget {
  AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final watcher = watch(appProvider);
    print(watcher);

    return MaterialTabBarDemo();
  }

  void updateModel(TabBarModel model) {}
}
