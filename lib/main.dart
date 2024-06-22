import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:global_central/splasher.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        scaffoldBackgroundColor: CupertinoColors.systemGroupedBackground,
        primaryColor: CupertinoColors.activeBlue,
        appBarTheme: const AppBarTheme(
            backgroundColor: CupertinoColors.systemMint,
            foregroundColor: Colors.white)),
    home: const Splashing(),
  ));
}
