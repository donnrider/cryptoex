import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  Future<List<String>> getCurrencies() async {
    var currencyUrl =
        "https://free.currconv.com/api/v7/currencies?apiKey=4f41315528d5c137b7b5";
    final res = await http.get(Uri.parse(currencyUrl));

    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);
      var list = body["results"];
      List<String> currencies = (list.keys).toList();
      return currencies;
    } else {
      throw Exception("API NOT WORKING");
    }
  }

  /// function cal exchange rate

  Future<double> getRate(String? from, String? to) async {
    var rateUrl =
        // ignore: unnecessary_brace_in_string_interps
        "https://free.currconv.com/api/v7/convert?q=${from}_${to}&compact=ultra&apiKey=4f41315528d5c137b7b5";

    final res = await http.get(Uri.parse(rateUrl));
    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);
      // ignore: unnecessary_brace_in_string_interps
      return body["${from}_${to}"];
    } else {
      throw Exception("API NOT WORKING");
    }
  }
}
