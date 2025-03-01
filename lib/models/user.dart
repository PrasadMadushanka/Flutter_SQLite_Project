class User {
  final String userCode;
  final String userDisplayName;

  User({required this.userCode, required this.userDisplayName});

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      userCode: map['user_code'],
      userDisplayName: map['user_display_name'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user_code': userCode,
      'user_display_name': userDisplayName,
    };
  }
}
