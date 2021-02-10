import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sad_lib/CustomWidgets.dart';
import '../Utils/Colors.dart';

// ignore: must_be_immutable
class AboutScreen extends StatelessWidget {

  ColorsClass _colors = ColorsClass();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: _colors.bg,
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
                    backgroundColor: _colors.bg,
                    elevation: 0.0,
                    forceElevated: true,
                    floating: true,
                    pinned: true,
                    title: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.arrow_back_ios_rounded, size: 30.0, color: _colors.white,),
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
                                  text: "About",
                                  size: 24.0,
                                  fontWeight: FontWeight.w400,
                                  color: _colors.white,
                                  letterSpacing: -1.2,
                                  align: TextAlign.center,
                                  padding: EdgeInsets.only(top: 5.0),
                                ),
                                TextView(
                                  text: "A basic app used to fetch each quote and share with a friend or loved one, Quote Me gives you the user the opportunity to share your own personal quotes for persons to share with others!",
                                  size: 24.0,
                                  fontWeight: FontWeight.w300,
                                  color: _colors.white,
                                  letterSpacing: -1.2,
                                  align: TextAlign.center,
                                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 5),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: TextView(
                              text: "Version 1.0",
                              size: 18.0,
                              fontWeight: FontWeight.w400,
                              color: _colors.white,
                              letterSpacing: -1.2,
                              padding: EdgeInsets.only(bottom: 10.0, right: 10.0),
                            ),
                          ),
                        ],
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
}
