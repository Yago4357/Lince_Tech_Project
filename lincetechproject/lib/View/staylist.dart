import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Controller/carprovider.dart';
import '../Widgets/cardcar.dart';
import '../Widgets/drawer.dart';
import '../Widgets/waveclipper.dart';

///Page for the Stay list
class StayList extends StatelessWidget {
  ///Stay List constructor
  StayList({Key? key}) : super(key: key);

  final ScrollController _firstController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CarProvider(),
      child: Consumer<CarProvider>(builder: (_, car, __) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          drawer: const DrawerWidget(),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipPath(
                clipper: BackgroundWaveClipper(),
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: 200,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 212, 132, 60),
                  ),
                ),
              ),
              ElevatedButton(onPressed: (){
                car.getAll();
              }, child: Icon(Icons.scatter_plot_rounded)),
              Expanded(
                child: RawScrollbar(
                  thumbColor: const Color.fromARGB(255, 212, 132, 60),
                  radius: const Radius.circular(20),
                  thickness: 10,
                  thumbVisibility: false,
                  controller: _firstController,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16.0),
                    controller: _firstController,
                    scrollDirection: Axis.vertical,
                    itemCount: car.stayList.length,
                    itemBuilder: (context, index) =>
                        cardCar(context, index, car.stayList,car),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.00),
                  child: SizedBox(
                    height: 50,
                    width: 250,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(20))),
                        backgroundColor:
                        const Color.fromARGB(255, 212, 132, 60),
                      ),
                      onPressed: () async {
                        car.getAll();
                        await Navigator.pushNamed(context, '/CarPage');
                      },
                      child: const Text('Adicionar novo Carro'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}