import 'widgets.dart';
import 'feed_page.dart';
import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController _titleController, _bodyController;
  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _bodyController = TextEditingController();
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
                  borderRadius: BorderRadius.circular(25),
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
                      borderRadius: BorderRadius.circular(25),
                    ),
                    hintText: 'Add Body text'),
                controller: _bodyController,
                keyboardType: TextInputType.text,
                maxLines: 10,
              ),
            ),
          ],
        ),
      ),
      drawer: const PageDrawer(),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 50,
          child: ElevatedButton(
              child: const Text('Continue'),
              onPressed: () {
                setState(() {
                  FeedPage.selectedIndex = 1;
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FeedPage()));
                });
              }),
        ),
      ),
    );
  }
}
