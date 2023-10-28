import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/link.dart';

class BmiResult extends StatelessWidget {
  // const BmiResult({Key? key, required this.result, required this.isMale, required this.age}) : super(key: key);
  final double result;
  final bool isMale;
  final double age;
  const BmiResult({super.key,
    required this.result,
    required this.age,
    required this.isMale,
  });
  @override
  Widget build(BuildContext context) {
    int x= result.round();
    int Age=age.round();
    Color color=Colors.white;
    String text="";
    String uriLink="";
    LottieBuilder animation;
    String buttonText="";
    if (x<18){
      color=Colors.amber;
      text="you are under weight";
      animation=Lottie.asset("assets/animations/animation_lo8xqa0g.json") ;
      uriLink='https://www.healthline.com/nutrition/18-foods-to-gain-weight';
      buttonText='click here to help you gain weight';
    }else if(18<=x && x <=25){
      color=Colors.green;
      text="you are healthy";
      animation=Lottie.asset("assets/animations/animation_lo8ylgo8.json") ;
    }else if(25 <=x && x<=30){
      color =Colors.amber;
      text="you are over weight";
      animation=Lottie.asset("assets/animations/animation_lo8xqtvy.json") ;
      uriLink='https://www.healthline.com/nutrition/most-weight-loss-friendly-foods';
      buttonText='click here to help you loss weight';
    }else{
      color=Colors.red;
      text="you are obese";
      animation=Lottie.asset("assets/animations/animation_lo8xqtvy.json") ;
      uriLink='https://www.healthline.com/nutrition/most-weight-loss-friendly-foods';
      buttonText='click here to help you loss weight';
    }

    return SafeArea(child: Scaffold(
      appBar: AppBar(title: const Text("BMI Result")),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
            color: Colors.deepPurple[300],
          ),

          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                Text("Gender : ${isMale ? 'Male':'Female'}",
                style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Result : ",
                    style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                    Container(
                      width: 45,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Text("$x",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: color),),
                      ),
                    ),

                  ],
                ),
                Text("Age : $Age",
                style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                Container(child: animation),
                const Spacer(),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Text(text,
                      style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: color),),
                    ),
                  ),
                ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Center(
                        child: Link(uri: Uri.parse(uriLink),
                          builder: (context, followLink) {
                            return SizedBox(
                              height: 50,
                              child: ElevatedButton(

                                  onPressed: followLink,
                                  child: Text(buttonText)),
                            );
                          },),
                      ),
                    ),
              ]),
            ),
          ),
        ),
      ),
    ));

  }

}
