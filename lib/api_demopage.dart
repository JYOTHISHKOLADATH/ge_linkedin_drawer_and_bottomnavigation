import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
class ApidemoPage extends StatefulWidget {
  const ApidemoPage({Key? key}) : super(key: key);

  @override
  State<ApidemoPage> createState() => _ApidemoPageState();
}
  String? stringResponse;
Map? mapResponse;
List? listRespons;
class _ApidemoPageState extends State<ApidemoPage> {
  Future apiCall()async{
  http.Response response;
  response= await http.get(Uri.parse("https://reqres.in/api/users?page=2")) ;
  if(response.statusCode==200){
    setState(() {
      // stringResponse=response.body;
      mapResponse=json.decode(response.body);
      listRespons=mapResponse!['data'];
    });
  }
  }
  @override
  void initState() {
    apiCall();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('API demo page'),),
      body: listRespons==null? Center(child: Text('Data is loading...')):ListView.builder(itemBuilder:  (context , index){
        return Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image(image: NetworkImage(listRespons![index]['avatar'])),
                SizedBox(width: 40,),
                Text(listRespons![index]['id'].toString()),
                SizedBox(width: 40,),
                Text(listRespons![index]['first_name'].toString()),

              ],
            ),
          ),
        );
      } ,
        itemCount: listRespons==null? 0:listRespons!.length,
      )
    );
  }
}

// Center(
// child: listRespons==null? Text('Data is loading') :Text(
// listRespons![0].toString()
// ),
// ),