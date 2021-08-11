import 'package:flutter/cupertino.dart';

class _TabInfo {
  final String title;
  final IconData icon;

  const _TabInfo(this.title, this.icon);

  Widget createIcon() {
    return Icon(icon);
  }
}

class TabBarDemo extends StatelessWidget {
  const TabBarDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _tabInfo = [
      _TabInfo("Home", CupertinoIcons.home),
      _TabInfo("Chat", CupertinoIcons.conversation_bubble),
      _TabInfo("Profile", CupertinoIcons.profile_circled)
    ];

    return DefaultTextStyle(
      style: CupertinoTheme.of(context).textTheme.textStyle,
      child: CupertinoTabScaffold(
        restorationId: 'cupertino_tab_scaffold',
        tabBar: CupertinoTabBar(
            items: _tabInfo
                .map((e) => BottomNavigationBarItem(
                    label: e.title, icon: e.createIcon()))
                .toList()),
        tabBuilder: (context, index) {
          return CupertinoTabView(
            restorationScopeId: 'cupertino_tab_view_$index',
            builder: (context) => _CupertinoDemoTab(
                title: _tabInfo[index].title, icon: _tabInfo[index].icon),
          );
        },
      ),
    );
  }
}

class _CupertinoDemoTab extends StatelessWidget {
  final String title;
  final IconData icon;

  const _CupertinoDemoTab({required this.title, required this.icon});

  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(),
      backgroundColor: CupertinoColors.systemBackground,
      child: Center(
        child: Icon(icon, semanticLabel: title, size: 100),
      ),
    );
  }
}
