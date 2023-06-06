class Soru {
  String soruText;
  bool soruCevap;

  Soru(
      {required this.soruText,
      required this.soruCevap}); //normalde kabul etmiyordu, required ekleyince sorun çözüldü
}
