class Listing {
  final id;
  final productId;
  final sellerId;
  final product;
  final category;
  final seller;
  final price;
  final createdAt;

  Listing(
      {this.id,
        this.productId,
        this.sellerId,
        this.product,
        this.price,
        this.category,
        this.seller,
        this.createdAt});

  factory Listing.fromJson(Map<String, dynamic> json) {
    return Listing(
        id: json['id'],
        sellerId: json['seller_id'],
        productId: json['product_id'],
        category: json['product']['category'],
        product: json['product']['name'],
        seller: json['seller']['name'],
        price: json['price'],
        createdAt: json['created_at']
        );
  }
}