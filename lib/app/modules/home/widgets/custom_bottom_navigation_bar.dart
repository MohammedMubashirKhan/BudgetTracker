import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
      child: NavigationBar(
        selectedIndex: 1,
        backgroundColor: Colors.white,
        destinations: const [
          Icon(
            Icons.home,
            size: 50,
            color: Color.fromRGBO(167, 167, 197, 1),
          ),
          Icon(
            Icons.sync,
            size: 50,
            color: Color.fromRGBO(167, 167, 197, 1),
          ),
          Icon(
            Icons.donut_large_sharp,
            size: 50,
            color: Color.fromRGBO(34, 33, 114, 1),
          ),
          Icon(
            Icons.settings,
            size: 50,
            color: Color.fromRGBO(167, 167, 197, 1),
          ),
        ],
      ),
    );
  }
}
