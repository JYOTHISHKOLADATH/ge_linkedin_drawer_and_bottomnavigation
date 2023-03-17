
class ScheduleApiModel{
  int schedule_id;
  String schedulename;
  String startdate;
  String enddate;
  int countingstatus;
  int role_id;
  int branch_id;
  int cmp_id;
  String created_at;
  int created_by;
  String modified_at;
  int modified_by;
  int status;
  String branch_name;
  String cmp_name;

  ScheduleApiModel({
    required this.schedule_id,
    required this.schedulename,
    required this.startdate,
    required this.enddate,
    required this.countingstatus,
    required this.role_id,
    required this.branch_id,
    required this.cmp_id,
    required this.created_at,
    required this.created_by,
    required this.modified_at,
    required this.modified_by,
    required this.status,
    required this.branch_name,
    required this.cmp_name,}
      );

  factory ScheduleApiModel.fromJson(Map<String, dynamic> json) {
    return ScheduleApiModel(
        schedule_id: json ["schedule_id"],
        schedulename: json["schedulename"],
        startdate: json["startdate"],
        enddate: json["enddate"],
        countingstatus: json["countingstatus"],
        role_id: json["role_id"],
        branch_id: json["branch_id"],
        cmp_id: json["cmp_id"],
        created_at: json["created_at"],
        created_by: json["created_by"],
        modified_at: json["modified_at"],
        modified_by: json["modified_by"],
        status: json["status"],
        branch_name: json["branch_name"],
        cmp_name: json["cmp_name"]
    );
  }
}