import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

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
              ),
              SettingsTile.switchTile(
                onToggle: (value) {
                  setState(() {
                    isSwitched = value;
                    Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
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
