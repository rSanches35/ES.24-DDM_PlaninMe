import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key, required this.currentIndex, required this.onTap,}) : super(key: key);

  final int currentIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.playlist_play),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.insert_invitation_rounded),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: '',
        ),
      ],
      currentIndex: currentIndex,
      backgroundColor: Color(0xFF597FA3),
      selectedItemColor: Color(0xFF95CCFF),
      unselectedItemColor: Color(0xFFFFFFFF),
      iconSize: 30,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: onTap,
    );
  }
}
