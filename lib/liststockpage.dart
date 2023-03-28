import 'package:flutter/material.dart';
import 'package:ge_bottomnavbar_drawer/apiactivities/syncing%20data/syncingdata_api_service.dart';
import 'package:ge_bottomnavbar_drawer/sqfliteStockCount_services.dart';
import 'package:intl/intl.dart';

import 'model_StockCount.dart';

class ListStock extends StatefulWidget {
  const ListStock({Key? key, required this.shelfId}) : super(key: key);
  final String shelfId;
  @override
  State<ListStock> createState() => _ListStockState();
}

List<ModelStockCount> poststockList = [];

class _ListStockState extends State<ListStock> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _enteredItem = TextEditingController();
    final now = DateTime.now();
    return Column(
      children: [
        SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Icon(
                      Icons.arrow_back_ios_sharp,
                      color: Colors.black,
                    ),
                  ),
                ),
                Text(
                  "Item scan",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  width: 20,
                )
              ],
            )),
        SizedBox(
          height: 30,
        ),

        //Expanded(child: ListStock())
        Expanded(
          child: ValueListenableBuilder(
            valueListenable: stockListNotifier,
            builder: (BuildContext context, stockList,
                Widget? child) {
               ;
              //poststockList.add(stockList);
              // stockList = stockList.reversed.toList();
              // print(stockList[0].itemName);
              return Column(
                children: [
                  TextField(
                    controller: _enteredItem,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () async {
                            if (_enteredItem.text == "") {
                              return;
                            } else {
                              final oldStock =
                              await stockExists(_enteredItem.text, widget.shelfId);
                              print("$oldStock these is oldstocK");
                              if (oldStock == 0) {
                                final stockStatus = ModelStockCount(
                                    timeStamp: now.toString(),
                                    itemName: _enteredItem.text,
                                    itemCount: 1,
                                    shelfId: widget.shelfId);
                                addItem(stockStatus);
                              } else {
                                final cv = await getItemCount(
                                    _enteredItem.text, widget.shelfId);
                                updateScannedItem(_enteredItem.text, cv, now.toString(),
                                    widget.shelfId);
                                print("$cv ");
                              }
                              // checkingQuantity();
                              setState(() {});
                            }
                          },
                          child: Text('Add')),
                      ElevatedButton(
                          onPressed: () {
                            // createCountedItem(context,_enteredItem.text,widget.shelfId);
                            for(int j=0;j<stockList.length;j++){
                              forpostmethod(stockList.length,stockList[j].itemName,stockList[j].shelfId);
                            }

                          },
                          child: Text("Sync"))
                    ],
                  ),
                  stockList.length == 0
                      ? Center(
                        child: Column(
                    children: [
                        Image(
                            image: NetworkImage(
                                "https://img.icons8.com/external-vitaliy-gorbachev-lineal-color-vitaly-gorbachev/256/external-qr-code-sales-vitaliy-gorbachev-lineal-color-vitaly-gorbachev.png")),
                        Text(
                          "Please Scan A Product",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("Scanned Items will be added")
                    ],
                  ),
                      )
                      : Expanded(
                        child: ListView.separated(
                    // reverse: true,
                        itemBuilder: (context, index) {
                          final now = DateTime.now();
                          final data = stockList[index];
                          DateTime datetime = DateTime.parse(data.timeStamp!);
                          debugPrint(stockList[0].itemName);
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Expanded(
                                          flex: 1,
                                          child: Image(
                                              image: NetworkImage(
                                                  "https://cdn-icons-png.flaticon.com/512/3334/3334338.png")),
                                        ),
                                        Expanded(
                                          flex: 11 ,
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Text(data.itemName,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                                    RichText(
                                                        text: TextSpan(children: [
                                                          TextSpan(
                                                            text: "Shelf No:",
                                                            style: TextStyle(
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 13.0,
                                                              color: Colors.grey,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text: " ${data.shelfId} ",
                                                            style: TextStyle(
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 14.0,
                                                              color: Colors.black,
                                                            ),
                                                          )
                                                        ])),
                                                    Row(
                                                      children: [
                                                        Icon(Icons.access_time_rounded,size: 14,),
                                                        Text(
                                                          '${DateFormat(' HH:mm:ss | dd-MM-yyyy').format(datetime)}',style: TextStyle(fontSize: 14),)
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 8.0,left: 8,top: 10),
                                      child: Divider(
                                        color: Colors.grey,
                                        height: 1,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(

                                          children: [
                                            index == 0
                                                ? Row(
                                              children: [
                                                IconButton(
                                                    onPressed: () {
                                                      updateStockCountSub(
                                                          context,
                                                          now.toString(),
                                                          data.itemName,
                                                          data.itemCount,
                                                          data.shelfId);
                                                      setState(() {});
                                                    },
                                                    icon: Icon(Icons.remove_circle_outline)),
                                                Text(
                                                  data.itemCount.toString(),
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 20),
                                                ),
                                                IconButton(
                                                    onPressed: () {
                                                      updateStockCountAdd(
                                                          now.toString(),
                                                          data.itemName,
                                                          data.itemCount,
                                                          data.shelfId);
                                                      setState(() {});
                                                    },
                                                    icon: Icon(Icons.add_circle,color: Colors.deepPurple,)),
                                              ],
                                            )
                                                : Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                SizedBox(width: 20,),
                                                RichText(
                                                    text: TextSpan(children: [
                                                      TextSpan(
                                                        text: "In Shtock",
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 12.0,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: " ${data.itemCount} ",
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 18.0,
                                                          color: Colors.black,
                                                        ),
                                                      )
                                                    ]))
                                              ],
                                            ),

                                          ],
                                        ),
                                        index == 0
                                            ? Column(
                                          children: [
                                            SizedBox(height: 10,),
                                            ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                MaterialStatePropertyAll<Color>(Colors.deepPurple),
                                                shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(10.0),
                                                  ),
                                                ),
                                              ),
                                              onPressed: (){
                                                updateStockCountEasy(context, now.toString(),
                                                    data.itemName, data.itemCount, data.shelfId);
                                              }, child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Icon(Icons.edit,size: 15,),
                                                SizedBox(width: 5), // Add some spacing between the icon and text
                                                Text('EDIT'),
                                              ],
                                            ),),
                                          ],
                                        ) : SizedBox(height: 40,)
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider();
                        },
                        itemCount: stockList.length),
                      ),
                ],
              );
            },
          ),
        )
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
    );
  }
    forpostmethod(int length , String itrmname, String shelfid){
    // for(int i=0;i<=length;i++){
      createCountedItem(context, itrmname, shelfid,);
    // }
    // ListView.builder(
    //   itemCount: length,
    //     itemBuilder:(context, index){
    //
    //   return Container();
    // });
  }
}
//
// ListTile(
// trailing: Text(data.shelfId.toString()),
// leading: Text(
// '${DateFormat('yyyy-MM-dd HH:mm:ss').format(datetime)}'),
// title: Text(data.itemName),
// subtitle:
// onTap: () {
// updateStockCountEasy(context, now.toString(),
// data.itemName, data.itemCount, data.shelfId);
// },
// ),
