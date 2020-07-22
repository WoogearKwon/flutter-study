import 'dart:convert';
import 'package:http/http.dart'  as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinApiUrl = 'https://rest.coinapi.io/v1/exchangerate';

/// you can get your own apiKey for free from here: [https://www.coinapi.io/pricing?apikey]
/// note: Free version covers only 100 requests within 24 hours.
const coinApiKey = 'CC125999-7DA4-4F35-B3C4-7BDD134A6676';

class CoinData {
  Future getCoinData(String selectedCurrency) async {

    Map<String, String> cryptoPrices = {};
    for (String crypto in cryptoList) {

      String requestURL = '$coinApiUrl/$crypto/$selectedCurrency?apikey=$coinApiKey';
      http.Response response = await http.get(requestURL);

      if (response.statusCode == 200) {
        var decodeData = jsonDecode(response.body);
        double lastPrice = decodeData['rate'];

        cryptoPrices[crypto] = lastPrice.toStringAsFixed(0);

      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }
    return cryptoPrices;
  }
}
