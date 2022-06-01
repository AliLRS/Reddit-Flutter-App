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
              margin: const EdgeInsets.only(top: 10),
              height: 50,
              width: 150,
              child: ElevatedButton(
                onPressed: () {

                },
                child: const Text('Add Post'),
              ),
            ),
          ],
        ),
      ),
      drawer: const PageDrawer(),
      bottomNavigationBar: const PageAppBar()
    );
  }
}
