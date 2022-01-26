import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  var FruitList = [
    'Maths,science concepts & more',
    'Unlimited content',
    'New learning modules every day'
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Subscription Plan',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 26,
                fontFamily: 'roboto',
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 40),
              child: CarouselSlider(
                options: CarouselOptions(height: 300),
                items: [
                  'images/img1.png',
                  'images/img2.jpeg',
                  'images/img3.png'
                ].map((i) {
                  return Builder(builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 70.0),
                      child: Column(
                        children: [
                          Image.asset(i),
                          SizedBox(
                            height: 10,
                          ),
                          if (i == 'images/img1.png')
                            Text(
                              FruitList[0],
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'roboto',
                              ),
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.ltr,
                            ),
                          if (i == 'images/img2.jpeg')
                            Text(
                              FruitList[1],
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'roboto',
                              ),
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.ltr,
                            ),
                          if (i == 'images/img3.png')
                            Text(
                              FruitList[2],
                              style: TextStyle(
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.ltr,
                            ),
                        ],
                      ),
                    );
                  });
                }).toList(),
              ),
            ),
            SmoothPageIndicator(
                controller: controller, // PageController
                count: 3,
                effect: WormEffect(
                    paintStyle: PaintingStyle.stroke,
                    strokeWidth: 5,
                    dotColor: Colors.white,
                    dotHeight: 16,
                    dotWidth: 16,
                    type: WormType.thin,
                    activeDotColor: Colors.orange), // your preferred effect
                onDotClicked: (index) {}),
            const SizedBox(
              height: 20,
            ),
            Container(
              child: Text(
                'You can cancel anytime & get full refund',
                style: TextStyle(
                  fontFamily: 'roboto',
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
                textDirection: TextDirection.ltr,
              ),
            )
          ],
        ),
      ),
    );
  }
}
