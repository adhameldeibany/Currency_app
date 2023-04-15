import 'package:changemoney/Home/currency_screen.dart';
import 'package:changemoney/Network/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StockScreen extends StatefulWidget {
  const StockScreen({Key? key}) : super(key: key);

  @override
  State<StockScreen> createState() => _StockScreenState();
}
class _StockScreenState extends State<StockScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getGoldPrice();
    getSilverPrice();
  }

  @override
  Widget build(BuildContext context) {
    getGoldPrice();
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        backgroundColor: Color(0xff010100),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Icon(Icons.account_balance,color: Colors.orange,),
            SizedBox(
              width: 8,
            ),
             Text('TODAY',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  shadows: [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(
                            1,1
                        ),
                        blurRadius: 5
                    )
                  ]
              ),
            ),
            Text(' PRICE',
              style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  shadows: [
                    BoxShadow(
                        color: Colors.orange[200]!,
                        offset: Offset(
                            1,1
                        ),
                        blurRadius: 5
                    )
                  ]
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Icon(Icons.account_balance,color: Colors.orange,),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CurrencyScreen()));
                },
                child: Icon(
                  Icons.currency_exchange_outlined,
                  color: Colors.white,
                  size: 25,
                )),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(top: 120,),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Color(0xff010100),
            borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Image.asset('assets/gold.png',
                  height: 150,
                  width: 150,
                ),
                Text('GOLD',
                  style: TextStyle(
                      color: Colors.orange,
                      fontSize: 33,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        BoxShadow(
                            color: Colors.orange[300]!,
                            offset: Offset(
                                2,2
                            ),
                            blurRadius: 5
                        )
                      ]
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text('$goldD',
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(width: 6,),
                    Text('EGP',
                      style: TextStyle(
                          color: Colors.green[500],
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                )
              ],
            ),
            Column(
              children: [
                Image.asset('assets/silver.png',
                  height: 150,
                  width: 150,
                ),
                Text('SILVER',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 33,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(
                                2,2
                            ),
                            blurRadius: 5
                        )
                      ]
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text('$silverD',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(width: 6,),
                    Text('EGP',
                      style: TextStyle(
                          color: Colors.green[500],
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  double? goldD;
  int? goldI;

  double? silverD;
  int? silverI;

  getGoldPrice(){
    DioHelper.getData('XAU/EGP/').then((value) {
      setState(() {
        goldD = value.data['price_gram_24k'];
        goldI = goldD!.round();
        print(goldI);
      });
    }).catchError((error){});
  }
  getSilverPrice(){
    DioHelper.getData('XAG/EGP/').then((value) {
      setState(() {
        silverD = value.data['price_gram_24k'];
        silverI = silverD!.round();
        print(silverI);
      });
    }).catchError((error){});
  }
}
