import 'package:flutter/material.dart';
import 'package:quoteme/Screens/AddQuoteScreen.dart';
import 'package:sad_lib/CustomWidgets.dart';
import '../Utils/Colors.dart' as colors;

class LiveScreen extends StatefulWidget {
  @override
  _LiveScreenState createState() => _LiveScreenState();
}

class _LiveScreenState extends State<LiveScreen> {
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
                                  text: "Live Quotes",
                                  size: 24.0,
                                  fontWeight: FontWeight.w400,
                                  color: colors.white,
                                  letterSpacing: -1.2,
                                  align: TextAlign.center,
                                  padding: EdgeInsets.only(top: 2.5, bottom: 50.0),
                                ),

                                for(int i = 0; i < 2; i++)
                                  _liveCard(),
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
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(bottom: 20.0, right: 20.0),
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddQuoteScreen()));
                  },
                  backgroundColor: colors.mediumGrey,
                  child: Icon(Icons.add, size: 50.0, color: colors.primary,),
                  elevation: 3.0,
                ),
              )
            ),
          ],
        ),
      ),
    );
  }

  Widget _liveCard() {
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(
                  text: "A friend is someone who knows all about you and still loves you.",
                  size: 18.0,
                  color: colors.white,
                  fontWeight: FontWeight.w600,
                  align: TextAlign.left,
                  padding: EdgeInsets.only(bottom: 5.0),
                ),
                TextView(
                  text: "― Jimmy Don",
                  size: 14.0,
                  color: colors.primary,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ),
          ButtonView(
            onPressed: () {
              print("Clicked");
            },
            child: Icon(Icons.share, size: 30.0, color: colors.white,),
            padding: EdgeInsets.all(5.0),
          ),
        ],
      ),
    );
  }
}
