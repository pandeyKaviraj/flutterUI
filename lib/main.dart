import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/rendering.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';

final themeMode = ValueNotifier(2); //Later can remove this
final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'
];

final List<String> snacksList = [
  'https://png.pngtree.com/element_our/png_detail/20181207/cartoon-pizza-png_263883.jpg',
  'https://atlas-content-cdn.pixelsquid.com/stock-images/coffee-cup-small-red-cartoon-w7JZ738-600.jpg',
  'https://freepngimg.com/thumb/chocolate/7-chocolate-png-image-thumb.png'
];
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  int currentIndex = 0;
  bool isTaped = true;
  bool isTaped2 = true;
  bool isTaped3 = true;
  // handleTap(bool confirmTap) {
  //   setState(() {
  //     isTaped = confirmTap;
  //   });
  // }

  final CarouselController _controller = CarouselController();
  var FruitList = [
    'Maths,science concepts & more',
    'Unlimited content',
    'New learning modules every day'
  ];
  String quote1 = 'CHEAPER THAN A PIZZA';
  String quote2 = 'CHEAPER THAN A CUP OF COFFEE';
  String quote3 = 'CHEAPER THAN A CHOCOLATE';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(top: 20, bottom: 30),
                child: AutoSizeText(
                  'Subscription Plan',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 26,
                      fontFamily: 'roboto',
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  maxLines: 1,
                ),
              ),
              Container(
                height: 200,
                child: CarouselSlider.builder(
                  carouselController: _controller,
                  itemCount: imgList.length,
                  options: CarouselOptions(
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                        });
                      }),
                  itemBuilder: (
                    context,
                    index,
                    realIdx,
                  ) {
                    return Container(
                      height: 170,
                      child: Column(
                        children: [
                          Container(
                            child: Image.network(
                              imgList[index],
                              fit: BoxFit.cover,
                              height: 150,
                              alignment: Alignment.bottomCenter,
                            ),
                          ),
                          Container(
                            alignment: Alignment.bottomCenter,
                            margin: EdgeInsets.only(top: 15),
                            child: AutoSizeText.rich(
                              TextSpan(text: FruitList[index]),
                              style: TextStyle(
                                fontFamily: 'roboto',
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              ),
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                      //Here we can display titles
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: AnimatedSmoothIndicator(
                    activeIndex: currentIndex,
                    count: imgList.length,
                    effect: WormEffect(
                        paintStyle: PaintingStyle.stroke,
                        dotColor: Colors.grey,
                        type: WormType.normal,
                        dotHeight: 10,
                        spacing: 8,
                        dotWidth: 10,
                        activeDotColor: Colors.orange),
                    //Imp Code to revisit
                    onDotClicked: (index) {
                      //_controller.animateToPage can also be used
                      _controller.jumpToPage(index);
                    }),
              ),

              Container(
                child: AutoSizeText.rich(
                  TextSpan(text: 'You can cancel anytime & get full refund'),
                  style: TextStyle(
                    fontFamily: 'roboto',
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.ltr,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //Card widget
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isTaped = false;
                      });
                    },
                    onDoubleTap: () {
                      setState(() {
                        isTaped = true;
                      });
                    },
                    child: Listener(
                      child: Container(
                        height: 160,
                        width: 110,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: isTaped == true ? Colors.white : Colors.yellow,
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(6),
                              bottomLeft: Radius.circular(6)),
                        ),
                        child: Column(
                          children: [
                            Container(
                              //need margin
                              alignment: Alignment.topCenter,
                              width: 95,
                              height: 14,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: isTaped == true
                                    ? Colors.black
                                    : Colors.green,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: AutoSizeText.rich(
                                TextSpan(
                                  text: ('RECOMMENDED'),
                                ),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 1,
                                ),
                                textAlign: TextAlign.right,
                                maxLines: 1,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 8, bottom: 6),
                              child: AutoSizeText.rich(
                                TextSpan(
                                  text: '12',
                                  style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'roboto',
                                      color: Colors.black),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 6),
                              child: AutoSizeText.rich(
                                TextSpan(
                                  text: 'months',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'roboto',
                                    color: Colors.black,
                                  ),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 4),
                              child: AutoSizeText.rich(
                                TextSpan(
                                  text: '₹499',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontFamily: 'roboto',
                                  ),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              child: AutoSizeText.rich(
                                TextSpan(
                                  text: '(or₹1/day)',
                                  style: TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'roboto',
                                    color: Colors.lightGreen,
                                  ),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 12),
                              child: Icon(
                                Icons.check_circle,
                                color: isTaped == true
                                    ? Colors.black
                                    : Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isTaped2 = false;
                      });
                    },
                    onDoubleTap: () {
                      setState(() {
                        isTaped2 = true;
                      });
                    },
                    child: Container(
                      height: 160,
                      width: 110,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: isTaped2 == true ? Colors.white : Colors.yellow,
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 22, bottom: 6),
                            child: AutoSizeText.rich(
                              TextSpan(
                                text: '3',
                                style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'roboto',
                                    color: Colors.black),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 6),
                            child: AutoSizeText.rich(
                              TextSpan(
                                text: 'months',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'roboto',
                                  color: Colors.black,
                                ),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 4),
                            child: AutoSizeText.rich(
                              TextSpan(
                                text: '₹199',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontFamily: 'roboto',
                                ),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            child: AutoSizeText.rich(
                              TextSpan(
                                text: '(or₹2/day)',
                                style: TextStyle(
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'roboto',
                                  color: Colors.black,
                                ),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 12),
                            child: Icon(
                              Icons.check_circle,
                              color: isTaped2 == true
                                  ? Colors.black
                                  : Colors.green,
                            ),
                            alignment: Alignment.bottomCenter,
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isTaped3 = false;
                      });
                    },
                    onDoubleTap: () {
                      setState(() {
                        isTaped3 = true;
                      });
                    },
                    child: Container(
                      height: 160,
                      width: 110,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color:
                              isTaped3 == true ? Colors.white : Colors.yellow,
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(6),
                              bottomRight: Radius.circular(6))),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 22, bottom: 6),
                            child: AutoSizeText.rich(
                              TextSpan(
                                text: '1',
                                style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'roboto',
                                    color: Colors.black),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 8, bottom: 6),
                            child: AutoSizeText.rich(
                              TextSpan(
                                text: 'months',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'roboto',
                                  color: Colors.black,
                                ),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 4),
                            child: AutoSizeText.rich(
                              TextSpan(
                                text: '₹99',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontFamily: 'roboto',
                                ),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 12),
                            child: Icon(
                              Icons.check_circle,
                              color: isTaped3 == true
                                  ? Colors.black
                                  : Colors.green,
                            ),
                            alignment: Alignment.bottomCenter,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 150,
                child: Column(
                  children: [
                    if (isTaped == false)
                      Image.network(
                        snacksList[0],
                        fit: BoxFit.cover,
                        height: 100,
                        alignment: Alignment.topCenter,
                      ),
                    if (isTaped == false) Text(quote1),
                    if (isTaped2 == false)
                      Image.network(
                        snacksList[1],
                        fit: BoxFit.cover,
                        height: 100,
                        alignment: Alignment.topCenter,
                      ),
                    if (isTaped2 == false) Text(quote2),
                    if (isTaped3 == false)
                      Image.network(
                        snacksList[2],
                        fit: BoxFit.cover,
                        height: 100,
                        alignment: Alignment.topCenter,
                      ),
                    if (isTaped3 == false) Text(quote3),
                  ],
                ),
              ),
              Container(
                child: AutoSizeText.rich(
                  TextSpan(text: 'Select a plan of your interest and'),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'roboto',
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.ltr,
                ),
              ),
              SizedBox(
                height: 15,
              ),

              //Button to choose trial
              Container(
                height: 50,
                width: 280,
                margin: EdgeInsets.only(bottom: 14),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFF1353CB),
                      border: Border.all(
                        color: Color(0XFF1353CB),
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: AutoSizeText(
                      'SUBMIT',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                    ),
                    alignment: Alignment.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
