import 'package:flutter/material.dart';
import 'package:sad_lib/CustomWidgets.dart';
import '../Utils/Colors.dart' as colors;

class AddQuoteScreen extends StatefulWidget {
  @override
  _AddQuoteScreenState createState() => _AddQuoteScreenState();
}

class _AddQuoteScreenState extends State<AddQuoteScreen> {
  Size _size;

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
                            padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0, bottom: MediaQuery.of(context).viewInsets.bottom),
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: [
                                TextView(
                                  text: "Add Your Quote",
                                  size: 24.0,
                                  fontWeight: FontWeight.w400,
                                  color: colors.white,
                                  letterSpacing: -1.2,
                                  align: TextAlign.center,
                                  padding: EdgeInsets.only(top: 2.5),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20.0),
                                  child: Image.asset("assets/notebook.png"),
                                ),
                                _textFields(),
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
              child: Column(
                children: [
                  TextView(
                    text: "A short ad will play after",
                    size: 16.0,
                    fontWeight: FontWeight.w400,
                    color: colors.lightGrey,
                    letterSpacing: -1.2,
                    align: TextAlign.center,
                  ),
                  ButtonView(
                    width: _size.width,
                    onPressed: () {},
                    child: TextView(
                      text: "Add To Live",
                      size: 18.0,
                      fontWeight: FontWeight.w500,
                      color: colors.white,
                      align: TextAlign.center,
                    ),
                    color: colors.primary,
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 20.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          autocorrect: true,
          textInputAction: TextInputAction.newline,
          textCapitalization: TextCapitalization.sentences,
          textAlignVertical: TextAlignVertical.center,
          scrollPhysics: BouncingScrollPhysics(),
          toolbarOptions: ToolbarOptions(cut: true, copy: true, selectAll: true, paste: true),
          keyboardType: TextInputType.multiline,
          minLines: null,
          maxLines: null,
          maxLength: 256,
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.w400,
            color: colors.lightGrey,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: colors.darkGrey,
            hintText: "Enter Quote",
            hintStyle: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w400,
              color: colors.lightGrey,
            ),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: colors.primary)),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: colors.lightGrey)),
            contentPadding: EdgeInsets.all(10.0),
          ),
        ),
        SizedBox(height: 20.0,),
        TextField(
          autocorrect: true,
          textInputAction: TextInputAction.next,
          textCapitalization: TextCapitalization.words,
          textAlignVertical: TextAlignVertical.center,
          scrollPhysics: BouncingScrollPhysics(),
          toolbarOptions: ToolbarOptions(cut: true, copy: true, selectAll: true, paste: true),
          keyboardType: TextInputType.name,
          minLines: null,
          maxLines: null,
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.w400,
            color: colors.lightGrey,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: colors.darkGrey,
            hintText: "Enter your name",
            hintStyle: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w400,
              color: colors.lightGrey,
            ),
            counterStyle: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              color: colors.lightGrey,
            ),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: colors.primary)),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: colors.lightGrey)),
            contentPadding: EdgeInsets.all(10.0),
          ),
        ),
        SizedBox(height: 10.0,),
        TextView(
          text: "If left blank it will be saved as anonymous",
          size: 16.0,
          fontWeight: FontWeight.w400,
          color: colors.red,
          letterSpacing: -1.2,
          align: TextAlign.center,
        ),
      ],
    );
  }
}
