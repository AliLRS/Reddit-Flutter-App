import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBarPage extends StatefulWidget {
  const SearchBarPage({Key key}) : super(key: key);

  @override
  State<SearchBarPage> createState() => _SearchBarPageState();
}

class _SearchBarPageState extends State<SearchBarPage> {
  TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoSearchTextField(
        controller: _textController,
        onSubmitted: (String value) {
          Navigator.of(context).pushNamed('/search', arguments: value);
        });
  }
}
