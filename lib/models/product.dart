class Metadata {
  Metadata(this.review, this.reviewNum, this.price, this.from);

  String review;
  String reviewNum;
  String price;
  String from;

  Metadata.fromJson(Map<String, dynamic> json)
      : review = json['review'],
        reviewNum = json['reviewNum'],
        price = json['price'],
        from = json['from'];

  Map<String, dynamic> toJson() => {
        'review': review,
        'reviewNum': reviewNum,
        'price': price,
        'from': from,
      };
}

class Product {
  Product(this.id, this.images, this.name, this.metadata);

  String id;
  List<dynamic> images;
  String name;
  Metadata metadata;

  Product.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        images = json['images'],
        name = json['name'],
        metadata = Metadata.fromJson(json['metadata'] as Map<String, dynamic>);

  Map<String, dynamic> toJson() => {
        'id': id,
        'images': images,
        'name': name,
        'metadata': metadata.toJson(),
      };
}
