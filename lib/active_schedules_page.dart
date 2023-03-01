import 'package:flutter/material.dart';
import 'package:ge_bottomnavbar_drawer/view_schedule_page.dart';

class ActiveSchedulesPage extends StatefulWidget {
  const ActiveSchedulesPage({Key? key}) : super(key: key);

  @override
  State<ActiveSchedulesPage> createState() => _ActiveSchedulesPageState();
}

class _ActiveSchedulesPageState extends State<ActiveSchedulesPage> {
  @override
  Widget build(BuildContext context) {
    List stockSchedule = ["GE STOCK COUNT JAN'23", "GE STOCK COUNT JUNE'23"];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        iconTheme: Theme.of(context).iconTheme,
        title: Text("ACTIVE SCHEDULE"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            'SELECT SCHEDULES',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(height: 20,),
          ListView.builder(
              shrinkWrap: true,
              // physics: NeverScrollableScrollPhysics(),
              itemCount: stockSchedule.length,
              itemBuilder: (BuildContext context, int index) {
                return
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0,right: 8),
                    child: Card(
                      color: Color(0xffDEBE95),
                    child: ListTile(
                      title: Text(
                        stockSchedule[index],textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> ViewSchedule()));
                      },
                    ),
                ),
                  );
              }),
          Spacer(),
          // Divider(height: 10,color: Colors.black,),
          Container(
            decoration: BoxDecoration(color: Colors.amber,borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)), boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 10.0, // soften the shadow
                spreadRadius: 5.0, //extend the shadow
                offset: Offset(
                  5.0, // Move to right 5  horizontally
                  -5.0, // Move to bottom 5 Vertically
                ),
              )
            ],),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      children: [
                        Icon(Icons.home,size: 35,color: Color(0xffFD0909),),
                        Text("HOME",style: TextStyle(fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: InkWell(
                      child: Column(
                        children: [
                          Icon(Icons.close,size: 35,color:  Color(0xffFD0909)),
                          Text("CLOSE",style: TextStyle(fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 20,child: Container(color: Colors.amber,),)
        ],
      ),
    );
  }
}
