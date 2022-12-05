import 'package:flutter/material.dart';

import '../Widgets/drawer.dart';

///Initial Screen Class
class HomePage extends StatelessWidget {
  ///Initial Screen Construct
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const DrawerWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 314,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(seconds: 2),
                      height: 144,
                      width: 158,
                      child: ElevatedButton(
                        onPressed: () async {
                          await Navigator.pushNamed(context, '/StayList');
                        },
                        child: const Center(
                          child: Text(
                            'Preço p/ Hora',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    AnimatedContainer(
                      duration: const Duration(seconds: 2),
                      height: 144,
                      width: 158,
                      child: ElevatedButton(
                        onPressed: () async {
                          await Navigator.pushNamed(context, '/StayList');
                        },
                        child: const Center(
                          child: Text(
                            'N de Vagas',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              AnimatedContainer(
                duration: const Duration(seconds: 2),
                width: 158,
                height: 314,
                child: ElevatedButton(
                  onPressed: () async {
                    await Navigator.pushNamed(context, '/StayList');
                  },
                  child: const Center(
                    child: Text(
                      'Listagem Estadias',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ],
          ),
          AnimatedContainer(
            color: Colors.blue,
            duration: const Duration(seconds: 2),
            width: 346,
            height: 139,
            child: ElevatedButton(
              onPressed: () async {
                await Navigator.pushNamed(context, '/StayList');
              },
              child: const Center(
                child: Text(
                  'Rendimentos',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
