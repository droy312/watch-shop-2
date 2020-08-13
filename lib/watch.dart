import 'dart:math';

import 'package:flutter/material.dart';

class WatchPage extends StatefulWidget {
  final String image;
  final String name;
  final int price;
  final int tag;

  WatchPage({this.image, this.name, this.price, this.tag});

  @override
  _WatchPageState createState() => _WatchPageState();
}

class _WatchPageState extends State<WatchPage> {
  static Color white = Colors.white;
  static Color kPrimaryColor = Color.fromRGBO(56, 72, 129, 1);
  static Color lightGrey = Colors.grey[400];

  Size ds = Size(0.0, 0.0);

  double getWidth(double myWidth) {
    return (myWidth / 411.43) * MediaQuery.of(context).size.width;
  }

  double getHeight(double myHeight) {
    return (myHeight / 774.86) * MediaQuery.of(context).size.height;
  }

  TextStyle style(Color color, double size, bool isBold) {
    return TextStyle(
      color: color,
      fontSize: size,
      fontFamily: 'Muli',
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
    );
  }

  String loremIpsum =
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard.';

  Color btnColor = kPrimaryColor;
  Color btnTextColor = white;

  // ------------- USING --------------

  Widget smallContainer(String title, String text) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title, style: style(Colors.grey[500], 12, true)),
          SizedBox(height: getHeight(5)),
          Text(text, style: style(kPrimaryColor, 18, true)),
        ],
      ),
    );
  }

  Widget favouriteContainer() {
    return Container(
      width: getWidth(60),
      height: getWidth(60),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(getWidth(4), getHeight(4)),
            blurRadius: getWidth(10),
          ),
        ],
      ),
      child: Icon(Icons.favorite, color: Colors.redAccent),
    );
  }

  @override
  Widget build(BuildContext context) {
    ds = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              left: getWidth(20),
              right: getWidth(30),
              top: getHeight(40),
              bottom: getHeight(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios, color: kPrimaryColor, size: 30),
                ),
                Container(
                  width: getWidth(90),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(Icons.search, color: kPrimaryColor, size: 30),
                      Icon(Icons.add_shopping_cart,
                          color: kPrimaryColor, size: 30),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: getWidth(20), bottom: getHeight(10)),
            child: Row(
              children: <Widget>[
                Text('SPECIAL',
                    style: style(Colors.grey[500], 12, true)
                        .copyWith(letterSpacing: 7)),
                SizedBox(width: getWidth(20)),
                Container(
                  width: 60,
                  height: 2.5,
                  decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(.4),
                    borderRadius: BorderRadius.circular(getHeight(2)),
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: getWidth(20), bottom: getHeight(50)),
            child: Text(widget.name, style: style(kPrimaryColor, 28, false)),
          ),
          Container(
            margin: EdgeInsets.only(left: getWidth(40), right: getWidth(40)),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Hero(
                      tag: widget.tag,
                      child: Image.asset(widget.image, fit: BoxFit.contain),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: getHeight(200),
                    margin: EdgeInsets.only(left: getWidth(60)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        smallContainer('PRICE', '\$ ' + widget.price.toString()),
                        smallContainer('COLOR', 'WHITE'),
                        smallContainer('STRAP', 'LEATHER'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    width: ds.width,
                    margin: EdgeInsets.only(top: getHeight(40)),
                    color: kPrimaryColor,
                    padding: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Overview', style: style(white, 20, true)),
                        SizedBox(height: getHeight(10)),
                        Text(loremIpsum,
                            style:
                                style(white, 16, false).copyWith(height: 1.8)),
                        SizedBox(height: getHeight(15)),
                        Expanded(
                          child: GestureDetector(
                            onTapDown: (d) {
                              setState(() {
                                btnColor = white;
                                btnTextColor = kPrimaryColor;
                              });
                            },
                            onTapUp: (d) {
                              setState(() {
                                btnTextColor = white;
                                btnColor = kPrimaryColor;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: ds.width - 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border:
                                    Border.all(color: Colors.white70, width: 1),
                                color: btnColor,
                              ),
                              child: Text('ADD TO CART',
                                  style: style(btnTextColor, 14, true)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: ds.width - 100,
                    child: favouriteContainer(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
