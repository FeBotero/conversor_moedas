import 'package:conversor_moedas/app/controllers/home_controllers.dart';
import 'package:conversor_moedas/app/models/currency_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();

  final homeController = HomeController(toText: toText, fromText: fromText);

  test("Deve converter de real para dolar", () {
    toText.text = "2.0";
    homeController.converte();
    expect(fromText.text, "0.36");
  });
  test("Deve converter de Euro para real", () {
    toText.text = "2.0";
    homeController.toCurrency = Currencymodel(
        name: ' Euro', real: 6.62, dolar: 1.17, euro: 1.0, bitcoin: 0.00010);
    homeController.fromCurrency = Currencymodel(
        name: 'Real', real: 1.0, dolar: 0.18, euro: 0.15, bitcoin: 0.000016);
    homeController.converte();
    expect(fromText.text, "13.24");
  });
}
