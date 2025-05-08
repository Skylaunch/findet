import 'package:findet/blocs/global/theme_bloc.dart';
import 'package:findet/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    final colors = context.watch<ThemeBloc>().state.colors;

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: navigationShell.goBranch,
        indicatorColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        overlayColor: WidgetStateProperty.all<Color>(Colors.transparent),
        labelTextStyle: WidgetStateProperty.all<TextStyle>(
          TextStyle(fontSize: 12, color: colors.primaryBlueColor),
        ),
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        destinations: [
          NavigationDestination(
            icon: SvgPicture.asset('lib/assets/images/icons/tabs/home.svg', height: 24, width: 24),
            label: S.of(context).home_tab,
            selectedIcon: SvgPicture.asset(
              'lib/assets/images/icons/tabs/home.svg',
              height: 24,
              width: 24,
              colorFilter: ColorFilter.mode(colors.primaryBlueColor, BlendMode.srcIn),
            ),
          ),
          NavigationDestination(
            icon: SvgPicture.asset('lib/assets/images/icons/tabs/diagram.svg', height: 24, width: 24),
            label: S.of(context).diagram_tab,
            selectedIcon: SvgPicture.asset(
              'lib/assets/images/icons/tabs/diagram.svg',
              height: 24,
              width: 24,
              colorFilter: ColorFilter.mode(colors.primaryBlueColor, BlendMode.srcIn),
            ),
          ),
          NavigationDestination(
            icon: SvgPicture.asset('lib/assets/images/icons/tabs/settings.svg', height: 24, width: 24),
            label: S.of(context).settings_tab,
            selectedIcon: SvgPicture.asset(
              'lib/assets/images/icons/tabs/settings.svg',
              height: 24,
              width: 24,
              colorFilter: ColorFilter.mode(colors.primaryBlueColor, BlendMode.srcIn),
            ),
          ),
        ],
      ),
    );
  }
}
