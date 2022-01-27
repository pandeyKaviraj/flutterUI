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
final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.asset(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          'No. ${imgList.indexOf(item)} image',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();

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
  int current = 0;
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
                padding: EdgeInsets.only(top: 10),
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
              Expanded(
                child: CarouselSlider.builder(
                  itemCount: imgList.length,
                  carouselController: _controller,
                  options: CarouselOptions(
                      aspectRatio: 2.0,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          current = index;
                        });
                      }),
                  itemBuilder: (ctx, index, realIdx) {
                    return Container(
                      child: Text(index.toString()),
                    );
                  },
                ),
              ),
              SmoothPageIndicator(
                  // PageController
                  count: 3,
                  // activeIndex:,
                  controller: controller,
                  effect: WormEffect(
                      paintStyle: PaintingStyle.stroke,
                      strokeWidth: 5,
                      dotColor: Colors.white,
                      dotHeight: 16,
                      dotWidth: 16,
                      type: WormType.thin,
                      activeDotColor: Colors.orange), // your preferred effect
                  onDotClicked: (index) {}),

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
