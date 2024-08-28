class CreateUserReq {
  final String password;
  final String fullname;
  final String email;

  CreateUserReq(
      {required this.password, required this.fullname, required this.email});
}
