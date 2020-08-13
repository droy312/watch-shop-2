import 'package:flutter/material.dart';
import 'package:watch_shop_2/watch.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

// 56, 72, 129
class _HomePageState extends State<HomePage> {
  Color white = Colors.white;
  Color kPrimaryColor = Color.fromRGBO(56, 72, 129, 1);
  Color lightGrey = Colors.grey[400];

  int currentIndex = 0;

  Size ds = Size(0.0, 0.0);

  List<Color> smallDotColors = List.generate(5, (i) {
    if (i >= 3) {
      return Colors.grey[300];
    } else {
      return Colors.orange[300];
    }
  });

  List names1 = ['White Drop-D', 'Vintage 18-D'];
  List prices1 = [150, 260];
  List images1 = ['images/watch1.jpg', 'images/watch2.jpg'];
  List tags1 = [0, 1];

  List names2 = ['Black Metal-C', 'Navy Blue S'];
  List prices2 = [360, 120];
  List images2 = ['images/watch3.jpg', 'images/watch4.jpg'];
  List tags2 = [2, 3];

  List names3 = ['Pink Gold', 'Black Cat'];
  List prices3 = [570, 420];
  List images3 = ['images/watch5.jpg', 'images/watch6.jpg'];
  List tags3 = [4, 5];

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

  // --------------- USING -----------------

  // Side Bar

  Widget pageSelecter() {
    return Container(
      height: getHeight(300),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = 0;
              });
            },
            child: RotatedBox(
              quarterTurns: 3,
              child: Container(
                child: Text(
                  'Top Pick',
                  style: style(
                      currentIndex == 0 ? kPrimaryColor : lightGrey, 16, true),
                ),
              ),
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 400),
            width: 4,
            height: currentIndex == 0 ? 30 : 0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: Colors.orange[300],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = 1;
              });
            },
            child: RotatedBox(
              quarterTurns: 3,
              child: Container(
                child: Text(
                  'Tea Time',
                  style: style(
                      currentIndex == 1 ? kPrimaryColor : lightGrey, 16, true),
                ),
              ),
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 400),
            width: 4,
            height: currentIndex == 1 ? 30 : 0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: Colors.orange[300],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = 2;
              });
            },
            child: RotatedBox(
              quarterTurns: 3,
              child: Container(
                child: Text(
                  'Fun Time',
                  style: style(
                      currentIndex == 2 ? kPrimaryColor : lightGrey, 16, true),
                ),
              ),
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 400),
            width: 4,
            height: currentIndex == 2 ? 30 : 0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: Colors.orange[300],
            ),
          ),
        ],
      ),
    );
  }

  Widget sideBar() {
    return Container(
      width: getWidth(80),
      decoration: BoxDecoration(
          border:
              Border(right: BorderSide(color: Colors.grey[200], width: 1.5))),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: getHeight(40)),
            height: getHeight(35),
            width: getWidth(35),
            alignment: Alignment.center,
            child: Image.asset('images/ea.png', fit: BoxFit.fitWidth),
          ),
          Spacer(),
          pageSelecter(),
          Spacer(),
          Container(
            margin: EdgeInsets.only(bottom: 30),
            child: Icon(Icons.more_vert, size: 50, color: kPrimaryColor),
          ),
        ],
      ),
    );
  }

  // Main content

  Widget watchCard(String name, int price, String image, tag) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  WatchPage(name: name, price: price, image: image, tag: tag),
            ));
      },
      child: Container(
        margin: EdgeInsets.only(
            right: getWidth(30), top: getHeight(20), bottom: getHeight(35)),
        height: getHeight(300),
        width: getWidth(160),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(getWidth(10), getHeight(10)),
              blurRadius: getHeight(25),
            ),
          ],
          //color: Colors.grey[100],
          color: white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: getHeight(164),
              width: getWidth(144),
              padding: EdgeInsets.all(getWidth(8)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(getWidth(8)),
                color: Colors.white,
              ),
              child: Hero(
                tag: tag,
                child: Image.asset(image, fit: BoxFit.fitHeight),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, top: 20),
              alignment: Alignment.centerLeft,
              child: Text(name, style: style(kPrimaryColor, 16, false)),
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.only(left: 15),
              alignment: Alignment.centerLeft,
              child: Text('\$ ' + price.toString(),
                  style: style(kPrimaryColor, 18, true)),
            ),
            Spacer(),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    width: getWidth(70),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                          5,
                          (index) => Container(
                                width: 7,
                                height: 7,
                                decoration: BoxDecoration(
                                    color: smallDotColors[index],
                                    shape: BoxShape.circle),
                              )),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 15),
                    width: 35,
                    height: 35,
                    padding: EdgeInsets.all(6),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.red[100],
                            offset: Offset(3, 3),
                            blurRadius: 6,
                          ),
                        ]),
                    child: Icon(Icons.favorite, color: white, size: 13),
                  ),
                ],
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Widget collectionImageCard(String image, String name) {
    return Container(
      width: (ds.width - getHeight(80 + 30 + 30 + 30.0)) / 2,
      margin: EdgeInsets.only(bottom: getHeight(20)),
      child: Stack(
        children: <Widget>[
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(image, fit: BoxFit.contain),
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Text(name,
                        style: style(kPrimaryColor, 13, true)
                            .copyWith(letterSpacing: 5)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget mainContainer() {
    return Container(
      height: ds.height,
      width: ds.width - getWidth(80),
      margin: EdgeInsets.only(top: getHeight(40)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: getWidth(20)),
            width: double.infinity,
            alignment: Alignment.centerRight,
            child: Container(
              width: getWidth(90),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(Icons.search, color: kPrimaryColor, size: 30),
                  Icon(Icons.add_shopping_cart, color: kPrimaryColor, size: 30),
                ],
              ),
            ),
          ),
          SizedBox(height: getHeight(60)),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: getWidth(30)),
            child: Text('Products', style: style(kPrimaryColor, 28, false)),
          ),
          Container(
            width: ds.width - getWidth(80),
            height: getHeight(345),
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return SizedBox(width: getWidth(30));
                } else {
                  if (currentIndex == 0) {
                    return watchCard(
                      names1[index - 1],
                      prices1[index - 1],
                      images1[index - 1],
                      tags1[index - 1],
                    );
                  }
                  else if (currentIndex == 1) {
                    return watchCard(
                      names2[index - 1],
                      prices2[index - 1],
                      images2[index - 1],
                      tags2[index - 1],
                    );
                  }
                  else if (currentIndex == 2) {
                    return watchCard(
                      names3[index - 1],
                      prices3[index - 1],
                      images3[index - 1],
                      tags3[index - 1],
                    );
                  }
                }
              },
            ),
          ),
          SizedBox(height: 30),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: getWidth(30), bottom: getHeight(20)),
            child: Text('Collection', style: style(kPrimaryColor, 18, false)),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: getWidth(30), right: getWidth(30)),
              child: Row(
                children: <Widget>[
                  collectionImageCard('images/summer.jpg', 'SUMMER'),
                  Spacer(),
                  collectionImageCard('images/spring.jpg', 'SPRING'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ds = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: white,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          sideBar(),
          mainContainer(),
        ],
      ),
    );
  }
}
