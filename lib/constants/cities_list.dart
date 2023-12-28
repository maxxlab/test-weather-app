import 'dart:math';

List<String> generateRandomCities() {
  final cityList = [
    "Kyiv",
    "Lviv",
    "Odesa",
    "Kharkiv",
    "Dnipro",
    "Zaporizhzhia",
    "Mykolaiv",
    "Vinnytsia",
    "Mariupol",
    "Kherson",
    "Delhi",
    "Shanghai",
    "Dallas",
    "Houston",
  ];

  final random = Random();

  cityList.shuffle(random);

  return cityList.sublist(0, 5);
}
