import 'dart:math';

import 'package:bmi_calculater/bmi_result_screen.dart';
import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  bool isMale=true;
  double height=180;
  double weight=40;
  double age=20;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title:const Text("BMI Calculater") ),
      body: Column(children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale=true;

                    });

                  },
                  child: Container(

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: isMale? Colors.deepPurple[300]:Colors.grey ,
                    ),

                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.male,size: 70,),
                        SizedBox(height: 15),
                        Text("Male",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20,),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale=false;
                    });
                  },
                  child: Container(

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: !isMale? Colors.deepPurple[300]: Colors.grey,
                    ),

                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.female,size: 70,),
                        SizedBox(height: 15),
                        Text("Female",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
              color: Colors.grey),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                const Text("Height",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                Row(crossAxisAlignment: CrossAxisAlignment.baseline,
                  mainAxisAlignment: MainAxisAlignment.center,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                  Text("${height.round()}",style: const TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
                  const SizedBox(width: 5,),
                  const Text("CM",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

                ],),
                Slider(value: height,
                    max: 220.0,
                    min: 80.0,
                    onChanged: (value) {
                      setState(() {
                        height=value;
                      });
                    },),

              ]),
            ),
          ),

        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                      color: Colors.grey),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    const Text("Wegiht",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                    Text("${weight.round()}",style: const TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      FloatingActionButton(
                        heroTag: 'weight--',
                        onPressed: () {
                          setState(() {
                            weight--;
                          });
                        },
                        mini: true,
                        child: const Icon(Icons.remove),),
                      FloatingActionButton(
                        heroTag: 'weight++',
                        onPressed: () {
                          setState(() {
                            weight++;
                          });
                        },
                        mini: true,
                        child: const Icon(Icons.add),),
                    ],)


                  ],),
                ),
              ),
              const SizedBox(width: 20,),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                      color: Colors.grey),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    const Text("Age",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                    Text("$age",style: const TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      FloatingActionButton(
                        heroTag: 'age--',

                        onPressed: () {
                          setState(() {
                            age--;
                          });
                        },
                        mini: true,
                        child: const Icon(Icons.remove),),
                      FloatingActionButton(
                        heroTag: 'age++',
                        onPressed: () {
                          setState(() {
                            age++;
                          });
                        },
                        mini: true,
                        child: const Icon(Icons.add),),
                    ],)


                  ],),
                ),
              ),
            ],),
          )
        ),
        Container(
          width: double.infinity,
            color: Colors.red,
            child: MaterialButton(
              height: 50,
              onPressed: () {
                double result=weight / pow(height/100, 2);

                Navigator.push(context,
                    MaterialPageRoute(
                      builder:(context) =>  BmiResult(
                          age: age,
                      isMale: isMale,
                      result: result),));
              },
              child: const Text("Calculate",
                  style:TextStyle(color: Colors.white) ),)),


      ]),
    ));
  }
}
