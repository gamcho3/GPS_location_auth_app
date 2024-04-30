import 'package:flutter/material.dart';

class DefaultLayout extends StatefulWidget {
  const DefaultLayout({super.key, required this.children});

  final List<Widget> children;

  @override
  State<DefaultLayout> createState() => _DefaultLayoutState();
}

class _DefaultLayoutState extends State<DefaultLayout> {
  int curIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset("images/logo.png"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => Navigator.of(context).pushNamed('/login'),
              child: CircleAvatar(
                backgroundImage: AssetImage("images/person.png"),
              ),
            ),
          )
        ],
      ),
      body: [...widget.children][curIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: curIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          NavigationDestination(
              icon: Badge(label: Text('2'), child: Icon(Icons.person)),
              label: '인사말'),
          NavigationDestination(icon: Icon(Icons.add_road), label: '코스 안내'),
          NavigationDestination(icon: Icon(Icons.qr_code), label: 'QR')
        ],
        onDestinationSelected: (value) {
          setState(() {
            curIndex = value;
          });
        },
      ),
    );
  }
}
