import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tab_app_upskill/tab_bar_notifier.dart';

final tabBarProvider = ChangeNotifierProvider<TabBarNotifier>((ref) {
  return TabBarNotifier();
});

class MaterialTabBarDemo extends ConsumerWidget {
  const MaterialTabBarDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final watcher = watch(tabBarProvider);
    print(watcher.model.icons.length);
    return MaterialApp(
      home: DefaultTabController(
        length: watcher.model.icons.length,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
                tabs: watcher.model.icons
                    .map((e) => Tab(icon: Icon(e)))
                    .toList()),
            title: const Text('Tabs Demo'),
          ),
          body: TabBarView(
            children: watcher.model.icons.map((e) => Icon(e)).toList(),
          ),
        ),
      ),
    );
  }
}
