import 'package:flutter/material.dart';
import '../widgets.dart';
import 'feed_page.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController _titleController, _bodyController;
  bool _isButtonActive = false;
  List<String> _communities;
  String _communitySelected;
  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _bodyController = TextEditingController();
    _titleController.addListener(() {
      final _isButtonActive = _titleController.text.isNotEmpty &&
          _bodyController.text.isNotEmpty &&
          _communitySelected != null;
      setState(() => this._isButtonActive = _isButtonActive);
    });
    _bodyController.addListener(() {
      _isButtonActive = _titleController.text.isNotEmpty &&
          _bodyController.text.isNotEmpty &&
          _communitySelected != null;
      setState(() => this._isButtonActive = _isButtonActive);
    });
    _communities = [
      'r/Dart',
      'r/Flutter',
      'r/React',
      'r/Vue',
      'r/Angular',
      'r/Backbone',
      'r/Ember',
      'r/Meteor'
    ];
    _communitySelected = _communities[0];
  }

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Reddit'),
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
                  hintText: 'Add a title',
                ),
                controller: _titleController,
                keyboardType: TextInputType.text,
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: 'Add Body text'),
                  controller: _bodyController,
                  keyboardType: TextInputType.multiline,
                  maxLines: 10,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, right: 10, left: 10),
                child: DropdownButton<String>(
                  value: _communitySelected,
                  items: _communities.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  isExpanded: true,
                  onChanged: (String value) {
                    setState(() {
                      _communitySelected = value;
                    });
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                height: 50,
                width: 150,
                child: ElevatedButton(
                  onPressed: _isButtonActive
                      ? () {
                          FeedPage.selectedIndex = 1;
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FeedPage()));
                        }
                      : null,
                  child: const Text('Add Post'),
                ),
              ),
            ],
          ),
        ),
        drawer: const PageDrawer(),
        bottomNavigationBar: const PageAppBar());
  }
}
