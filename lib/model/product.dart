

class Product{

  final String product_name;
  final String product_detail;
  final String public_id;
  final String image;
  final int price;
  final String productId;

  Product({
    required this.product_name,
    required this.product_detail,
    required this.public_id,
    required this.image,
    required this.price,
    required this.productId

});

  factory Product.fromJson(Map<String, dynamic> json){
    return Product(
        product_name: json['product_name'],
        product_detail: json['product_detail'],
        public_id: json['public_id'],
        image: json['image'],
        price: json['price'],
        productId: json['_id']);
  }

}