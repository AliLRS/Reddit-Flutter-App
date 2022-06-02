import 'package:flutter/material.dart';
import 'package:reddit/searchbar_page.dart';
import 'widgets.dart';

class CommunitiesPage extends StatefulWidget {
  const CommunitiesPage({Key key}) : super(key: key);

  @override
  State<CommunitiesPage> createState() => _CommunitiesPageState();
}

class _CommunitiesPageState extends State<CommunitiesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          color: Colors.white,
          child: SearchBarPage(),
        ),
      ),
      body: const ListTile(
        title: Text('Communities page'),
      ),
      drawer: const PageDrawer(),
      bottomNavigationBar: const PageAppBar(),
    );
  }
}
