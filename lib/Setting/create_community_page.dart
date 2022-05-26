import 'package:flutter/material.dart';

class CreateCommunity extends StatefulWidget {
  const CreateCommunity({Key key}) : super(key: key);

  @override
  State<CreateCommunity> createState() => _CreateCommunityState();
}

class _CreateCommunityState extends State<CreateCommunity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reddit'),
      ),
      body: const ListTile(
        title: Text('Create community'),
      ),
    );
  }
}
