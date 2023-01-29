import 'dart:math';

import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController txtDice = TextEditingController();

  List l1 = [
    "assets/images/dies1.png",
    "assets/images/dies2.png",
    "assets/images/dies3.png",
    "assets/images/dies4.png",
    "assets/images/dies5.png",
    "assets/images/dies6.png",
  ];
  List DiceList = [];
  List rndList = [];
  List dno =[1,2,3,4,5,6];
  int i = 0;
  num sum = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFfff2f2),
        appBar: AppBar(
          title: Text(
            "Dice App",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: [
            SingleChildScrollView(scrollDirection: Axis.horizontal,),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: txtDice,
                decoration: InputDecoration(
                  hintText: "Enter the no of dice ",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black,width: 2),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            InkWell(
              onTap: () {
                var data = txtDice.text;
                int n = int.parse(data);

                DiceList.clear();
                rndList.clear();

                setState(() {
                  for (i = 0; i < n; i++) {
                    DiceList.add(0);
                  }
                });
              },
              child: Container(
                height: 50,
                width: 140,
                color: Colors.black,
                child: Center(
                  child: Text(
                    "Generator",
                    style: TextStyle(color: Colors.white,fontSize: 20),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: DiceList.asMap()
                  .entries
                  .map(
                    (e) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                      l1[rndList.isEmpty ? 0 : rndList[e.key]],
                      height: 100,
                      width: 100),
                ),
              )
                  .toList(),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                var data = txtDice.text;
                int n = int.parse(data);

                var rnd =Random();
                rndList.clear();
                sum=0;
                setState(() {
                  for(i=0;i<n;i++)
                  {
                    int index = rnd.nextInt(6);
                    rndList.add(index);
                  }
                });
                for(i=0;i<n;i++)
                {
                  sum+=dno[rndList[i]];
                }
              },
              child: Container(
                height: 50,
                width: 140,
                color: Colors.black,
                child: Center(
                  child: Text(
                    "Play",
                    style: TextStyle(color: Colors.white,fontSize: 20),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              height:60,
              width: 180,
              child: Center(
                child: Text(
                  "${sum}",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}