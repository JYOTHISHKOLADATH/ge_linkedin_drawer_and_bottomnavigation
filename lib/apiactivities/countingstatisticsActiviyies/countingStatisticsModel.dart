class Item {
  String? barcode;
  String itemcode;
  String itemname;
  int scheduleId;
  int roleId;
  int branchId;
  int cmpId;
  int expectedQty;
  String schedulename;
  String rolename;
  String branchName;
  String cmpName;
  int createdBy;
  DateTime createdAt;
  int? modifiedBy;
  DateTime? modifiedAt;
  String createdByName;
  String? updatedByName;

  Item({
    this.barcode,
    required this.itemcode,
    required this.itemname,
    required this.scheduleId,
    required this.roleId,
    required this.branchId,
    required this.cmpId,
    required this.expectedQty,
    required this.schedulename,
    required this.rolename,
    required this.branchName,
    required this.cmpName,
    required this.createdBy,
    required this.createdAt,
    this.modifiedBy,
    this.modifiedAt,
    required this.createdByName,
    this.updatedByName,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      barcode: json['barcode'],
      itemcode: json['itemcode'],
      itemname: json['itemname'],
      scheduleId: json['schedule_id'],
      roleId: json['role_id'],
      branchId: json['branch_id'],
      cmpId: json['cmp_id'],
      expectedQty: json['expectedqty'],
      schedulename: json['schedulename'],
      rolename: json['rolename'],
      branchName: json['branch_name'],
      cmpName: json['cmp_name'],
      createdBy: json['created_by'],
      createdAt: DateTime.parse(json['created_at']),
      modifiedBy: json['modified_by'],
      modifiedAt: json['modified_at'] != null ? DateTime.parse(json['modified_at']) : null,
      createdByName: json['createdbyname'],
      updatedByName: json['updatedbyname'],
    );
  }
}
