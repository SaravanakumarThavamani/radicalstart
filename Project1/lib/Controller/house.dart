class HouseModel {
  HouseModel({
    required this.imageUrl,
    required this.title,
    required this.rating,
    required this.amount,
    required this.availableBeds,
  });

  final String title;
  final String imageUrl;
  final int amount;
  final int availableBeds;
  final double rating;
}
