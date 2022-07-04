import 'package:reddit/app_theme.dart';

import 'community_search_result_page.dart';
import 'package:flutter/material.dart';
import 'post_search_result_page.dart';

final GlobalKey<NavigatorState> _navKey = GlobalKey<NavigatorState>();

class SearchPage extends StatefulWidget {
  SearchPage(this.search, {Key key}) : super(key: key);
  String search;
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with TickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.search),
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(
                text: 'Posts',
              ),
              Tab(
                text: 'Communities',
              ),
            ],
            labelColor: Colors.lightBlue,
          ),
        ),
        body: Navigator(
          key: _navKey,
          onGenerateRoute: (_) => MaterialPageRoute(
            builder: (_) => TabBarView(
              controller: _tabController,
              children: [
                PostSearchResultPage(),
                CommunitySearchResultPage(widget.search),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
