import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      clipBehavior: Clip.antiAlias,
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      color: Colors.transparent,
      elevation: 10,
      child: Container(
        height: 34.0,
        width: 15,
        decoration: const BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 30.0,
              width: MediaQuery.of(context).size.width / 2 - 40.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Icon(
                    Icons.home,
                    color: Color.fromARGB(255, 240, 245, 239),
                  ),
                  Icon(
                    Icons.search,
                    color: Color.fromARGB(255, 248, 232, 90),
                  ),
                  Icon(
                    Icons.history,
                    color: Color.fromARGB(255, 240, 245, 239),
                  ),
                  Icon(
                    Icons.person,
                    color: Color.fromARGB(255, 240, 245, 239),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
