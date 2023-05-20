class Metadata {
  Metadata(this.review);

  String review;

  Metadata.fromJson(Map<String, dynamic> json) : review = json['review'];

  Map<String, dynamic> toJson() => {
        'review': review,
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
