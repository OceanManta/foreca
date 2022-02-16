import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foreca/home/trade_home.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      child: SafeArea(
        child: Container(
          height: size.height,
          padding: EdgeInsets.all(10),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  height: size.height,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ForeCa',
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          child: Text('Its your capital'),
                        ),
                        SizedBox(height: 100),
                        SizedBox(
                          height: size.height * 0.1,
                          child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Bull or Bear the power is yours',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(fontSize: 30),
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: size.width * 0.1),
                          child: Image.asset(
                            'assets/images/bullbg.png',
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.2,
                        ),
                        SizedBox(
                          width: size.width,
                          height: size.height * 0.1,
                          child: Column(
                            children: [
                              Text('<-Swipe'),
                              SizedBox(
                                width: size.width * 0.25,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: 10,
                                      width: 10,
                                      color: Colors.white,
                                    ),
                                    Container(
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                    Container(
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => TradeHome()));
                                  },
                                  child: Text('Let\'s Trade')),
                              Spacer()
                            ],
                          ),
                        )
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
