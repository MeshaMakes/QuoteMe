import 'package:flutter/material.dart';
import 'package:quoteme/Screens/AboutScreen.dart';
import 'package:quoteme/Screens/LiveSceen.dart';
import 'package:quoteme/Screens/ViewQuoteScreen.dart';
import 'package:sad_lib/CustomWidgets.dart';
import '../Utils/Colors.dart' as colors;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Size _size;

  final List<Map> _categories = [
    {
      "image" : "https://images.unsplash.com/photo-1516589178581-6cd7833ae3b2?ixid=MXwxMjA3fDB8MHxzZWFyY2h8M3x8bG92ZXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
      "title" : "Love Quotes",
      "desc" : "Browse through our series of love quotes, never run out of ways to express yourself",
    },
    {
      "image" : "https://images.unsplash.com/photo-1590698933947-a202b069a861?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mzd8fGhhcHB5fGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
      "title" : "Happy Quotes",
      "desc" : "Come and explore many quotes to soothe your needs of happiness",
    },
    {
      "image" : "https://images.unsplash.com/photo-1518462592603-0b6bac106032?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGxpZmV8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
      "title" : "Life Quotes",
      "desc" : "Life is so hard to explain sometimes.. Thar’s where this category comes in",
    },
    {
      "image" : "https://images.unsplash.com/photo-1571397872194-0ad8fbafe058?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8cHV6emxlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
      "title" : "Random Quotes",
      "desc" : "Not sure how to express how you feel? We’re here for you, just tap",
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  void _showPopupMenu(){
    showMenu<String>(
      context: context,
      //position where you want to show the menu on screen
      position: RelativeRect.fromLTRB(25.0, 55.0, 15.0, 0.0),
      items: [
        PopupMenuItem<String>(
            child: Row(
              children: [
                Icon(Icons.favorite_border_outlined, size: 30.0, color: colors.primary,),
                SizedBox(width: 10.0,),
                Text('Favorites'),
              ],
            ), value: '0'),
        PopupMenuItem<String>(
            child: Row(
              children: [
                Icon(Icons.info_outline, size: 30.0, color: colors.primary,),
                SizedBox(width: 10.0,),
                Text('About'),
              ],
            ), value: '1'),
      ],
      elevation: 8.0,
    ).then<void>((String itemSelected) {
      if (itemSelected == null) return;

      if(itemSelected == "0"){
        //code here
        print("0");
      }else {
        //code here
        print("1");
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => AboutScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Material(
      color: colors.bg,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CustomScrollView(
                physics: BouncingScrollPhysics(),
                slivers: [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    backgroundColor: colors.bg,
                    elevation: 0.0,
                    forceElevated: true,
                    floating: true,
                    pinned: true,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextView(
                          text: "Quote Me",
                          size: 22.0,
                          fontWeight: FontWeight.w600,
                          color: colors.white,
                          letterSpacing: -1.1,
                        ),
                        IconButton(
                          onPressed: () {
                            _showPopupMenu();
                          },
                          icon: Icon(Icons.menu_rounded, size: 30.0, color: colors.white,),
                        ),
                      ],
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate.fixed([
                      SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0, top: 20.0),
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextView.rich(
                                  textSpan: [
                                    TextView(
                                      text: "Go ",
                                      size: 20.0,
                                      fontWeight: FontWeight.w400,
                                      color: colors.white,
                                      letterSpacing: -1.2,
                                    ),
                                    TextView(
                                      text: "Live ",
                                      size: 22.0,
                                      fontWeight: FontWeight.w600,
                                      color: colors.white,
                                      letterSpacing: -1.1,
                                    ),
                                    TextView(
                                      text: "with your own quotes!",
                                      size: 20.0,
                                      fontWeight: FontWeight.w400,
                                      color: colors.white,
                                      letterSpacing: -1.2,
                                    ),
                                  ],
                                ),
                                IconButton(
                                  onPressed: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LiveScreen()));
                                  },
                                  icon: Icon(Icons.arrow_forward_ios_rounded, size: 30.0, color: colors.white,),
                                ),
                              ],
                            ),
                            _featuredQuote(),

                            for(int i = 0; i < _categories.length; i++)
                              _category(
                                onPressed: () {
                                  if(i == 0) {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewQuoteScreen()));
                                  }
                                },
                                imgStr: _categories[i]["image"].toString(),
                                title: _categories[i]["title"],
                                desc: _categories[i]["desc"],
                              ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _featuredQuote() {
    return Container(
      margin: EdgeInsets.only(bottom: 60.0, top: 20.0),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: colors.mediumGrey,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: [
          TextView(
            text: "\"I'm selfish, impatient and a little insecure. I make mistakes, I am out of control\"",
            maxLines: 3,
            color: colors.white,
            size: 20.0,
            fontWeight: FontWeight.w400,
            align: TextAlign.center,
            textOverflow: TextOverflow.ellipsis,
            padding: EdgeInsets.only(bottom: 20.0, top: 10.0),
          ),
          TextView(
            text: "― Jane Doe",
            color: colors.primary,
            size: 15.0,
            fontWeight: FontWeight.w400,
            align: TextAlign.center,
            padding: EdgeInsets.only(bottom: 10.0),
          ),
        ],
      ),
    );
  }

  Widget _category({void Function() onPressed, String imgStr, String title, String desc,}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(bottom: 10.0),
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: colors.darkGrey,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Row(
          children: [
            ClipOval(
              child: Image.network(imgStr, width: 70.0, height: 70.0, fit: BoxFit.cover,),
            ),
            SizedBox(width: 10.0,),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    text: title,
                    size: 18.0,
                    color: colors.primary,
                    fontWeight: FontWeight.w600,
                    align: TextAlign.left,
                    padding: EdgeInsets.only(bottom: 5.0),
                  ),
                  TextView(
                    text: desc,
                    size: 12.0,
                    color: colors.white,
                    fontWeight: FontWeight.w400,
                    maxLines: 3,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
