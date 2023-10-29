import 'package:conversor_moedas/app/models/currency_model.dart';
import 'package:flutter/material.dart';

// const List<String> list = <String>['Real', 'Dolar', 'Euro', 'Bitcoin'];

class CurrencyBox extends StatelessWidget {
  final List<Currencymodel> items;
  final Currencymodel selectCurrency;
  final TextEditingController controller;
  final void Function(Currencymodel? model)? onChanged;

  CurrencyBox(
      {key,
      required this.items,
      required this.controller,
      required this.onChanged,
      required this.selectCurrency});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 56,
            child: DropdownButton<Currencymodel>(
              value: selectCurrency,
              iconEnabledColor: Colors.amber,
              isExpanded: true,
              underline: Container(
                height: 1,
                color: Colors.amber,
              ),
              items: items
                  .map((e) => DropdownMenuItem(value: e, child: Text(e.name)))
                  .toList(),
              onChanged: onChanged,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 2,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber)),
            ),
          ),
        )
      ],
    );
  }
}
