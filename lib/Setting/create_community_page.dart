import 'package:flutter/material.dart';
import 'package:reddit/communities_page.dart';

import '../feed_page.dart';

class CreateCommunity extends StatefulWidget {
  const CreateCommunity({Key key}) : super(key: key);

  @override
  State<CreateCommunity> createState() => _CreateCommunityState();
}

class _CreateCommunityState extends State<CreateCommunity> {
  TextEditingController _nameController;
  String _type = 'public';
  bool _isButtonActive = false;
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _nameController.addListener(() {
      final _isButtonActive = _nameController.text.isNotEmpty;
      setState(() => this._isButtonActive = _isButtonActive);
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a community'),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              style: const TextStyle(fontSize: 22),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: 'Community name',
              ),
              controller: _nameController,
              keyboardType: TextInputType.text,
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              alignment: Alignment.bottomCenter,
              child:
                  Text('Community type', style: const TextStyle(fontSize: 17)),
            ),
            Container(
              child: DropdownButton<String>(
                value: _type,
                onChanged: (String newValue) {
                  setState(() {
                    _type = newValue;
                  });
                },
                items: [
                  DropdownMenuItem<String>(
                    value: 'public',
                    child: Text('Public'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'private',
                    child: Text('Private'),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              height: 50,
              width: 150,
              child: ElevatedButton(
                onPressed: _isButtonActive
                    ? () {
                        FeedPage.selectedIndex = 2;
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CommunitiesPage()));
                      }
                    : null,
                child: const Text('Create Community'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
