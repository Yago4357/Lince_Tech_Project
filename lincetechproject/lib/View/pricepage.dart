import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Controller/priceprovider.dart';
import '../Widgets/drawer.dart';

class PricePage extends StatelessWidget {
  const PricePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PriceProvider(),
      child: Consumer<PriceProvider>(builder: (_, price, __) {
        return Scaffold(
          appBar: AppBar(),
          drawer: const DrawerWidget(),
          body: Table(
            children: [
              TableRow(children: [
                Column(
                  children: [
                    Text('${price.prices}'),
                  ],
                )
              ])
            ],
          ),
        );
      }),
    );
  }

  ///Card for the ListView builder
  Widget cardCar(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PriceProvider(),
      child: Consumer<PriceProvider>(builder: (_, price, __) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, top: 4.0),
                  child: Table(
                    children: [
                      TableRow(children: [Text('')]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
