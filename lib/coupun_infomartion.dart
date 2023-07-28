class Coupun {
  String text;
  double percentage;
  num minimumPrice;
  Coupun(this.text, this.percentage, this.minimumPrice);
}

class CoupunList {
  static List<Coupun> coupunList = [];
  CoupunList() {
    coupunList.add(Coupun('abcdefgh', 3.5, 500));
    coupunList.add(Coupun('msbijacs', 4.2, 1500));
    coupunList.add(Coupun('dbakyg', 7.5, 2500));
  }
}
