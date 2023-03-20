
class ViewScheduleApiModel{
  String schedulename;
  int schedule_id;
  String startdate;
  String enddate;
  int countingstatus;
  int status;
  int role_id;
  String rolename;
  String branch_name;
  String cmp_name;
  int branch_id;
  int cmp_id;
  int modified_by;
  String modified_at;
  int created_by;
  String created_at;
  String createdbyname;
  String updatedbyname;


  ViewScheduleApiModel({
    required this.schedulename,
    required this.schedule_id,
    required  this.startdate,
    required this.enddate,
    required this.countingstatus,
    required this.status,
    required this.role_id,
    required this.rolename,
    required this.branch_name,
    required this.cmp_name,
    required this.branch_id,
    required this.cmp_id,
    required this.modified_by,
    required this.modified_at,
    required this.created_by,
    required this.created_at,
    required this.createdbyname,
    required this.updatedbyname});

  factory ViewScheduleApiModel.fromJson(Map<String, dynamic> json) {
    return ViewScheduleApiModel(
        schedulename: json["schedulename"],
        schedule_id: json["schedule_id"],
        startdate: json["startdate"],
        enddate: json["enddate"],
        countingstatus: json["countingstatus"],
        status: json["status"],
        role_id: json["role_id"],
        rolename: json["rolename"],
        branch_name: json["branch_name"],
        cmp_name: json["cmp_name"],
        branch_id: json["branch_id"],
        cmp_id: json["cmp_id"],
        modified_by: json["modified_by"],
        modified_at: json["modified_at"],
        created_by: json["created_by"],
        created_at: json["created_at"],
        createdbyname: json["createdbyname"],
        updatedbyname: json["updatedbyname"]);
  }
}