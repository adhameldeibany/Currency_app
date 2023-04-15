import 'package:animate_do/animate_do.dart';
import 'package:changemoney/Home/currency_screen.dart';
import 'package:changemoney/Stock/stock_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 4),(){
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => StockScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff010100),
        body: ElasticInUp(
          duration: Duration(seconds: 3),
          // delay: Duration(seconds: 2),
          child: Image(
            image: AssetImage("assets/splash.png"),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
        )
    );
  }
}
