import 'package:changemoney/Stock/stock_screen.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CurrencyScreen extends StatefulWidget {
  @override
  State<CurrencyScreen> createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  TextEditingController n3 = TextEditingController();
  TextEditingController n4 = TextEditingController();

  List<String> currency = ["EUR", "USD", "EGP"];

  String selectValue = "USD";
  String selectValue2 = "USD";

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.account_balance,color: Colors.orange,),
            SizedBox(
              width: 8,
            ),
            Text('CURRENCY',
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
            Text(' RATE',
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
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => StockScreen()));
                },
                child: Icon(
                  Icons.currency_exchange_outlined,
                  color: Colors.white,
                  size: 25,
                )),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            children: [
              SizedBox(height: 8,),
              Text('From',
              style: TextStyle(
                fontSize: 22,
                color: Colors.orange,
                fontWeight: FontWeight.bold
              ),
              ),
              SizedBox(height: 5,),
              DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isExpanded: true,
                  items: currency
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Center(
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 22,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                  value: selectValue,
                  onChanged: (value) {
                    setState(() {
                      selectValue = value as String;
                    });
                  },
                  buttonStyleData: ButtonStyleData(
                    height: 60,
                    width: 370,
                    padding: const EdgeInsets.only(left: 14, right: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: Colors.black26,
                      ),
                    ),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_forward_ios_outlined,
                    ),
                    iconSize: 16,
                  ),
                  dropdownStyleData: DropdownStyleData(
                      maxHeight: 200,
                      width: 370,
                      padding: null,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      elevation: 8,
                      offset: const Offset(-20, 0),
                      scrollbarTheme: ScrollbarThemeData(
                        radius: const Radius.circular(40),
                        thickness: MaterialStateProperty.all(10),
                        thumbVisibility: MaterialStateProperty.all(true),
                      )),
                  menuItemStyleData: const MenuItemStyleData(
                    height: 40,
                    padding: EdgeInsets.only(left: 14, right: 14),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text('To',
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 5,),
              DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isExpanded: true,
                  items: currency
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Center(
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 22,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ))
                      .toList(),
                  value: selectValue2,
                  onChanged: (value) {
                    setState(() {
                      selectValue2 = value as String;
                    });
                  },
                  buttonStyleData:  ButtonStyleData(
                    height: 60,
                    width: 370,
                    padding: const EdgeInsets.only(left: 14, right: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.black26,
                      ),
                    ),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_forward_ios_outlined,
                    ),
                    iconSize: 16,
                  ),
                  dropdownStyleData: DropdownStyleData(
                      maxHeight: 200,
                      width: 370,
                      padding: null,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      elevation: 8,
                      offset: const Offset(-20, 0),
                      scrollbarTheme: ScrollbarThemeData(
                        radius: const Radius.circular(40),
                        thickness: MaterialStateProperty.all(6),
                        thumbVisibility: MaterialStateProperty.all(true),
                      )),
                  menuItemStyleData: const MenuItemStyleData(
                    height: 40,
                    padding: EdgeInsets.only(left: 14, right: 14),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                child: TextField(
                  style: TextStyle(fontSize: 22),
                  controller: n3,
                  decoration: InputDecoration(
                      labelText: "Amount",
                      hintText: "Enter Amount",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  height: 70,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.orange,
                  ),
                  child: MaterialButton(
                      child: Text(
                        'CHANGE',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      onPressed: () {
                        String Coin1 = selectValue;
                        String Coin2 = selectValue2;
                        double third = 1;
                        double Amount = double.parse(n3.text.toString());

                        if (Amount == 0) {
                          n4.text = "0";
                        } else if (Coin1 == "USD") {
                          if (Coin2 == "EUR") {
                            third = Amount * 30.64;
                            Amount = (Amount * 1.11).toDouble();
                            n4.text = Amount.toStringAsFixed(1);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("EGP = ${third.toStringAsFixed(1)}"),
                                duration: Duration(seconds: 10),
                              ),
                            );
                          }
                          if (Coin2 == "EGP") {
                            third = Amount * 1.11;
                            Amount = (Amount * 30.64).toDouble();
                            n4.text = Amount.toStringAsFixed(1);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("EUR = ${third.toStringAsFixed(1)}"),
                                duration: Duration(seconds: 10),
                              ),
                            );
                          }
                        } else if (Coin1 == "EUR") {
                          if (Coin2 == "USD") {
                            third = Amount * 33.99;
                            Amount = (Amount / 1.11).toDouble();
                            n4.text = Amount.toStringAsFixed(1);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("EGP = ${third.toStringAsFixed(1)}"),
                                duration: Duration(seconds: 10),
                              ),
                            );
                          }
                          if (Coin2 == "EGP") {
                            third = Amount / 1.11;
                            Amount = (Amount * 33.99).toDouble();
                            n4.text = Amount.toStringAsFixed(1);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("USD = ${third.toStringAsFixed(1)}"),
                                duration: Duration(seconds: 10),
                              ),
                            );
                          }
                        } else if (Coin1 == "EGP") {
                          if (Coin2 == "EUR") {
                            third = Amount / 30.64;
                            Amount = (Amount / 33.99).toDouble();
                            n4.text = Amount.toStringAsFixed(1);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("USD = ${third.toStringAsFixed(1)}"),
                                duration: Duration(seconds: 10),
                              ),
                            );
                          }
                          if (Coin2 == "USD") {
                            third = Amount / 33.99;
                            Amount = (Amount / 30.64).toDouble();
                            n4.text = Amount.toStringAsFixed(1);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("EUR = ${third.toStringAsFixed(1)}"),
                                duration: Duration(seconds: 10),
                              ),
                            );
                          }
                        } else {
                          n4.text = "UNDEFIND";
                        }
                      }),
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5)),
                child: TextField(
                  style: TextStyle(fontSize: 25,
                      color: Colors.green[900],
                    fontWeight: FontWeight.bold
                  ),
                  enabled: false,
                  controller: n4,
                  decoration: InputDecoration(
                      labelText: "Equivalent Amount",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
