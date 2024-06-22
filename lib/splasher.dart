import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:global_central/navy.dart';

class Splashing extends StatefulWidget {
  const Splashing({Key? key}) : super(key: key);

  @override
  State<Splashing> createState() => _SplashingState();
}

class _SplashingState extends State<Splashing> {
  final snack = const SnackBar(
    content: Text('some'),
  );
  void initiator() async {
    await Future.delayed(const Duration(seconds: 5));
    push();
  }

  push() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const SoftHost()));
  }

  @override
  void initState() {
    initiator();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SpinKitWave(
        color: Colors.white,
        size: 50.0,
      ),
    );
  }
}
