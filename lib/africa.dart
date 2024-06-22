import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:global_central/strings.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class Africa extends StatefulWidget {
  const Africa({super.key});

  @override
  State<Africa> createState() => _AfricaState();
}

class _AfricaState extends State<Africa> {
  int current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          width: double.infinity,
          height: 120,
          padding: const EdgeInsets.all(16),
          color: CupertinoColors.systemMint,
          child: SafeArea(
            child: FutureBuilder(
              future: get(Uri.http('worldtimeapi.org',
                  '/api/timezone/Africa/${zones[current]}')),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CupertinoActivityIndicator(
                      color: Colors.white,
                    ),
                  );
                } else if (snapshot.hasData) {
                  var decoded = jsonDecode(snapshot.data!.body);
                  var leo = DateTime.parse(decoded['datetime']);
                  var gap = decoded['utc_offset'];
                  leo =
                      leo.add(Duration(hours: int.parse(gap.substring(1, 3))));
                  var leoWeekly = decoded["day_of_week"];
                  String leof = DateFormat('dd-MM-yyyy').format(leo);

                  String sahivi = DateFormat('HH:mm').format(leo);
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              zones[current],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 24),
                            ),
                            Column(
                              children: [
                                Text(
                                  "Day $leoWeekly this week,",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                Text(
                                  "Day ${decoded['day_of_year']} this year,",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                Text(
                                  "Week ${decoded['week_number']} this year,",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ],
                            )
                          ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "$sahivi ${decoded['abbreviation']}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            leof,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Container(
                    color: CupertinoColors.systemRed,
                    child: Center(
                        child: CupertinoButton(
                            child: const Text(
                              'Trouble with the network\nTap to retry',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              setState(() {});
                            })),
                  );
                } else {
                  return const Center(child: Text("No Data Found"));
                }
              },
            ),
          ),
        ),
        Expanded(
            child: SingleChildScrollView(
          child: CupertinoListSection(
              topMargin: 0,
              children: List.generate(
                  zones.length,
                  (index) => ListTile(
                        onTap: () {
                          setState(() {
                            current = index;
                          });
                        },
                        leading: CircleAvatar(
                            backgroundImage:
                                AssetImage('soft_utils/${zones[index]}.jpg')),
                        selected: current == index ? true : false,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 0),
                        title: Text(zones[index]),
                        trailing: current == index
                            ? const Icon(CupertinoIcons.placemark)
                            : null,
                      ))),
        ))
      ],
    ));
  }
}
