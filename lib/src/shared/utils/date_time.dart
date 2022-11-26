String saudacao() {
  DateTime now = DateTime.now();

  if (now.hour < 12) {
    return 'Bom dia';
  } else if (now.hour < 18) {
    return 'Boa tarde';
  } else {
    return 'Boa noite';
  }
}