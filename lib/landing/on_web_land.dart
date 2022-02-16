import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foreca/constants.dart';
import 'package:foreca/home/trade_home.dart';
import 'package:foreca/home/web/trade_home_web.dart';

class OnWebLandingPage extends StatelessWidget {
  const OnWebLandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return LayoutBuilder(builder: (context, constraints) {
      print('Consteer ${constraints.maxWidth}');
      return SizedBox(
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Wrap(
              children: [
                SizedBox(
                  height: size.height * 1.2,
                  width: size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        color: klightButtonColor,
                        child: Column(
                          children: [
                            Text(
                              'ForeCa',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              child: Text('Stay in charge of your money'),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 100),
                      SizedBox(
                        height: size.height * 0.1,
                        child: Container(
                            padding: EdgeInsets.only(
                                left: constraints.maxWidth <= 1200 ? 20 : 100),
                            alignment: Alignment.centerLeft,
                            child: FittedBox(
                              child: Text(
                                'Engage and Trade',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(fontSize: 75),
                              ),
                            )),
                      ),
                      Spacer(),
                      constraints.maxWidth <= 1200
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                      left: constraints.maxWidth <= 1200
                                          ? 20
                                          : 100),
                                  width: constraints.maxWidth <= 1200
                                      ? size.width
                                      : size.width * 0.3,
                                  child: Text(
                                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 11200s,\n when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(fontSize: 20),
                                  ),
                                ),
                                SizedBox(height: 30),
                                Stack(
                                  children: [
                                    ClipPath(
                                      clipper: BackgroundClipper(),
                                      child: Container(
                                        width: size.width * 0.6,
                                        height: size.height * 0.3,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              klightButtonColor,
                                              Colors.deepOrangeAccent
                                            ],
                                            begin: Alignment.topRight,
                                            end: Alignment.bottomLeft,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: size.width * 0.2),
                                      child: Image.asset(
                                        'assets/images/market.png',
                                        scale: 3,
                                      ),
                                    ),
                                    SizedBox(height: 30),
                                  ],
                                ),
                              ],
                            )
                          : Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 100),
                                  width: size.width * 0.3,
                                  child: Text(
                                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 11200s,\n when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(fontSize: 20),
                                  ),
                                ),
                                Stack(
                                  children: [
                                    ClipPath(
                                      clipper: BackgroundClipper(),
                                      child: Container(
                                        width: size.width * 0.6,
                                        height: size.height * 0.3,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              klightButtonColor,
                                              Colors.deepOrangeAccent
                                            ],
                                            begin: Alignment.topRight,
                                            end: Alignment.bottomLeft,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: size.width * 0.2),
                                      child: Image.asset(
                                        'assets/images/market.png',
                                        scale: 3,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                      Spacer(),
                      SizedBox(
                        height: size.height * 0.2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Wrap(
              children: [
                SizedBox(
                  height: constraints.maxWidth <= 1200
                      ? size.height * 1.3
                      : size.height,
                  width: size.width,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          color: klightButtonColor,
                          height: size.height * 0.1,
                          child: SizedBox(
                            child: Text(
                              'Track your stocks and more',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(fontSize: 30),
                            ),
                          ),
                        ),
                        SizedBox(height: 100),
                        SizedBox(
                          height: size.height * 0.1,
                          child: Container(
                              padding: EdgeInsets.only(
                                  left: constraints.maxWidth <= 1200
                                      ? 20
                                      : size.width * 0.65),
                              alignment: Alignment.centerLeft,
                              child: FittedBox(
                                child: Text(
                                  'Stay in control',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(fontSize: 75),
                                ),
                              )),
                        ),
                        Spacer(),
                        constraints.maxWidth <= 1200
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      ClipPath(
                                        clipper: BackgroundClipper(),
                                        child: Container(
                                          width: size.width * 0.6,
                                          height: size.height * 0.3,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                klightButtonColor,
                                                Colors.deepOrangeAccent
                                              ],
                                              begin: Alignment.topRight,
                                              end: Alignment.bottomLeft,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: size.width * 0.2),
                                        child: Image.asset(
                                          'assets/images/puppetbg.png',
                                          scale: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 100),
                                    width: constraints.maxWidth <= 1200
                                        ? size.width
                                        : size.width * 0.3,
                                    child: Text(
                                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 11200s,\n when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6!
                                          .copyWith(fontSize: 20),
                                    ),
                                  ),
                                ],
                              )
                            : Row(
                                children: [
                                  Stack(
                                    children: [
                                      ClipPath(
                                        clipper: BackgroundClipper(),
                                        child: Container(
                                          width: size.width * 0.6,
                                          height: size.height * 0.3,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                klightButtonColor,
                                                Colors.deepOrangeAccent
                                              ],
                                              begin: Alignment.topRight,
                                              end: Alignment.bottomLeft,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: size.width * 0.2),
                                        child: Image.asset(
                                          'assets/images/puppetbg.png',
                                          scale: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 100),
                                    width: size.width * 0.3,
                                    child: Text(
                                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 11200s,\n when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6!
                                          .copyWith(fontSize: 20),
                                    ),
                                  ),
                                ],
                              ),
                        Spacer(),
                        SizedBox(
                          height: size.height * 0.2,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Wrap(
              children: [
                SizedBox(
                  height: constraints.maxWidth <= 1200
                      ? size.height * 1.2
                      : size.height,
                  width: size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        color: klightButtonColor,
                        height: size.height * 0.1,
                        child: SizedBox(
                          child: Text(
                            'Its your capital',
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(fontSize: 30),
                          ),
                        ),
                      ),
                      SizedBox(height: 100),
                      SizedBox(
                        height: size.height * 0.1,
                        child: Container(
                            padding: EdgeInsets.only(
                                left: constraints.maxWidth <= 1200 ? 20 : 100),
                            alignment: Alignment.centerLeft,
                            child: FittedBox(
                              child: Text(
                                'Bull or Bear \nthe power is yours',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(fontSize: 75),
                              ),
                            )),
                      ),
                      Spacer(),
                      constraints.maxWidth <= 1200
                          ? Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                      left: constraints.maxWidth <= 1200
                                          ? 20
                                          : 100),
                                  width: constraints.maxWidth <= 1200
                                      ? size.width
                                      : size.width * 0.3,
                                  child: Text(
                                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 11200s,\n when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(fontSize: 20),
                                  ),
                                ),
                                Stack(
                                  children: [
                                    ClipPath(
                                      clipper: BackgroundClipper(),
                                      child: Container(
                                        width: size.width * 0.6,
                                        height: size.height * 0.3,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              klightButtonColor,
                                              Colors.deepOrangeAccent
                                            ],
                                            begin: Alignment.topRight,
                                            end: Alignment.bottomLeft,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: size.width * 0.2),
                                      child: Image.asset(
                                        'assets/images/puppetbg.png',
                                        scale: 1,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          : Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                      left: constraints.maxWidth <= 1200
                                          ? 20
                                          : 100),
                                  width: constraints.maxWidth <= 1200
                                      ? size.width
                                      : size.width * 0.3,
                                  child: Text(
                                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 11200s,\n when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(fontSize: 20),
                                  ),
                                ),
                                Stack(
                                  children: [
                                    ClipPath(
                                      clipper: BackgroundClipper(),
                                      child: Container(
                                        width: size.width * 0.6,
                                        height: size.height * 0.3,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              klightButtonColor,
                                              Colors.deepOrangeAccent
                                            ],
                                            begin: Alignment.topRight,
                                            end: Alignment.bottomLeft,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: size.width * 0.2),
                                      child: Image.asset(
                                        'assets/images/puppetbg.png',
                                        scale: 1,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                      Spacer(),
                      SizedBox(
                        height: size.height * 0.2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.1,
              width: size.width * 0.3,
              child: ElevatedButton(
                  onPressed: () {
                    kIsWeb
                        ? Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TradeHomeWeb()))
                        : Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TradeHome()));
                  },
                  child: Text(
                    'Let\'s Trade',
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontSize: 20),
                  )),
            ),
            SizedBox(
              height: 100,
            ),
          ],
        )),
      );
    });
  }
}

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var roundnessFactor = 20.0;

    var path = Path();

    path.moveTo(90, size.height * 0.3);
    path.lineTo(size.width - roundnessFactor, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - roundnessFactor);
    path.lineTo(size.width, roundnessFactor * 2);
    path.lineTo(size.width - roundnessFactor, size.height - 200);
    path.lineTo(size.height - roundnessFactor, size.height - 122);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
