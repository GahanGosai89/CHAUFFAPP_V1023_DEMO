class LoginResponse {
  LoginResponse({
    required this.success,
    required this.driverId,
    required this.mobileNumber,
    required this.message,
  });
  late final bool success;
  late final String driverId;
  late final String mobileNumber;
  late final String message;

  LoginResponse.fromJson(Map<String, dynamic> json){
    success = json['success'];
    driverId = json['driverId'];
    mobileNumber = json['mobileNumber'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['driverId'] = driverId;
    _data['mobileNumber'] = mobileNumber;
    _data['message'] = message;
    return _data;
  }
}