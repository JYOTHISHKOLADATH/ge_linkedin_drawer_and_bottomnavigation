import 'package:flutter/material.dart';
import 'package:ge_bottomnavbar_drawer/apiModal.dart';

import 'apiservices.dart';

class SecondAPItest extends StatelessWidget {
  const SecondAPItest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API test-2'),
      ),
      body: FutureBuilder<List<Welcome>>(
        future: ApiServices().getUser(),
        builder: (context, cw) {
          if (cw.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (cw.hasError) {
            return Center(
              child: Text('Error: ${cw.error}'),
            );
          } else if (cw.hasData) {
            final List<Welcome>? userModel = cw.data;
            return ListView.builder(
              itemCount: userModel!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(userModel[index].id.toString()),
                          Text(userModel[index].username.toString()),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(userModel[index].email.toString()),
                          Text(userModel[index].website.toString()),
                        ],
                      )
                    ],
                  ),
                );
              },
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

//
//
// import 'package:flutter/material.dart';
// import 'package:ge_bottomnavbar_drawer/apiModal.dart';
//
// import 'apiservices.dart';
// class SecondAPItest extends StatefulWidget {
//   const SecondAPItest({Key? key}) : super(key: key);
//
//   @override
//   State<SecondAPItest> createState() => _SecondAPItestState();
// }
//
// class _SecondAPItestState extends State<SecondAPItest> {
//   late List<Welcome>? _userModel = [];
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _getData();
//   }
//   void _getData() async {
//     _userModel = (await ApiServices().getUser())!;
//     Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
//   }
//   Widget build(BuildContext context) {
//     future: ApiServices().getUser();
//     return Scaffold(
//       appBar: AppBar(title: Text('API test-2'),),
//       body: _userModel == null || _userModel!.isEmpty
//           ? const Center(
//         child: CircularProgressIndicator(),
//       ): ListView.builder(
//           itemCount: _userModel!.length,
//           itemBuilder: (context,index){
//             return Card(
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Text(_userModel![index].id.toString()),
//                       Text(_userModel![index].username.toString()),
//                     ],
//                   ),SizedBox(height: 40,),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Text(_userModel![index].email.toString()),
//                       Text(_userModel![index].website.toString()),
//                     ],
//                   )
//                 ],
//               ),
//             );
//       }
//       ),
//     );
//   }
// }

//     : ListView.builder(
// itemCount: _userModel!.length,
// itemBuilder: (context, index) {
// return Card(
// child: Column(
// children: [
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// Text(_userModel![index].id.toString()),
// Text(_userModel![index].username),
// ],
// ),
// const SizedBox(
// height: 20.0,
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// Text(_userModel![index].email),
// Text(_userModel![index].website),
// ],
// ),
// ],
