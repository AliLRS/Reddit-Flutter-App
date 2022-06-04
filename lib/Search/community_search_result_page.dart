import 'package:flutter/material.dart';

class CommunitySearchResultPage extends StatefulWidget {
  const CommunitySearchResultPage({Key key}) : super(key: key);

  @override
  State<CommunitySearchResultPage> createState() =>
      _CommunitySearchResultPageState();
}

class _CommunitySearchResultPageState extends State<CommunitySearchResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListTile(
        title: Text('Community search result page'),
      ),
    );
  }
}
