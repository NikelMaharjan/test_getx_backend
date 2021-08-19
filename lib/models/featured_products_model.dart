class FeaturedProductsModel {
  int id;
  String name;
  String brand;
  String description;
  String quantity;
  String rate;
  String prevPrice;
  String sku;
  String image;
  String tags;
  String featured;
  String newArrival;
  String topSales;
  String deptId;
  String createdAt;
  String updatedAt;
  String availability;
  Null discount;
  String vendorId;
  Null deletedAt;

  FeaturedProductsModel(
      {this.id,
        this.name,
        this.brand,
        this.description,
        this.quantity,
        this.rate,
        this.prevPrice,
        this.sku,
        this.image,
        this.tags,
        this.featured,
        this.newArrival,
        this.topSales,
        this.deptId,
        this.createdAt,
        this.updatedAt,
        this.availability,
        this.discount,
        this.vendorId,
        this.deletedAt});

  FeaturedProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    brand = json['brand'];
    description = json['description'];
    quantity = json['quantity'];
    rate = json['rate'];
    prevPrice = json['prev_price'];
    sku = json['sku'];
    image = json['image'];
    tags = json['tags'];
    featured = json['featured'];
    newArrival = json['new_arrival'];
    topSales = json['top_sales'];
    deptId = json['dept_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    availability = json['availability'];
    discount = json['discount'];
    vendorId = json['vendor_id'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['brand'] = this.brand;
    data['description'] = this.description;
    data['quantity'] = this.quantity;
    data['rate'] = this.rate;
    data['prev_price'] = this.prevPrice;
    data['sku'] = this.sku;
    data['image'] = this.image;
    data['tags'] = this.tags;
    data['featured'] = this.featured;
    data['new_arrival'] = this.newArrival;
    data['top_sales'] = this.topSales;
    data['dept_id'] = this.deptId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['availability'] = this.availability;
    data['discount'] = this.discount;
    data['vendor_id'] = this.vendorId;
    data['deleted_at'] = this.deletedAt;
    return data;
  }



  static List<FeaturedProductsModel> allResponse(data){
    return (data as List )
        .map((e)=>FeaturedProductsModel.fromJson(e))
        .toList();
  }



}
