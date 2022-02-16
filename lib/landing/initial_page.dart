import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(10),
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Stack(
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  'Welcome to',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  'ForeCa',
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  child: Text('Stay in charge of your money'),
                ),
                Spacer(),
                SizedBox(
                  height: size.height * 0.2,
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Engage and Trade',
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontSize: 30),
                      )),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(left: size.width * 0.2),
                  child: Image.asset(
                    'assets/images/market.png',
                    scale: 5,
                  ),
                ),
                Spacer(),
                SizedBox(
                  height: size.height * 0.2,
                ),
                if (!kIsWeb)
                  SizedBox(
                    width: size.width,
                    height: size.height * 0.1,
                    child: Column(
                      children: [
                        Text('Swipe->'),
                        SizedBox(
                          width: size.width * 0.3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              Container(
                                height: 10,
                                width: 10,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ],
                          ),
                        ),
                        Spacer()
                      ],
                    ),
                  )
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
