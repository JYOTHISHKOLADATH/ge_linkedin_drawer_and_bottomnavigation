import 'package:flutter/material.dart';
import 'package:ge_bottomnavbar_drawer/sqfliteStockCount_services.dart';
import 'package:intl/intl.dart';

import 'model_StockCount.dart';

class ListStock extends StatefulWidget {
  const ListStock({Key? key}) : super(key: key);

  @override
  State<ListStock> createState() => _ListStockState();
}

class _ListStockState extends State<ListStock> {
  @override
  Widget build(BuildContext context) {

    return ValueListenableBuilder(
      valueListenable: stockListNotifier,
      builder: (BuildContext context, List<ModelStockCount> stockList,
          Widget? child) {
        // stockList = stockList.reversed.toList();
        // print(stockList[0].itemName);
        return ListView.separated(
          // reverse: true,
            itemBuilder: (context, index) {
              final now = DateTime.now();
              final data = stockList[index];
              DateTime datetime=DateTime.parse(data.timeStamp!);
              debugPrint(stockList[0].itemName);
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    leading: Text('${DateFormat('yyyy-MM-dd HH:mm:ss').format(datetime)}'),
                      title: Text(data.itemName),
                      subtitle: SizedBox(
                        width: 20,
                        child: index == 0 ? Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  // count=countOfItems[index];
                                  // count=count-1;
                                  // scanedItems.remove(items[index]);
                                  // countOfItems[index]=count;
                                  updateStockCountSub(
                                      context,now.toString(),data.itemName, data.itemCount);
                                  setState(() {});
                                },
                                icon: Icon(Icons.remove)),
                            Text(
                              data.itemCount.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            IconButton(
                                onPressed: () {
                                  updateStockCountAdd(now.toString(),
                                      data.itemName, data.itemCount);
                                  // count=countOfItems[index];
                                  // count=count+1;
                                  // scanedItems.add(items[index]);
                                  // countOfItems[index]=count;
                                  setState(() {});
                                },
                                icon: Icon(Icons.add)),
                          ],
                        ) : Row(
                          children: [
                            // IconButton(
                            //     onPressed: () {
                            //       // count=countOfItems[index];
                            //       // count=count-1;
                            //       // scanedItems.remove(items[index]);
                            //       // countOfItems[index]=count;
                            //       updateStockCountSub(
                            //           context,now.toString(),data.itemName, data.itemCount);
                            //       setState(() {});
                            //     },
                            //     icon: Icon(Icons.remove)),
                            Text(
                              data.itemCount.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            // IconButton(
                            //     onPressed: () {
                            //       updateStockCountAdd(now.toString(),
                            //           data.itemName, data.itemCount);
                            //       // count=countOfItems[index];
                            //       // count=count+1;
                            //       // scanedItems.add(items[index]);
                            //       // countOfItems[index]=count;
                            //       setState(() {});
                            //     },
                            //     icon: Icon(Icons.add)),
                          ],
                        ),
                      )
                      // onTap: () {
                      //   // selectedIteme=data.id;
                      //   selectedTitle = data.title;
                      //   selectedMessage = data.message;
                      //   Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) => EditingMessagePage(
                      //               data.id, selectedTitle, selectedMessage)));
                      //   // EditingMessagePage(data.id,data.title,data.message)
                      //   // updateMessage(MessageModal ,data.id,data.title,data.message);
                      // },
                     , onLongPress: (){
                        // deleteScannedItem(data.itemName);
                },),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemCount: stockList.length);
      },
    );
  }
}
