
class cartItemModel {
  int id;
  String userId;
  String grandTotal;
  String checkout;
  String createdAt;
  String updatedAt;
  String discount;
  List<CartItem> cartItem;

  cartItemModel(
      {this.id,
        this.userId,
        this.grandTotal,
        this.checkout,
        this.createdAt,
        this.updatedAt,
        this.discount,
        this.cartItem});

  cartItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    grandTotal = json['grand_total'];
    checkout = json['checkout'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    discount = json['discount'];
    if (json['cart_item'] != null) {
      cartItem = new List<CartItem>();
      json['cart_item'].forEach((v) {
        cartItem.add(new CartItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['grand_total'] = this.grandTotal;
    data['checkout'] = this.checkout;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['discount'] = this.discount;
    if (this.cartItem != null) {
      data['cart_item'] = this.cartItem.map((v) => v.toJson()).toList();
    }
    return data;
  }

  // static List<cartItemModel> allResponse(data) {
  //   return (data as List)
  //       .map((e) => cartItemModel.fromJson(e))
  //       .toList();
  // }




}

class CartItem {
  int id;
  String cartId;
  String productId;
  String quantity;
  String createdAt;
  String updatedAt;
  dynamic discount;
  Product product;

  CartItem(
      {this.id,
        this.cartId,
        this.productId,
        this.quantity,
        this.createdAt,
        this.updatedAt,
        this.discount,
        this.product});

  CartItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cartId = json['cart_id'];
    productId = json['product_id'];
    quantity = json['quantity'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    discount = json['discount'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cart_id'] = this.cartId;
    data['product_id'] = this.productId;
    data['quantity'] = this.quantity;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['discount'] = this.discount;
    if (this.product != null) {
      data['product'] = this.product.toJson();
    }
    return data;
  }
}

class Product {
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
  dynamic discount;
  String vendorId;
  dynamic deletedAt;

  Product({this.id,
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

  Product.fromJson(Map<String, dynamic> json) {
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

}


