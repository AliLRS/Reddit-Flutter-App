import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  int _selectedIndex = 1;
  int _drawerSelectedIndex = 0;
  bool _darkMode = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reddit'),
      ),
      body: const ListTile(
        title: Text('Feed'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.deepOrange),
              child: UserAccountsDrawerHeader(
                //onDetailsPressed: ,
                accountName: Text('User'),
                accountEmail: Text('User@email.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text('U'),
                ),
              ),
            ),
            ListTile(
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _drawerSelectedIndex = 0;
                });
              },
            ),
            ListTile(
              title: const Text('Create a community'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _drawerSelectedIndex = 1;
                });
              },
            ),
            ListTile(
              title: const Text('Saved posts'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _drawerSelectedIndex = 2;
                });
              },
            ),
            ListTile(
              title: const Text('About us'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _drawerSelectedIndex = 3;
                });
              },
            ),
            Container(
              decoration: const BoxDecoration(color: Colors.black38),
              child: Row(
                children: [
                  const Text('     Dark mode',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Switch(
                    onChanged: (bool value) {
                      setState(() {
                        _darkMode = value;
                      });
                    },
                    value: _darkMode,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        color: Colors.white,
        style: TabStyle.reactCircle,
        backgroundColor: Colors.deepOrange,
        items: const [
          TabItem(icon: Icons.add, title: "Add"),
          TabItem(icon: Icons.home_filled, title: "Home"),
          TabItem(icon: Icons.person_search_rounded, title: "Communities"),
        ],
        initialActiveIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
