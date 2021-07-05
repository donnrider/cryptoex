import 'dart:async';
import 'dart:convert';
import 'package:cryptoexchangerate/CoinModel.dart';
import 'package:cryptoexchangerate/exchange_rate/ExchangeRate.dart';
import 'package:cryptoexchangerate/info/info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'CoinCard.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<Coin>> fetchCoin() async {
    var url =
        "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<dynamic> values = [];
      values = json.decode(response.body);
      if (values.length > 0) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];
            coinList.add(Coin.fromJson(map));
            apiData = Coin.fromJson(map);
          }
        }
        setState(() {
          // ignore: unnecessary_statements
          coinList;
          // ignore: unnecessary_statements
          apiData;
        });
      }
      return coinList;
    } else {
      throw Exception("API NOT WORKING");
    }
  }

  @override
  void initState() {
    fetchCoin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Colors.grey[300],
        title: Text(
          "Crypto EX",
          style: TextStyle(
              color: Colors.grey[900],
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ExchangeRate();
              }));
            },
            icon: Icon(Icons.calculate_outlined),
            color: Colors.black,
            iconSize: 45,
          ),
        ],
      ),
      // ignore: unnecessary_null_comparison
      body: apiData == null
          ? Center(
              child: SpinKitCircle(
              color: Colors.black,
              size: 80,
            ))
          : ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: coinList.length,
              itemBuilder: (context, index) {
                return CoinCard(
                  name: coinList[index].name,
                  symbol: coinList[index].symbol,
                  imageUrl: coinList[index].imageUrl,
                  price: coinList[index].price.toDouble(),
                  change: coinList[index].change.toDouble(),
                  changePercentage: coinList[index].changePercentage.toDouble(),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return info();
          }));
        },
        child: Icon(Icons.message),
        backgroundColor: Colors.grey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
