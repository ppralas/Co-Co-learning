import 'package:flutter/material.dart';

class DraggableColumns extends StatefulWidget {
  @override
  _DraggableColumnsState createState() => _DraggableColumnsState();
}

class _DraggableColumnsState extends State<DraggableColumns> {
  List<String> sourceItems = ['Item 1', 'Item 2', 'Item 3'];
  List<String> targetItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Draggable Columns'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildDraggableColumn(sourceItems, 'Source'),
          _buildDragTargetColumn(targetItems, 'Target'),
        ],
      ),
    );
  }

  Widget _buildDraggableColumn(List<String> items, String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title),
        const SizedBox(height: 16),
        for (var item in items)
          Draggable<String>(
            data: item,
            feedback: Container(
              width: 100,
              height: 50,
              color: Colors.blue.withOpacity(0.5),
              child: Center(
                child: Text(item),
              ),
            ),
            childWhenDragging: Container(
              width: 100,
              height: 50,
              color: Colors.grey,
              child: Center(
                child: Text(item),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 100,
                height: 50,
                color: Colors.blue,
                child: Center(
                  child: Text(item),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildDragTargetColumn(List<String> items, String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title),
        const SizedBox(height: 16),
        DragTarget<String>(
          builder: (context, candidateData, rejectedData) {
            return Container(
              width: 300,
              height: 100,
              color: Colors.grey,
              child: const Center(
                child: Text('Drop here'),
              ),
            );
          },
          onWillAccept: (data) {
            return true;
          },
          onAccept: (data) {
            setState(() {
              sourceItems.remove(data);
              targetItems.add(data);
            });
          },
        ),
        const SizedBox(height: 16),
        for (var item in items)
          Container(
            width: 100,
            height: 50,
            color: Colors.green,
            child: Center(
              child: Text(item),
            ),
          ),
      ],
    );
  }
}
