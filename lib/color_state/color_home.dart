import 'package:flutter/material.dart';
import 'package:flutter_bloc_practice/color_state/color_event.dart';

class ColorHome extends StatefulWidget {
  const ColorHome({super.key});

  @override
  State<ColorHome> createState() => _ColorHomeState();
}

class _ColorHomeState extends State<ColorHome> {
  ColorBloc color = ColorBloc();

  @override
  void dispose() {
    super.dispose();
    color.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              color.eventSink.add(ColorEvent.toAmber);
            },
            backgroundColor: Colors.amber,
          ),
          SizedBox(width: 16),
          FloatingActionButton(
            onPressed: () {
              color.eventSink.add(ColorEvent.toLightBlue);
            },
            backgroundColor: Colors.lightBlue,
          ),
          SizedBox(width: 16),
          FloatingActionButton(
            onPressed: () {
              color.eventSink.add(ColorEvent.toRed);
            },
            backgroundColor: Colors.red,
          ),
        ],
      ),
      body: StreamBuilder(
        stream: color.stateStream,
        initialData: Colors.amber,
        builder: (context, snapshot) {
          return AnimatedContainer(
            duration: Duration(milliseconds: 300),
            width: 100,
            height: 100,
            color: snapshot.data,
          );
        },
      ),
    );
  }
}
