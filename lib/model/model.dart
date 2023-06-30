class MainModel {
  final String ip;
  final String city;
  final String region;
  final String timeZone;
  final String org;

  MainModel({
    required this.ip,
    required this.city,
    required this.region,
    required this.org,
    required this.timeZone,
  });

  factory MainModel.fromJson(Map<String, dynamic> json) {
    return MainModel(
      ip: json["ip"],
      city: json["city"],
      region: json["region"],
      org: json["org"],
      timeZone: json["timezone"],
    );
  }
}
