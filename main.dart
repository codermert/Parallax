import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Parallax",
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double rateZero = 0;
  double rateOne = 0;
  double rateTwo = 0;
  double rateThree = 0;
  double rateFour = 0;
  double rateFive = 0;
  double rateSix = 0;
  double rateSeven = 0;
  double rateEight = 90;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff210002),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: NotificationListener<ScrollNotification>(
        onNotification: (v) {
          if (v is ScrollUpdateNotification) {
            setState(() {
              // v.scrollDelta null olamaz, ama yine de güvenli şekilde kullanıyoruz
              final delta = v.scrollDelta ?? 0.0;
              rateEight -= delta / 1;
              rateSeven -= delta / 1.5;
              rateSix -= delta / 2;
              rateFive -= delta / 2.5;
              rateFour -= delta / 3;
              rateThree -= delta / 3.5;
              rateTwo -= delta / 4;
              rateOne -= delta / 4.5;
              rateZero -= delta / 5;
            });
          }
          return true; // bool döndürmeli
        },
        child: Stack(
          children: <Widget>[
            ParallaxWidget(top: rateZero, asset: "parallax0"),
            ParallaxWidget(top: rateOne, asset: "parallax1"),
            ParallaxWidget(top: rateTwo, asset: "parallax2"),
            ParallaxWidget(top: rateThree, asset: "parallax3"),
            ParallaxWidget(top: rateFour, asset: "parallax4"),
            ParallaxWidget(top: rateFive, asset: "parallax5"),
            ParallaxWidget(top: rateSix, asset: "parallax6"),
            ParallaxWidget(top: rateSeven, asset: "parallax7"),
            ParallaxWidget(top: rateEight, asset: "parallax8"),
            ListView(
              children: <Widget>[
                Container(
                  height: 800,
                  color: Colors.transparent,
                ),
                Container(
                  color: const Color(0xff210002),
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 60, bottom: 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "Parallax In",
                        style: TextStyle(
                            fontSize: 32,
                            fontFamily: "Montserrat-ExtraLight",
                            letterSpacing: 2.0,
                            color: Color(0xffffaf00)),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        width: 100,
                        height: 1,
                        color: const Color(0xffffaf00),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        "Flutter",
                        style: TextStyle(
                            fontSize: 48,
                            fontFamily: "Montserrat-Regular",
                            letterSpacing: 2.0,
                            color: Color(0xffffaf00)),
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        "Made By",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Montserrat-ExtraLight",
                          letterSpacing: 1.5,
                          color: Color(0xffffaf00),
                        ),
                      ),
                      const Text(
                        "codermert",
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: "Montserrat-Regular",
                          letterSpacing: 2.0,
                          color: Color(0xffffaf00),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ParallaxWidget extends StatelessWidget {
  final double top;
  final String asset;
  const ParallaxWidget({
    Key? key,
    required this.top,
    required this.asset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: -80,
      top: top,
      child: SizedBox(
        height: 900,
        width: MediaQuery.of(context).size.width + 160,
        child: Image.asset("assets/$asset.png", fit: BoxFit.cover),
      ),
    );
  }
}
