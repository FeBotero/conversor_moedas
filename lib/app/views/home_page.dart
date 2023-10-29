import 'package:conversor_moedas/app/components/currencyBox.dart';
import 'package:conversor_moedas/app/controllers/home_controllers.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

List<String> list = <String>['Real', 'Dolar', 'Euro', 'Bitcoin'];

class _HomeViewState extends State<HomeView> {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();
  late HomeController homeController;

  @override
  void initState() {
    super.initState();
    homeController = HomeController(toText: toText, fromText: fromText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding:
                  EdgeInsets.only(top: 100, right: 30, left: 30, bottom: 10),
              child: Column(children: [
                SizedBox(
                  width: 150,
                  height: 150,
                  child: Image.asset('assets/imagens/converte.png'),
                ),
                CurrencyBox(
                  selectCurrency: homeController.toCurrency,
                  controller: toText,
                  items: homeController.currencies,
                  onChanged: (model) {
                    setState(() {
                      homeController.toCurrency = model!;
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CurrencyBox(
                  selectCurrency: homeController.fromCurrency,
                  controller: fromText,
                  items: homeController.currencies,
                  onChanged: (model) {
                    setState(() {
                      homeController.fromCurrency = model!;
                    });
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.amber),
                        minimumSize:
                            MaterialStateProperty.all(const Size(250, 75))),
                    onPressed: () {
                      homeController.converte();
                    },
                    child: const Text(
                      "Converter",
                      style: TextStyle(fontSize: 30),
                    ))
              ]),
            ),
          )
        ],
      ),
    );
  }
}
