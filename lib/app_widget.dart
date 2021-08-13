import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tab_bar/material_tab_bar.dart';
import 'package:tab_bar/tab_bar_notifier.dart';

class IconProviderState {
  var defaultIcons = <IconData>[];
  var specialIcons = <IconData>[];

  IconProviderState() {
    defaultIcons = [Icons.announcement, Icons.alarm, Icons.warning];
    specialIcons = [
      Icons.announcement,
      Icons.alarm,
      Icons.warning,
      Icons.airline_seat_flat_angled_rounded
    ];
  }
}

final StateProvider<IconProviderState> iconProvider = StateProvider((ref) {
  return IconProviderState();
});

class AppState {}

final StateProvider<AppState> appProvider = StateProvider((ref) {
  final tabBarState = ref.watch(tabBarProvider);
  final iconState = ref.watch(iconProvider);

  // how can we configure this only once
  tabBarState.model.icons = iconState.state.defaultIcons.toList();

  return AppState();
});

class AppWidget extends ConsumerWidget {
  AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    // watching here is necessary to load icons
    // but we dont use the watcher in any way. is there another way?
    final watcher = watch(appProvider);
    print(watcher);

    return MaterialTabBarDemo();
  }

  void updateModel(TabBarModel model) {}
}
