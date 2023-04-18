import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class CoutingstatTwo extends StatefulWidget {
  const CoutingstatTwo({Key? key}) : super(key: key);

  @override
  State<CoutingstatTwo> createState() => _CoutingstatTwoState();
}

class _CoutingstatTwoState extends State<CoutingstatTwo> {
  List count=["123","40","4","83"];
  List role=["SCHEDULED","COUNTED","NEW","PENDING"];
  List<Color> colour=[];
  // List<int> colour=[0xffFFF4F4,0xffFFFBEF,0xffEFF3F9,0xffF7FAFA,];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(width: 30,),
                  Text("Counting Status",style: GoogleFonts.glory(
                      fontWeight: FontWeight.bold,fontSize: 18),),
                  // SizedBox(width: 20,)
                ],
              )),
          Expanded(
            child: Lottie.network(
              'https://assets7.lottiefiles.com/private_files/lf30_f0fhps6k.json',
              // width: 200,
              // height: 400,
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: role.length,
              padding: EdgeInsets.zero,
              itemBuilder: ((context,index){
                // Color color = Color(colour[index % colour.length].value);
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: _getColor(index),
                  borderRadius: BorderRadius.circular(20),
                ),
                // decoration: BoxDecoration(color: colour[index]),
                child:Column(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: 5,),
                    Text(count[index].toString(),style: GoogleFonts.glory(
                  fontSize: MediaQuery.of(context).size.width * 0.2,fontWeight: FontWeight.bold),),
                    Text(role[index].toString(),style: GoogleFonts.glory(
                        fontSize: MediaQuery.of(context).size.width * 0.07,fontWeight: FontWeight.bold),),
                  ],
                ) ,
              ),
            );
          })),


          SizedBox(height: 30,)
        ],
      ),
    );
  }
  Color _getColor(int index) {
    switch (index % 4) {
      case 0:
        return  Color(0xff569E9A);
      case 1:
        return Color(0xff9DD5CE);
      case 2:
        return Color(0xffFADFA8);
      case 3:
        return Color(0xffFEC96E);
      default:
        return Color(0xffF7FAFA);
    }
  }
}
