import 'package:flutter/material.dart';
import 'feed_page.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'add_post_page.dart';
import 'communities_page.dart';
import 'Setting/profile_page.dart';
import 'Setting/create_community_page.dart';
import 'Setting/about_us_page.dart';
import 'Setting/saved_posts_page.dart';

class PageDrawer extends StatefulWidget {
  const PageDrawer({Key key}) : super(key: key);
  @override
  State<PageDrawer> createState() => _PageDrawerState();
}

class _PageDrawerState extends State<PageDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.indigo),
            child: UserAccountsDrawerHeader(
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()));
            },
          ),
          ListTile(
            title: const Text('Create a community'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CreateCommunity()));
            },
          ),
          ListTile(
            title: const Text('Saved posts'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SavedPosts()));
            },
          ),
          ListTile(
            title: const Text('About us'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AboutUs()));
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
                      FeedPage.darkMode = value;
                    });
                  },
                  value: FeedPage.darkMode,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PageAppBar extends StatefulWidget {
  const PageAppBar({Key key}) : super(key: key);

  @override
  State<PageAppBar> createState() => _PageAppBarState();
}

class _PageAppBarState extends State<PageAppBar> {
  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      color: Colors.white,
      style: TabStyle.reactCircle,
      backgroundColor: Colors.indigo,
      items: const [
        TabItem(icon: Icons.add, title: "Add"),
        TabItem(icon: Icons.home_filled, title: "Home"),
        TabItem(icon: Icons.person_search_rounded, title: "Communities"),
      ],
      initialActiveIndex: FeedPage.selectedIndex,
      onTap: (int index) {
        setState(() {
          FeedPage.selectedIndex = index;
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) => const AddPage(),
                  transitionDuration: Duration.zero,
                  reverseTransitionDuration: Duration.zero),
              );
              break;
            case 1:
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => const FeedPage(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero),
              );
              break;
            case 2:
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => const CommunitiesPage(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero),
              );
              break;
            default:
              break;
          }
        });
      },
    );
  }
}
