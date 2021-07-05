import 'package:cryptoexchangerate/exchange_rate/api_client.dart';
import 'package:cryptoexchangerate/exchange_rate/drop_down.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

class ExchangeRate extends StatefulWidget {
  @override
  _ExchangeRateState createState() => _ExchangeRateState();
}

class _ExchangeRateState extends State<ExchangeRate> {
  ApiClient client = ApiClient();
  List<String>? currencies;
  String? from;
  String? to;
  //variable exchabge rate
  double? rate;
  String result = "";
  String sameval = "2 same rates can not work";
  String notsame = "Result";
  String exlogo = "image/ex1.png";

  @override
  void initState() {
    super.initState();
    (() async {
      List<String> list = await client.getCurrencies();
      setState(() {
        currencies = list;
      });
    })();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: Colors.grey[300],
          title: Text(
            "Crypto EX",
            style: TextStyle(
                color: Colors.grey[900],
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: currencies == null
            ? Center(
                child: SpinKitCircle(
                color: Colors.black,
                size: 80,
              ))
            : SafeArea(
                child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        "Currency convert",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 36,
                            fontWeight: FontWeight.bold),
                      ),
                    ),

                    /// img_set

                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade500,
                                  offset: Offset(4, 4),
                                  blurRadius: 18,
                                  spreadRadius: 1),
                              BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(-4, -4),
                                  blurRadius: 18,
                                  spreadRadius: 1)
                            ]),
                        height: 150,
                        width: 250,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Image.asset(exlogo),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Column(
                        children: [
                          Text(
                            to == from ? sameval : notsame,
                            style: TextStyle(
                              color: to == from ? Colors.red : Colors.black,
                              fontSize: to == from ? 20.0 : 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            result,
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 35.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Expanded(
                        child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              customDropDown(currencies, from, (val) {
                                setState(() {
                                  from = val;
                                });
                              }),
                              FloatingActionButton(
                                onPressed: () {
                                  String temp = from!;
                                  setState(() {
                                    from = to;
                                    to = temp;
                                  });
                                },
                                child: Icon(Icons.swap_horiz),
                                elevation: 0.0,
                                backgroundColor: Colors.black,
                              ),
                              customDropDown(currencies, to, (val) {
                                setState(() {
                                  to = val;
                                });
                              }),
                            ],
                          ),

                          /// exsam1
                          SizedBox(
                            height: 20.0,
                          ),
                          //textfeild
                          TextField(
                            onSubmitted: (value) async {
                              rate = await client.getRate(from, to);
                              setState(() {
                                double? data = double.parse(value);
                                result =
                                    "${NumberFormat("#,###.##").format(rate! * data)}";
                              });
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Input your rates value..",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20.0,
                                  color: Colors.black),
                            ),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                          ),
                        ],
                      ),
                    ))
                  ],
                ),
              )));
  }
}
