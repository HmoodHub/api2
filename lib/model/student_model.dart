// ignore_for_file: void_checks

class Student {
  late int id;
  late String fullName;
  late String email;
  late String gender;
  late void verificationCode;
  late void fcmToken;
  late String token;
  late String refreshToken;
  late bool isActive;
  late String password;

  Student();

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    email = json['email'];
    gender = json['gender'];
    verificationCode = json['verification_code'];
    fcmToken = json['fcm_token'];
    token = json['token'];
    refreshToken = json['refresh_token'];
    isActive = json['is_active'];
  }
}
