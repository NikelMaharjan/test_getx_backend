class UserModel {
  String name;
  String email;
  int phone;
  String address;
  String gender;
  String dob;
  String password;
  String passwordConfirmation;

  UserModel(
      {this.name,
        this.email,
        this.phone,
        this.address,
        this.gender,
        this.dob,
        this.password,
        this.passwordConfirmation});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    gender = json['gender'];
    dob = json['dob'];
    password = json['password'];
    passwordConfirmation = json['password_confirmation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['password'] = this.password;
    data['password_confirmation'] = this.passwordConfirmation;
    return data;
  }
}
