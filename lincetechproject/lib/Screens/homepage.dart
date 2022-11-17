import 'package:flutter/material.dart';

///Initial Screen Class
class MyHomePage extends StatelessWidget {
  ///Title show in my Initial Screen
  final String title;

  ///Initial Screen Construct
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(seconds: 2),
                      color: const Color.fromRGBO(217, 217, 217, 0.4),
                      height: 144,
                      width: 158,
                      child: Material(
                        color: const Color.fromRGBO(217, 217, 217, 0.4),
                        child: InkWell(
                          onTap: () {},
                          child: const Text('Preço p Hora'),
                        ),
                      ),
                    ),
                    AnimatedContainer(
                      duration: const Duration(seconds: 2),
                      color: const Color.fromRGBO(217, 217, 217, 0.4),
                      height: 144,
                      width: 158,
                      child: Material(
                        color: const Color.fromRGBO(217, 217, 217, 0.4),
                        child: InkWell(
                          onTap: () {},
                          child: const Text('N de Vagas'),
                        ),
                      ),
                    ),
                  ],
                ),
                AnimatedContainer(
                  duration: const Duration(seconds: 2),
                  color: const Color.fromRGBO(217, 217, 217, 0.4),
                  width: 158,
                  height: 314,
                  child: Material(
                    color: const Color.fromRGBO(217, 217, 217, 0.4),
                    child: InkWell(
                      onTap: () {},
                      child: const Text('Listagem Estadias'),
                    ),
                  ),
                )
              ],
            ),
            AnimatedContainer(
              color: const Color.fromRGBO(217, 217, 217, 0.4),
              duration: const Duration(seconds: 2),
              width: 346,
              height: 139,
              child: Material(
                color: const Color.fromRGBO(217, 217, 217, 0.4),
                child: InkWell(
                  onTap: () {},
                  child: const Text('Rendimentos'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
