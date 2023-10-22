//
// @Author: "Eldor Turgunov"
// @Date: 22.10.2023
//

class CardModel {
  final String name, image, date;

  CardModel({required this.name, required this.image, required this.date});
}

List<CardModel> demoCardData = [
  CardModel(
    name: "Ice City",
    image: "ice_city.jpeg",
    date: "4.20-30",
  ),
  CardModel(
    name: "Magic City",
    image: "magic_city.jpeg",
    date: "4.28-31",
  ),
  CardModel(
    name: "Tashkent City",
    image: "tashkent_city.jpeg",
    date: "4.28-31",
  ),
  CardModel(
    name: "Seoul Mun",
    image: "seoul_mun.jpeg",
    date: "4.28-31",
  ),
];
