import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';

final themeMode = ValueNotifier(2); //Later can remove this
final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'
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
  final CarouselController _controller = CarouselController();
  var FruitList = [
    'Maths,science concepts & more',
    'Unlimited content',
    'New learning modules every day'
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(top: 10, bottom: 30),
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
                height: 10,
              ),
              //Card widget
              Container(
                // height: 150,
                // width: 400,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Card(
                      elevation: 5,
                      //color: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            width: 100,
                            height: 14,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: AutoSizeText.rich(
                              TextSpan(
                                text: ('RECOMMENDED'),
                              ),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 0.05,
                              ),
                              textAlign: TextAlign.right,
                              maxLines: 1,
                            ),
                            alignment: AlignmentDirectional.topStart,
                          ),
                        ],
                      ),
                    ),
                    Card(
                      elevation: 5,
                      //color: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextButton(
                        child: Column(
                          children: [
                            Text('12'),
                            Text('months'),
                            Text('₹499'),
                            Text('(or₹1/day)'),
                          ],
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Card(
                      elevation: 5,
                      //color: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextButton(
                        child: Column(
                          children: [
                            Text('12'),
                            Text('months'),
                            Text('₹499'),
                            Text('(or₹1/day)'),
                          ],
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 120,
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
