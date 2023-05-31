class GroceryItem {
  String pictureUrl;
  int quantity;
  int pricePerUnit;
  String name;
  int category;
  GroceryItem(this.pictureUrl, this.name, this.pricePerUnit, this.quantity,
      this.category);
}

class TaxInfo {
  double taxamount;
  double deliveryCharges;
  TaxInfo(this.taxamount, this.deliveryCharges);
}

class Cart {
  double totalAmount;
  String couponCode;
  Cart(this.couponCode,this.totalAmount);
}
