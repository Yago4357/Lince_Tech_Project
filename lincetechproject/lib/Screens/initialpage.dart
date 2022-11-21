import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Classes/vagas.dart';

///Initial Page of myApp
class InitialPage extends StatelessWidget {

  @override
  StatelessElement createElement() {

    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Vagas()),
      ],
      child: const InitialPage(),
    );
    return super.createElement();
  }

  ///Initial Page constructor of myApp
  const InitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child:
        Consumer<Vagas>(
        builder: ((context, vaga, child)
    =>
        Column(
          children: [
            Form(
              child: TextFormField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  vaga.att(value);
                },
              ),
            ),
            Text('${vaga.vagas}'),
          ],
        )
        ),
    )
    ,
    );
  }
}
