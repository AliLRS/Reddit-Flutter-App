import 'package:reddit/View/Entry/login_page.dart';
import 'package:reddit/View/Settings/about_us_page.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:flutter/material.dart';
import 'profile_page.dart';

class Setting extends StatefulWidget {
  const Setting({Key key}) : super(key: key);
  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: const Text('Common'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                  leading: const Icon(Icons.person),
                  title: const Text('Profile'),
                  value: const Text('Profile page'),
                  onPressed: (context) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfilePage()));
                  }),
              SettingsTile.navigation(
                  leading: const Icon(Icons.account_box_outlined),
                  title: const Text('About'),
                  value: const Text('About us page'),
                  onPressed: (context) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AboutUs()));
                  }),
              SettingsTile.navigation(
                  leading: const Icon(Icons.exit_to_app),
                  title: const Text('Logout'),
                  value: const Text('Logout'),
                  onPressed: (context) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                        (Route<dynamic> route) => false);
                  }),
              SettingsTile.switchTile(
                onToggle: (value) {
                  setState(() {
                    isSwitched = value;
                    Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    const Setting(),
                            transitionDuration: Duration.zero,
                            reverseTransitionDuration: Duration.zero));
                  });
                },
                initialValue: isSwitched,
                leading: const Icon(Icons.format_paint),
                title: const Text('Enable custom theme'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
