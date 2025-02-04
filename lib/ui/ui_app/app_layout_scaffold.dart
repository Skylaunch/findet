import 'package:findet/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class AppLayoutScaffold extends StatelessWidget {
  const AppLayoutScaffold({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('AppLayoutScaffold'));

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: navigationShell.goBranch,
        indicatorColor: Colors.black,
        destinations: [
          NavigationDestination(
            icon: SvgPicture.asset('lib/assets/images/icons/tabs/home.svg'),
            label: S.of(context).home_tab,
            selectedIcon: SvgPicture.asset(
              'lib/assets/images/icons/tabs/home.svg',
              theme: const SvgTheme(currentColor: Colors.white),
            ),
          ),
          NavigationDestination(
            icon: SvgPicture.asset('lib/assets/images/icons/tabs/diagram.svg'),
            label: S.of(context).diagram_tab,
            selectedIcon: SvgPicture.asset(
                'lib/assets/images/icons/tabs/diagram.svg',
                theme: const SvgTheme(currentColor: Colors.white)),
          ),
          NavigationDestination(
            icon: SvgPicture.asset('lib/assets/images/icons/tabs/settings.svg'),
            label: S.of(context).settings_tab,
            selectedIcon: SvgPicture.asset(
                'lib/assets/images/icons/tabs/settings.svg',
                theme: const SvgTheme(currentColor: Colors.white)),
          ),
        ],
      ),
    );
  }
}
