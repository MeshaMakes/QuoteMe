import 'package:flutter/material.dart';
import 'package:sad_lib/CustomWidgets.dart';
import '../Utils/Colors.dart' as colors;

class ViewQuoteScreen extends StatefulWidget {
  @override
  _ViewQuoteScreenState createState() => _ViewQuoteScreenState();
}

class _ViewQuoteScreenState extends State<ViewQuoteScreen> {
  @override
  Widget build(BuildContext context) {
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
                    title: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.arrow_back_ios_rounded, size: 30.0, color: colors.white,),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate.fixed([
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            padding: EdgeInsets.all(10.0),
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: [
                                TextView(
                                  text: "Love Quotes",
                                  size: 24.0,
                                  fontWeight: FontWeight.w400,
                                  color: colors.white,
                                  letterSpacing: -1.2,
                                  align: TextAlign.center,
                                  padding: EdgeInsets.only(top: 2.5),
                                ),
                                TextView(
                                  text: "You know you're in love when you can't fall asleep because reality is finally better than your dreams.",
                                  size: 24.0,
                                  fontWeight: FontWeight.w300,
                                  color: colors.white,
                                  letterSpacing: -1.2,
                                  align: TextAlign.center,
                                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 5),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ]),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ButtonView(
                    onPressed: () {},
                    child: Icon(Icons.favorite_border, size: 40.0, color: colors.white,),
                    padding: EdgeInsets.all(5.0),
                    margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                  ),
                  ButtonView(
                    onPressed: () {},
                    child: Icon(Icons.share, size: 40.0, color: colors.primary,),
                    padding: EdgeInsets.all(5.0),
                    margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
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

