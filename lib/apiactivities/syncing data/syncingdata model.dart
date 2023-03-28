class CountedItemsResponse {
  final String message;
  final CountedItem countedItem;

  CountedItemsResponse({required this.message, required this.countedItem});

  factory CountedItemsResponse.fromJson(Map<String, dynamic> json) {
    return CountedItemsResponse(
      message: json['message'],
      countedItem: CountedItem.fromJson(json['body']['Counteditems']),
    );
  }
}

class CountedItem {
  final String barcode;
  final String itemCode;
  final String itemName;
  final int shelfNumber;
  final int scheduleId;
  final int roleId;
  final int branchId;
  final int cmpId;
  final int actualQty;
  final String syncedAt;

  CountedItem({
    required this.barcode,
    required this.itemCode,
    required this.itemName,
    required this.shelfNumber,
    required this.scheduleId,
    required this.roleId,
    required this.branchId,
    required this.cmpId,
    required this.actualQty,
    required this.syncedAt,
  });

  factory CountedItem.fromJson(Map<String, dynamic> json) {
    return CountedItem(
      barcode: json["barcode"] ??"",
      itemCode: json['itemcode'] ??"",
      itemName: json['itemname'] ??"",
      shelfNumber: json['shelfnumber'] ?? 0,
      scheduleId: json['schedule_id'] ?? 0,
      roleId: json['role_id'] ?? 0,
      branchId: json['branch_id'] ?? 0,
      cmpId: json['cmp_id'] ?? 0,
      actualQty: json['actualqty'] ?? 0,
      syncedAt: json['synced_at'] ,
    );
  }
}
