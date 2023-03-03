import 'package:flutter/material.dart';
class SortinList extends StatefulWidget {
  const SortinList({Key? key}) : super(key: key);

  @override
  State<SortinList> createState() => _SortinListState();
}

class _SortinListState extends State<SortinList> {
  int i=0;
  int j=0;
  int k=0;
  List items=[];
  List scanedItems=[];
  List countOfItems=[];
  @override
  Widget build(BuildContext context) {
    TextEditingController _enteredItem=TextEditingController();
    checkingQuantity(){
      if(items.contains(_enteredItem.text)){
        scanedItems.add(_enteredItem.text);
      }else{
        items.add(_enteredItem.text);
        scanedItems.add(_enteredItem.text);
      }
      countOfItems.clear();
      for(i=0;i<items.length;i++){
        for(j=0;j<scanedItems.length;j++){
          if(items[i]==scanedItems[j]){
            k=k+1;
          }
        }
        countOfItems.add(k);
        k=0;
        print(countOfItems);
      }
    }
    int count=0;
    return  Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(height: 30,),
          TextField(
            controller: _enteredItem,
          ),
          ElevatedButton(onPressed: (){
            checkingQuantity();
            setState(() {

            });
          }, child: Text('Add')),
          ListView.builder(
              shrinkWrap: true,
              // physics: NeverScrollableScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: Card(
                    elevation: 4,
                    // color: Color(0xffDEBE95),
                    child: ListTile(
                      title: Text(
                        items[index],
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      subtitle: SizedBox(
                        width: 20,
                        child: Row(
                          children: [
                            IconButton(onPressed: (){
                              count=countOfItems[index];
                              count=count-1;
                              scanedItems.remove(items[index]);
                              countOfItems[index]=count;
                              setState(() {

                              });
                              print(count);
                            }, icon: Icon(Icons.remove)),
                            Text(
                              countOfItems[index].toString(),
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            IconButton(onPressed: (){
                             count=countOfItems[index];
                             count=count+1;
                             scanedItems.add(items[index]);
                             countOfItems[index]=count;
                             setState(() {

                             });
                            }, icon: Icon(Icons.add)),
                          ],
                        ),
                      )
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
