import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sad_lib/CustomWidgets.dart';
import '../Utils/Colors.dart' as colors;

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> with SingleTickerProviderStateMixin {
  Size _size;
  TabController tabController;

  @override
  void initState() {
    tabController = TabController(initialIndex: 0, length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Material(
      color: colors.bg,
      child: SafeArea(
        child: DefaultTabController(
          length: 5,
          child: Scaffold(
            backgroundColor: colors.bg,
            body: NestedScrollView(
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    leading: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.arrow_back_ios_rounded, size: 25.0, color: colors.white,),
                    ),
                    pinned: true,
                    floating: false,
                    centerTitle: true,
                    backgroundColor: colors.bg,
                    title: TextView(
                      text: "Favorites",
                      size: 24.0,
                      fontWeight: FontWeight.w400,
                      color: colors.white,
                      letterSpacing: -1.2,
                      align: TextAlign.center,
                      padding: EdgeInsets.only(top: 2.5,),
                    ),
                    bottom: TabBar(
                      isScrollable: true,
                      indicatorSize: TabBarIndicatorSize.label,
                      labelPadding: EdgeInsets.symmetric(horizontal: 20.0),
                      indicatorColor: colors.primary,
                      labelColor: colors.primary,
                      unselectedLabelColor: colors.lightGrey,
                      indicatorWeight: 5.0,
                      indicatorPadding: EdgeInsets.only(bottom: 5.0),
                      tabs: [
                        Tab(text: "All",),
                        Tab(text: "Love",),
                        Tab(text: "Happy",),
                        Tab(text: "Life",),
                        Tab(text: "Random",),
                      ],
                    ),
                  ),
                ];
              },
              body: TabBarView(
                children: [
                  all(),
                  love(),
                  happy(),
                  life(),
                  random()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _showPopupNotebookMenu() {
    return PopupMenuButton<int>(
      color: colors.bg,
      onSelected: (i) {
        if(i == 0) {
          //rename func
          print("0");
        } else {
          //delete notebook func
          print("1");
        }
      },
      offset: Offset(0, 0),
      padding: EdgeInsets.all(0.0),
      child: Icon(Icons.more_vert,
        size: 30.0,
        color: colors.white,
      ),
      itemBuilder: (context) => [
        PopupMenuItem<int>(
          value: 0,
          child: TextView(text: 'Share', color: colors.white, size: 15.0,),
        ),
        PopupMenuItem<int>(
          value: 1,
          child: TextView(text: 'Delete', color: colors.red, size: 15.0,),
        ),
      ],
    );
  }

  Widget _quoteCard({bool showOptions = true}) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: colors.darkGrey,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextView(
              text: "A friend is someone who knows all about you and still loves you.",
              size: 15.0,
              color: colors.white,
              fontWeight: FontWeight.w400,
              align: TextAlign.left,
            ),
          ),
          if(showOptions == true)
            _showPopupNotebookMenu()
        ],
      ),
    );
  }

  Widget all() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(10.0),
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          for(int i = 0; i < 2; i++)
            _quoteCard(showOptions: false),
        ],
      ),
    );
  }

  Widget love() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(10.0),
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          for(int i = 0; i < 2; i++)
            _quoteCard(),
        ],
      ),
    );
  }

  Widget happy() {
    return Container(
      alignment: Alignment.center,
      child: TextView(
        text: "My Guy",
        color: colors.white,
        size: 20.0,
      ),
    );
  }

  Widget life() {
    return Container(
      alignment: Alignment.center,
      child: TextView(
        text: "Bruh",
        color: colors.white,
        size: 20.0,
      ),
    );
  }

  Widget random() {
    return Container(
      alignment: Alignment.center,
      child: TextView(
        text: "Sigh",
        color: colors.white,
        size: 20.0,
      ),
    );
  }
}
