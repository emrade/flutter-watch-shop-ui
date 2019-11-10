import 'package:flutter/material.dart';
import 'package:flutter_watch_shop/global_widgets/custom_appbar.dart';
import 'package:flutter_watch_shop/utils/utils.dart';
import 'package:flutter_watch_shop/views/home/widgets/product_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  List<String> tabs = ["Classic", "Sports", "Smart"];

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: tabs.length);
  }

  @override
  Widget build(BuildContext context) {
    final tabBar = TabBar(
      controller: tabController,
      indicatorColor: Theme.of(context).primaryColor,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(width: 3.0),
        insets: EdgeInsets.symmetric(horizontal: 55.0),
      ),
      labelColor: Theme.of(context).primaryColor,
      labelStyle: TextStyle(fontSize: 22.0, fontFamily: AppFonts.primaryFont),
      unselectedLabelColor: Theme.of(context).primaryColor.withOpacity(0.3),
      tabs: tabs.map((tabName) => Tab(text: tabName)).toList(),
    );

    final tabBarView = Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        margin: EdgeInsets.only(top: 30.0),
        child: TabBarView(
          controller: tabController,
          children: <Widget>[ProductList(), ProductList(), ProductList()],
        ),
      ),
    );

    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[tabBar, tabBarView],
        ),
      ),
    );
  }
}
