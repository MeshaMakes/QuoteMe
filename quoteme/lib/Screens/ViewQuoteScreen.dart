import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sad_lib/CustomWidgets.dart';
import '../Utils/Colors.dart' as colors;
import '../Utils/JsonFormat.dart';
import 'package:http/http.dart' as http;
import 'package:share/share.dart';

class ViewQuoteScreen extends StatefulWidget {
  final String quoteType;

  const ViewQuoteScreen({Key key, @required this.quoteType}) : super(key: key);
  @override
  _ViewQuoteScreenState createState() => _ViewQuoteScreenState();
}



class _ViewQuoteScreenState extends State<ViewQuoteScreen> {
  Size _size;
  Future<void> _future;
  PageController pageController;
  String quoteType;

  @override
  void initState() {
    pageController = PageController(keepPage: true);
    quoteType = widget.quoteType;
    super.initState();
    _future = fetchQuotes();
  }

  Future<List<Quotes>> fetchQuotes() async {
    //final response = await http.get(Uri.https('https://zenquotes.io', '/api/quotes/love'));

    var url = Uri.https('www.zenquotes.io', '/api/quotes', {'q': quoteType});
    var response = await http.get(url);
    if(response.statusCode == 200) {
      print(quotesFromJson(response.body).length);
      return quotesFromJson(response.body);
    } else {
      throw Exception('Failed to load quote');
    }
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    print(widget.quoteType);
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
                      text: "Love Quotes",
                      size: 24.0,
                      fontWeight: FontWeight.w400,
                      color: colors.white,
                      letterSpacing: -1.2,
                      align: TextAlign.center,
                      padding: EdgeInsets.only(top: 2.5,),
                    ),
                  ),
                ];
              },
              body: FutureBuilder<List<Quotes>> (
                future: _future,
                builder: (BuildContext context, AsyncSnapshot<List<Quotes>> snapshot) {
                  if(snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                    return buildPageView(snapshot);
                  } if(!snapshot.hasData) {
                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextView(
                            text: snapshot.data == null ? "No Quotes available at this time, try again in a few minutes" : "Please wait awhile for the quotes to load, please don't spam the database",
                            size: 18.0,
                            color: colors.white,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.w400,
                            align: TextAlign.center,
                            padding: EdgeInsets.only(bottom: 20.0),
                          ),
                          if(snapshot.data != null)
                            CustomLoader(
                            color1: colors.primary,
                            color2: Colors.transparent,
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Center(
                      child: CustomLoader(
                        color1: colors.primary,
                        color2: Colors.transparent,
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  PageView buildPageView(AsyncSnapshot<List<Quotes>> snapshot) {
    return PageView.builder(
      controller: pageController,
      itemCount: snapshot.data.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                color: Colors.transparent,
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
                margin: EdgeInsets.only(bottom: 10.0),
                width: double.infinity,
                child: TextView(
                  text: snapshot.data[index].q,
                  size: 20.0,
                  color: colors.white,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w400,
                  align: TextAlign.center,
                ),
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
                    onPressed: () {
                      if(snapshot.data[index].q != null && snapshot.data[index].q.isNotEmpty) {
                        Share.share('Quote Me:\n${snapshot.data[index].q}');
                      }
                    },
                    child: Icon(Icons.share, size: 40.0, color: colors.primary,),
                    padding: EdgeInsets.all(5.0),
                    margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                  ),
                ],
              ),
            ),
          ],
        );
      }
    );
  }
}

