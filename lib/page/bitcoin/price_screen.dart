import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:startupnamer/page/bitcoin/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'AUD';

  Map<String, String> coinValues = {};
  bool isWaiting = false;
  
  void getData() async {
    isWaiting = true;
    try {
      Map<String, String> data = await CoinData().getCoinData(selectedCurrency);
      isWaiting = false;
      
      setState(() {
        coinValues = data;
      });
    } catch (e) {
      print(e);
    }
  }

  DropdownButton<String> androidDropDownButton() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
          getData();
        });
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = [];
    TextStyle style = TextStyle(color: Colors.white);

    for (String currency in currenciesList) {
      Text currencyText = Text(currency, style: style);
      pickerItems.add(currencyText);
    }

    return CupertinoPicker(
        itemExtent: 32.0,
        onSelectedItemChanged: (selectedIndex) {
          setState(() {
            selectedCurrency = currenciesList[selectedIndex];
            getData();  
          });
        },
        children: pickerItems
    );
  }

  Widget getPickerFromPlatform() {
    return Platform.isIOS ? iOSPicker() : androidDropDownButton();
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                cryptoCard(
                  cryptoCurrency: 'BTC',
                  selectedCurrency: selectedCurrency
                ),
                cryptoCard(
                    cryptoCurrency: 'ETH',
                    selectedCurrency: selectedCurrency
                ),
                cryptoCard(
                    cryptoCurrency: 'LTC',
                    selectedCurrency: selectedCurrency
                )
              ],
            )
          ),
          Container(
              height: 150.0,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 30.0),
              color: Colors.lightBlue,
              /// you'll get a picker or dropdownButton automatically that  matches your device.
//              child: Platform.isIOS ? iOSPicker() : androidDropDownButton()
              /// but I prefer cupertino picker
              child: iOSPicker()
          ),
        ],
      ),
    );
  }

  Card cryptoCard({String cryptoCurrency, String selectedCurrency}) {
    String value = isWaiting ? '?' : coinValues[cryptoCurrency];
    
    return Card(
      color: Colors.lightBlueAccent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
        child: Text(
          '1 $cryptoCurrency = $value $selectedCurrency',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}