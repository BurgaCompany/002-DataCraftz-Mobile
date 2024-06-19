bool validateEmail(String email) {
  final RegExp regex = RegExp(r'^.+@gmail\.com$');
  return regex.hasMatch(email);
}
