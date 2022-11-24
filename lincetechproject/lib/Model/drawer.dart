import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Drawer(
      backgroundColor: Colors.blue,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: MaterialButton(
              height: 50,
              minWidth: 250,
              onPressed: () async {},
              child: const Text('Preço por Hora'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: MaterialButton(
              height: 50,
              onPressed: () async {},
              child: SizedBox(
                width: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                  Align(
                    alignment: Alignment.center,
                      child: Icon(Icons.add_chart)),
                  Text('N de vagas'),
                ]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: MaterialButton(
              height: 50,
              minWidth: 250,
              onPressed: () async {},
              child: const Text('Listagem Estadias'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: MaterialButton(
              height: 50,
              minWidth: 250,
              onPressed: () async {},
              child: const Text('Rendimentos'),
            ),
          ),
        ],
      ),
    );
  }
}
