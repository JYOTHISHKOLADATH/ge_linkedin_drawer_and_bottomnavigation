import 'package:flutter/material.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({Key? key}) : super(key: key);

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  var ScaffoldKey=GlobalKey<ScaffoldState>();
  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: ScaffoldKey,
      appBar: AppBar(leading:
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(onTap: () {
          ScaffoldKey.currentState?.openDrawer();
        },
            child: Image(image: NetworkImage('https://cdn-icons-png.flaticon.com/512/3135/3135715.png'))),
      ),

        backgroundColor: Colors.black,
      ),
      body: Center(
          child: Text(
        'Screen',
        style: TextStyle(color: Colors.orange),
      )),
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.white70,
          selectedItemColor: Colors.white70,
          backgroundColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.people_sharp),
                label: 'My Network',
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_box_sharp),
                label: 'Post',
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications_sharp),
                label: 'Notification',
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Icon(Icons.work_outlined),
                label: 'Jobs',
                backgroundColor: Colors.black),
          ]),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          child: Image(
                              image: NetworkImage(
                                  'https://cdn-icons-png.flaticon.com/512/3135/3135715.png')),
                          radius: 40,
                        ),
                        Text('JYOTHISH K',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                        Text('View profile',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ListTile(
                    title: Text('42 profile views',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
              Divider(height: 10, color: Colors.grey),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    title: Text(
                      'Groups',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text(
                      'Events',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                    onTap: () {},
                  ),
                  SizedBox(height: 130),
                ],
              ),
              Divider(
                height: 10,
                color: Colors.grey,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      height: 20,
                      child: SizedBox(
                        height: 20,
                      )),
                  ListTile(
                    title: Row(
                      children: [
                        Icon(Icons.settings, color: Colors.white, size: 20),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Settings',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )
                      ],
                    ),
                    onTap: () {},
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
