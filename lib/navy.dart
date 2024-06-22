import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:global_central/africa.dart';

class SoftHost extends StatefulWidget {
  const SoftHost({super.key});

  @override
  State<SoftHost> createState() => _SoftHostState();
}

class _SoftHostState extends State<SoftHost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        centerTitle: true,
        title: const Text("Africa's Clock"),
      ),
      bottomNavigationBar: BottomNavigationBar(onTap: (value) {}, items: const [
        BottomNavigationBarItem(
            label: 'Clock',
            icon: Icon(
              CupertinoIcons.clock,
            )),
        BottomNavigationBarItem(
            label: 'Weather',
            icon: Icon(
              CupertinoIcons.cloud,
            )),
        BottomNavigationBarItem(
            label: 'Settings',
            icon: Icon(
              CupertinoIcons.settings,
            ))
      ]),
      body: PageView(children: const [
        Africa(),
      ]),
    );
  }
}
