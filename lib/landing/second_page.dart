import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(10),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: size.height,
            padding: EdgeInsets.all(10),
            child: Stack(
              children: [
                SingleChildScrollView(
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
                          child: Text('Stay in control'),
                        ),
                        SizedBox(
                          height: size.height * 0.1,
                        ),
                        SizedBox(
                          height: size.height * 0.1,
                          child: Container(
                              alignment: Alignment.centerLeft,
                              child: SizedBox(
                                width: size.width * 0.8,
                                child: Text(
                                  'Track your stocks and more',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(fontSize: 30),
                                ),
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: size.width * 0.1),
                          child: Image.asset(
                            'assets/images/puppetbg.png',
                            scale: 1,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.1,
                        ),
                        if (!kIsWeb)
                          SizedBox(
                            width: size.width,
                            height: size.height * 0.1,
                            child: Column(
                              children: [
                                Text('<- Swipe ->'),
                                SizedBox(
                                  width: size.width * 0.3,
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
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer()
                              ],
                            ),
                          )
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
