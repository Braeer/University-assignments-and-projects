import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopoik/pages/auth_page.dart';
import 'package:flutter_shopoik/pages/product_page.dart';
import 'package:flutter_shopoik/pages/search_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(home: HomeScreen());
  }
}

// !HomeSCREEN

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedScreen = 0;

  final List<Widget> _widgetOptions = <Widget>[
    Center(child: ProductPage()),
    const Center(child: SearchPage()),
    const Center(child: AuthPage()),
  ];

  final List _NamePages = <String>['Главная', 'Поиск', 'Профиль'];

  void _onItemTapped(int index) {
    setState(() {
      _selectedScreen = index; // Обновляем индекс выбранной вкладки
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar:
          CupertinoNavigationBar(middle: Text(_NamePages[_selectedScreen])),
      child: Column(
        children: [
          Expanded(child: _widgetOptions.elementAt(_selectedScreen)),
          CupertinoTabBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home),
                label: 'Главная',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.search),
                label: 'Поиск',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person),
                label: 'Профиль',
              ),
            ],
            currentIndex: _selectedScreen,
            onTap: _onItemTapped,
          )
        ],
      ),
    );
  }
}
