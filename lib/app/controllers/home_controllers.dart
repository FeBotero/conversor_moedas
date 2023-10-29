import 'package:conversor_moedas/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class HomeController {
  late List<Currencymodel> currencies;
  final TextEditingController toText;
  final TextEditingController fromText;

  late Currencymodel toCurrency;
  late Currencymodel fromCurrency;

  HomeController({required this.toText, required this.fromText}) {
    //Instanciando variaveis
    currencies = Currencymodel.getCurrencies();
    toCurrency = currencies[0];
    fromCurrency = currencies[1];
  }

  void converte() {
    String text = toText.text;
    double value = double.tryParse(text) ?? 1.0;
    double returnvalue = 0;

    if (fromCurrency.name == 'Real') {
      returnvalue = value * toCurrency.real;
    } else if (fromCurrency.name == 'Dolar') {
      returnvalue = value * toCurrency.dolar;
    } else if (fromCurrency.name == 'Euro') {
      returnvalue = value * toCurrency.euro;
    } else if (fromCurrency.name == 'Bitcoin') {
      returnvalue = value * toCurrency.bitcoin;
    }

    fromText.text = returnvalue.toStringAsFixed(2);
  }
}
