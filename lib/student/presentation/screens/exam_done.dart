import 'package:flutter/material.dart';

class ExamDone extends StatelessWidget {
  const ExamDone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Four Containers Screen'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.blue,
                    child: Center(
                      child: Text('Container 1'),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.green,
                    child: Center(
                      child: Text('Container 2'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.yellow,
                    child: Center(
                      child: Text('Container 3'),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.orange,
                    child: Center(
                      child: Text('Container 4'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
