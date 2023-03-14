import 'package:flutter/material.dart';
import 'package:skola/presentation/widgets/sumChecker.dart';

class ScreenSplitter extends StatelessWidget {
  const ScreenSplitter({super.key});

//Gumbic za rotaciju ekrana za 90 stupnjeva i gumbic na svaki kontenjer koji postoji
//kreatinvo razmisljanje - kako se logirati i kako poslati podatke s weba i kako s tableta poslati podatke, koje se vrijdnosti love i komunikacija kako dobiti podatke koji su vec zakucani u bazu

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              RotatedBox(
                                quarterTurns: 4,
                                child: Container(
                                  color: Colors.red,
                                  child: IconButton(
                                    icon: const Icon(Icons.rotate_left),
                                    onPressed: () {},
                                  ),
                                ),
                              ),
                              const Center(
                                child: RandomNumberChallenge(),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Stack(
                            children: [
                              Container(
                                color: Colors.green,
                              ),
                              const Center(
                                  child: Text(
                                '2+3 = ',
                                style: TextStyle(fontSize: 30),
                              )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            color: Colors.blue,
                          ),
                          const Center(
                              child: Text(
                            '2+3 = ',
                            style: TextStyle(fontSize: 30),
                          )),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            color: Colors.yellow,
                          ),
                          const Center(
                              child: Text(
                            '2+3 = ',
                            style: TextStyle(fontSize: 30),
                          )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
