/// status : true
/// message : "Logged in successfully"
/// object : {"id":1189,"full_name":"Flutter User","email":"hmood@example.com","gender":"F","verification_code":null,"fcm_token":null,"token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiZGI0OTk2MWZlM2U1NTY5NWY1NWFjZjU5Mjg3Y2IyZDM2NWFkMmQ1ODI5ZWFjMjY4OGMxNDhkYzRmZDRiNGVkYTNmM2IxMTMwZjQ4NGIyNDgiLCJpYXQiOjE2ODQyMzA1NjEuNTQ4MTk0LCJuYmYiOjE2ODQyMzA1NjEuNTQ4MTk3LCJleHAiOjE2ODU5NTg1NjEuNDk3MTQsInN1YiI6IjExODkiLCJzY29wZXMiOlsiKiJdfQ.cCPGsNP46f1oeAgt3mHLcpoSCVKBURAaDeD9TksGZpI6UzHv3E58OUPQvWmxJWbaNVz472TMZiRvVsw_OtQ711FlrLy4tVBUeiAIwMGi60KAYlbS-1z5zbqRgxYgqpR3rVgiUadJ60EfJVr0kUmTqqh2Zu9ZgErdizCv5i8XRFkcEA7Hg5jpfv9MPy3JyQGmIK7_Cn00UX-cJigDI9-dNe1j8wO5JTswteB_nEOzDxmLhf5w0Vtuej9PKU4giX92ahxAxsH1h5Rn-MkpQ49wOyxLcZ1skRdGShZ7hKGVvP0OfIK1BRp8OP4e5S_K8S8pfb4I9Ss75ADT4TqB06Kq9P6ucMo-4U2lmJNaX-02OPwZ-ormO7obR06eeS_uLJ9133K14a3ncZN72JdGKIHq9JvkpzbKL4ZFlUf4YOA8pgk1XdlKhxBGszSt4hg7c74xgBDyplDUJ6XeIZGZKasyzam4XcEidYFqQaqKwvbQxJqqee1qPF47Q7F1lAmyAmmNYTdn-Z9_aNdhHepRrbX7PnHjTYlKlIpVt3jLDux_NqIhYKOfL8xex2Q7KzLrXR9NWLmuMb3tDM92BE67QNw4lmaCyFUw4faQwBgJLOI-Ao3cOYdQzqruWZaza9vFCxOywtLEJjZbqGJKWcwDDYhXgfFyHZaP-b5mGGGb532quxA","refresh_token":"def502006de772de0e8f441b1f5cd6b113b1285ff9ba52db9c0d5d8be18c17cd5d8f51983dc74bd3e0cb7de1fc604a019e923fb1f03d2c1d49c88aebd3c4d052172cad50aaad9f0056c954a87a6ffd40af0c98562d75788480946a768535c82a6e5056f7f57131ff91b345d4950586ceb50b1b0894408d8fd7c88ce0cee40b4d3775551a71b85aa48bc9a587c1b62f918847a79488eab7aa940e72b352227534a80263f2625685da6d32aa65fde78a5d3c225b4aa9fc9899c89f58f1de4d2f44d2696a8976a11ba40c7a71ebdd76f9c421e26c88684f97bff0e683fa8d14310ca2317796f083e99ecd5413bee7ae2c7232f69977b86064e51535c02dce7daab48b127c2d440b89f614c671edafe7e308120a8916819ee0246a08e3524f3099f136426c4ca22f669351eb138f297c5f23a024a6609245810f79cdd8d8766d4874866febcb660142158be964b5e8ff068eb5d577e3aba55bdb21c0f14c0d1edc8a0b545186e752a8","is_active":true}

class LoginModel {
  LoginModel({
    bool? status,
    String? message,
    ObjectUser? object,
  }) {
    _status = status;
    _message = message;
    _object = object;
  }

  LoginModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _object = json['object'] != null ? ObjectUser.fromJson(json['object']) : null;
  }

  bool? _status;
  String? _message;
  ObjectUser? _object;

  LoginModel copyWith({
    bool? status,
    String? message,
    ObjectUser? object,
  }) =>
      LoginModel(
        status: status ?? _status,
        message: message ?? _message,
        object: object ?? _object,
      );

  bool? get status => _status;

  String? get message => _message;

  ObjectUser? get object => _object;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_object != null) {
      map['object'] = _object?.toJson();
    }
    return map;
  }
}

/// id : 1189
/// full_name : "Flutter User"
/// email : "hmood@example.com"
/// gender : "F"
/// verification_code : null
/// fcm_token : null
/// token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiZGI0OTk2MWZlM2U1NTY5NWY1NWFjZjU5Mjg3Y2IyZDM2NWFkMmQ1ODI5ZWFjMjY4OGMxNDhkYzRmZDRiNGVkYTNmM2IxMTMwZjQ4NGIyNDgiLCJpYXQiOjE2ODQyMzA1NjEuNTQ4MTk0LCJuYmYiOjE2ODQyMzA1NjEuNTQ4MTk3LCJleHAiOjE2ODU5NTg1NjEuNDk3MTQsInN1YiI6IjExODkiLCJzY29wZXMiOlsiKiJdfQ.cCPGsNP46f1oeAgt3mHLcpoSCVKBURAaDeD9TksGZpI6UzHv3E58OUPQvWmxJWbaNVz472TMZiRvVsw_OtQ711FlrLy4tVBUeiAIwMGi60KAYlbS-1z5zbqRgxYgqpR3rVgiUadJ60EfJVr0kUmTqqh2Zu9ZgErdizCv5i8XRFkcEA7Hg5jpfv9MPy3JyQGmIK7_Cn00UX-cJigDI9-dNe1j8wO5JTswteB_nEOzDxmLhf5w0Vtuej9PKU4giX92ahxAxsH1h5Rn-MkpQ49wOyxLcZ1skRdGShZ7hKGVvP0OfIK1BRp8OP4e5S_K8S8pfb4I9Ss75ADT4TqB06Kq9P6ucMo-4U2lmJNaX-02OPwZ-ormO7obR06eeS_uLJ9133K14a3ncZN72JdGKIHq9JvkpzbKL4ZFlUf4YOA8pgk1XdlKhxBGszSt4hg7c74xgBDyplDUJ6XeIZGZKasyzam4XcEidYFqQaqKwvbQxJqqee1qPF47Q7F1lAmyAmmNYTdn-Z9_aNdhHepRrbX7PnHjTYlKlIpVt3jLDux_NqIhYKOfL8xex2Q7KzLrXR9NWLmuMb3tDM92BE67QNw4lmaCyFUw4faQwBgJLOI-Ao3cOYdQzqruWZaza9vFCxOywtLEJjZbqGJKWcwDDYhXgfFyHZaP-b5mGGGb532quxA"
/// refresh_token : "def502006de772de0e8f441b1f5cd6b113b1285ff9ba52db9c0d5d8be18c17cd5d8f51983dc74bd3e0cb7de1fc604a019e923fb1f03d2c1d49c88aebd3c4d052172cad50aaad9f0056c954a87a6ffd40af0c98562d75788480946a768535c82a6e5056f7f57131ff91b345d4950586ceb50b1b0894408d8fd7c88ce0cee40b4d3775551a71b85aa48bc9a587c1b62f918847a79488eab7aa940e72b352227534a80263f2625685da6d32aa65fde78a5d3c225b4aa9fc9899c89f58f1de4d2f44d2696a8976a11ba40c7a71ebdd76f9c421e26c88684f97bff0e683fa8d14310ca2317796f083e99ecd5413bee7ae2c7232f69977b86064e51535c02dce7daab48b127c2d440b89f614c671edafe7e308120a8916819ee0246a08e3524f3099f136426c4ca22f669351eb138f297c5f23a024a6609245810f79cdd8d8766d4874866febcb660142158be964b5e8ff068eb5d577e3aba55bdb21c0f14c0d1edc8a0b545186e752a8"
/// is_active : true

class ObjectUser {

  num? id;
  String? fullName;
  String? email;
  String? gender;
  dynamic verificationCode;
  dynamic fcmToken;
  String? token;
  String? refreshToken;
  bool? isActive;
  String? password;

  ObjectUser();
  ObjectUser.fromJson(dynamic json) {
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

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['full_name'] = fullName;
    map['email'] = email;
    map['gender'] = gender;
    map['verification_code'] = verificationCode;
    map['fcm_token'] = fcmToken;
    map['token'] = token;
    map['refresh_token'] = refreshToken;
    map['is_active'] = isActive;
    return map;
  }
}
