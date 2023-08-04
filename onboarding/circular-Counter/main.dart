import 'package:flutter/material.dart';

class CounterDisplay extends StatelessWidget {
  const CounterDisplay({required this.count, super.key});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Text('Count: $count');
  }
}

class CounterIncrementor extends StatelessWidget {
  const CounterIncrementor({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text('+'),
    );
  }
}
class CounterDecrementor extends StatelessWidget{
  CounterDecrementor({required this.onPress,super.key});
  
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context){
    return ElevatedButton(onPressed: onPress, child: const Text("-"));
  }
}

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _increment() {
    setState(() {
      if(_counter == 10){
        _counter = 0;
      }
      else {
        ++_counter;
      }
    });
  }
  void _decrement(){
    setState(() {
      if (_counter == 0){
        _counter = 10;
      }else{

      --_counter;
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SizedBox(width: 16),
        CounterDisplay(count: _counter),
        Row(      mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
    CounterIncrementor(onPressed: _increment),
    const SizedBox(width: 16),
    CounterDecrementor(onPress: _decrement),]
        )
      ],
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Counter(),
        ),
      ),
    ),
  );
}
