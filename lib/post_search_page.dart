import 'package:flutter/material.dart';
import 'package:reddit/Community_search_result_page.dart';
import 'package:reddit/widgets.dart';
import 'post_search_result_page.dart';

final GlobalKey<NavigatorState> _navKey = GlobalKey<NavigatorState>();

class PostSearchPage extends StatefulWidget {
  PostSearchPage({Key key, String search}) : super(key: key) {}
  String search;
  @override
  State<PostSearchPage> createState() => _PostSearchPageState();
}

class _PostSearchPageState extends State<PostSearchPage>
    with TickerProviderStateMixin {
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
          title: Container(
            color: Colors.white,
            child: ReplacedPostSearchBar(widget.search),
          ),
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
          ),
        ),
        body: Navigator(
          key: _navKey,
          onGenerateRoute: (_) => MaterialPageRoute(
            builder: (_) => TabBarView(
              controller: _tabController,
              children: [
                PostSearchResultPage(),
                CommunitySearchResultPage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
