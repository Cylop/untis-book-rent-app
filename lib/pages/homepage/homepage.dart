import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedPageIndex = 0;

  PageController pageController = PageController(initialPage: 2);

  void onTapped(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
    pageController.jumpToPage(_selectedPageIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Untis Book Rent'),
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: onTapped,
        children: [
          Container(color: Colors.red),
          Container(color: Colors.green),
          Container(color: Colors.cyan),
          Container(color: Colors.grey),
          Container(color: Colors.purple),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.school_outlined), label: 'Classes'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_outlined), label: 'Add Book'),
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm_outlined), label: 'Rented Books'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Books'),
        ],
        currentIndex: _selectedPageIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: onTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
