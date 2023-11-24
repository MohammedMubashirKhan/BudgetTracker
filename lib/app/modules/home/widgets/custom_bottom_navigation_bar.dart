import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(40),
        bottomRight: Radius.circular(40),
      ),
      child: NavigationBar(
        selectedIndex: 2,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        destinations: const [
          NavigationDestination(
            icon: Icon(
              Icons.home,
            ),
            label: "home",
            selectedIcon: Icon(
              Icons.home,
            ),
          ),
          NavigationDestination(
            icon: Icon(
              Icons.sync,
            ),
            label: "sync",
            selectedIcon: Icon(
              Icons.sync,
            ),
          ),
          NavigationDestination(
            icon: Icon(
              Icons.donut_large_sharp,
            ),
            label: "donut_large_sharp",
            selectedIcon: Icon(
              Icons.donut_large_sharp,
            ),
          ),
          NavigationDestination(
            icon: Icon(
              Icons.settings,
            ),
            label: "settings",
            selectedIcon: Icon(
              Icons.settings,
            ),
          ),
        ],
      ),
    );
  }
}
