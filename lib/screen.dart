import 'package:flutter/material.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({Key? key}) : super(key: key);

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  var ScaffoldKey = GlobalKey<ScaffoldState>();
  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff283134),
      key: ScaffoldKey,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
              onTap: () {
                ScaffoldKey.currentState?.openDrawer();
              },
              child: const Image(
                  image: NetworkImage(
                      'https://cdn-icons-png.flaticon.com/512/3135/3135715.png'))),
        ),
        backgroundColor: Color(0xff1D282B),
        title: SizedBox(
          height: 40,
          child: TextField(
            cursorColor: Colors.white,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              fillColor: Color(0xff3F4B4F),
              hintText: 'search',
              hintStyle: TextStyle(color: Color(0xff283134)),
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              border: const OutlineInputBorder(),
              isDense: true,
              contentPadding: const EdgeInsets.all(8),
              filled: true,
              focusedBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
            ),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.chat_sharp, size: 30),
          )
        ],
      ),
      body: const Center(
          child: Text(
        'Screen',
        style: TextStyle(color: Colors.orange),
      )),
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.white70,
          selectedItemColor: Colors.white70,
          backgroundColor: const Color(0xff1D282B),
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people_sharp),
              label: 'My Network',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box_sharp),
              label: 'Post',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_sharp),
              label: 'Notification',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.work_outlined),
              label: 'Jobs',
            ),
          ]),
      drawer: Drawer(
        backgroundColor: const Color(0xff1D282B),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      SizedBox(
                        width: 20,
                      ),
                      CircleAvatar(
                          radius: 50,
                          child: Image(
                            image: NetworkImage(
                                'https://cdn-icons-png.flaticon.com/512/3135/3135715.png'),
                          )),
                    ],
                  ),
                  ListTile(
                    leading: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('JYOTHISH K',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white)),
                        Text('View profile',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                                color: Colors.grey))
                      ],
                    ),
                  ),
                  ListTile(
                    leading: RichText(
                        text: const TextSpan(children: [
                      TextSpan(
                          text: '986 ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: 'profile views',
                          style: TextStyle(fontWeight: FontWeight.normal))
                    ])),
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  const ListTile(
                    leading: Text('Groups',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white)),
                  ),
                  const ListTile(
                    leading: Text('Events',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white)),
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                children: const [
                  Divider(
                    color: Colors.grey,
                  ),
                  ListTile(
                    leading: Icon(Icons.settings, color: Colors.white),
                    title:
                        Text('Settings', style: TextStyle(color: Colors.white)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
