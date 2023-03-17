import 'package:flutter/material.dart';
import 'package:ge_bottomnavbar_drawer/liststockpage.dart';
import 'package:ge_bottomnavbar_drawer/model_StockCount.dart';
import 'package:ge_bottomnavbar_drawer/sqfliteStockCount_services.dart';

class SortinList extends StatefulWidget {

  String shelfId;
  @override
  State<SortinList> createState() => _SortinListState();

  SortinList(this.shelfId);
}

class _SortinListState extends State<SortinList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllItems(widget.shelfId);

  }

  int i = 0;
  int j = 0;
  int k = 0;
  List items = [];
  List scanedItems = [];
  List countOfItems = [];
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    print('$now is.....');
    TextEditingController _enteredItem = TextEditingController();
    checkingQuantity() {
      if (items.contains(_enteredItem.text)) {
        scanedItems.add(_enteredItem.text);
      } else {
        items.add(_enteredItem.text);
        scanedItems.add(_enteredItem.text);
      }
      countOfItems.clear();
      for (i = 0; i < items.length; i++) {
        for (j = 0; j < scanedItems.length; j++) {
          if (items[i] == scanedItems[j]) {
            k = k + 1;
          }
        }
        countOfItems.add(k);
        k = 0;
        print(countOfItems);
      }
    }

    int count = 0;
    Future<void> onSubmitButtonClicked() async {
      final _itemName = _enteredItem.text.trim();
      if (_itemName.isEmpty) {
        return;
      }
      print('$_itemName');
      final _addedItem = ModelStockCount(itemName: _itemName, itemCount: count, shelfId: widget.shelfId);
      addItem(_addedItem);
    }

    return Scaffold(
      floatingActionButton:
          FloatingActionButton.extended(
            onPressed: () {}, label: Text('Stop'),
            backgroundColor: Colors.red,),
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          TextField(
            controller: _enteredItem,
          ),
          ElevatedButton(
              onPressed: () async {
                if(_enteredItem.text==""){
                  return;
                }else{
                  final oldStock = await stockExists(_enteredItem.text,widget.shelfId);
                  print("$oldStock these is oldstocK");
                  if (oldStock == 0) {
                    final stockStatus = ModelStockCount(
                        timeStamp: now.toString(),
                        itemName: _enteredItem.text, itemCount: 1,shelfId: widget.shelfId);
                    addItem(stockStatus);
                  } else {
                    final cv = await getItemCount(_enteredItem.text,widget.shelfId);
                    updateScannedItem(_enteredItem.text, cv,now.toString(),widget.shelfId);
                    print("$cv ");
                  }
                  // checkingQuantity();
                  setState(() {});
                }
              },
              child: Text('Add')),
          Expanded(child: ListStock())
          // ListView.builder(
          //     shrinkWrap: true,
          //     // physics: NeverScrollableScrollPhysics(),
          //     itemCount: items.length,
          //     itemBuilder: (BuildContext context, int index) {
          //       return Padding(
          //         padding: const EdgeInsets.only(left: 8.0, right: 8),
          //         child: Card(
          //           elevation: 4,
          //           // color: Color(0xffDEBE95),
          //           child: ListTile(
          //             title: Text(
          //               items[index],
          //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          //             ),
          //             subtitle: SizedBox(
          //               width: 20,
          //               child: Row(
          //                 children: [
          //                   IconButton(onPressed: (){
          //                     // count=countOfItems[index];
          //                     // count=count-1;
          //                     // scanedItems.remove(items[index]);
          //                     // countOfItems[index]=count;
          //                     updateStockCountSub(_enteredItem.text, countOfItems[index]);
          //                     setState(() {
          //
          //                     });
          //                     print(count);
          //                   }, icon: Icon(Icons.remove)),
          //                   Text(
          //                     countOfItems[index].toString(),
          //                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          //                   ),
          //                   IconButton(onPressed: (){
          //                     updateStockCountAdd(_enteredItem.text, countOfItems[index]);
          //                    // count=countOfItems[index];
          //                    // count=count+1;
          //                    // scanedItems.add(items[index]);
          //                    // countOfItems[index]=count;
          //                    setState(() {
          //
          //                    });
          //                   }, icon: Icon(Icons.add)),
          //                 ],
          //               ),
          //             )
          //           ),
          //         ),
          //       );
          //     }),
        ],
      ),
    );
  }
}
