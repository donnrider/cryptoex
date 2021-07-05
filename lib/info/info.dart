import 'package:flutter/material.dart';

// ignore: unused_import
import '../CoinCard.dart';

// ignore: camel_case_types
class info extends StatelessWidget {
//......
  final String img1 = "image/coin1.png";
  final String img2 = "image/ex1.png";
  final String img3 = "image/deve1.png";
  final String h1 = "Crypto currency";
  final String h2 = "Exchange Rate";
  final String h3 = "Develop BY Winai.K";
  final String d1 = "Api : www.coingecko.com";
  final String d2 = "Api : www.currencyconverterapi.com";
  final String d3 = "Email : winai1994@windowslive.com";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.grey[300],
        title: Text(
          "Crypto X",
          style: TextStyle(
              color: Colors.grey[900],
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 100,
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
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
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
                      height: 60,
                      width: 60,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(img1),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                h1,
                                style: TextStyle(
                                  color: Colors.grey[900],
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              d1,
                              style: TextStyle(
                                color: Colors.grey[900],
                                fontSize: 20,
                              ),
                            )
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          ),

          ///pad1

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 100,
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
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
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
                      height: 60,
                      width: 60,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(img2),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                h2,
                                style: TextStyle(
                                  color: Colors.grey[900],
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              d2,
                              style: TextStyle(
                                color: Colors.grey[900],
                                fontSize: 20,
                              ),
                            )
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          ),

          ///pad2

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 100,
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
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
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
                      height: 60,
                      width: 60,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(img3),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                h3,
                                style: TextStyle(
                                  color: Colors.grey[900],
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              d3,
                              style: TextStyle(
                                color: Colors.grey[900],
                                fontSize: 20,
                              ),
                            )
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
