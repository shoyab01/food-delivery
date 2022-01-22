class FoodData {
  final String id;
  final String name;
  final String category;
  final String imagePath;
  final double price;
  final double discount;
  int orderCount;

  FoodData(
      {this.id,
      this.name,
      this.category,
      this.imagePath,
      this.discount,
      this.price,
      this.orderCount});
}
