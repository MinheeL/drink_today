import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF375C9F),
      child: Container(
        height: 70,
        child: const TabBar(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white60,
          indicatorColor: Colors.transparent,
          tabs: [
            Tab(
              icon: Icon(Icons.home, size: 30),
            ),
            Tab(
              icon: Icon(Icons.account_circle, size: 30),
            ),
          ],
        ),
      ),
    );
  }
}
