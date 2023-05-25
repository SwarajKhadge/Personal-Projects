import 'package:shopping_app/grocery_item.dart';

class ItemList {
  List<String> pictureUrls = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQG1FkBrCS6gRsblaw5FIxCki1Lm0VS0HQFSw&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSG8J70-c4b--qI3o2qXzSnlqfmJc5stGBCnA&usqp=CAU',
    'https://www.jiomart.com/images/product/600x600/490031708/silver-coin-traditional-chakki-atta-10-kg-product-images-o490031708-p490031708-0-202206241206.jpg',
    'https://www.jiomart.com/images/product/600x600/490031707/silver-coin-traditional-chakki-atta-5-kg-product-images-o490031707-p490031707-0-202206241206.jpg',
    'https://www.jiomart.com/images/product/600x600/491349650/sharbati-wheat-10-kg-product-images-o491349650-p491349650-0-202205172239.jpg',
    'https://www.jiomart.com/images/product/600x600/491349651/lokwan-wheat-10-kg-product-images-o491349651-p491349651-0-202203170402.jpg',
    'https://5.imimg.com/data5/SELLER/Default/2021/4/UG/ZL/QA/13640528/kolam-steam-rice-250x250.png',
    'https://5.imimg.com/data5/SELLER/Default/2022/8/LA/BM/IK/56234373/ramarajyam-black-raw-kolam-bullet-rice-250x250.jpg',
    'https://www.jiomart.com/images/product/600x600/491349730/surti-kolam-rice-10-kg-product-images-o491349730-p491349730-0-202205172238.jpg',
    'https://www.jiomart.com/images/product/600x600/490005504/india-gate-mogra-basmati-rice-10-kg-product-images-o490005504-p490005504-0-202305112150.jpg',
    'https://www.jiomart.com/images/product/600x600/490005637/daawat-super-basmati-rice-5-kg-product-images-o490005637-p490005637-0-202203170342.jpg',
    'https://cdn.shopify.com/s/files/1/0402/6869/3669/products/black_1_1024x1024@2x.png?v=1641405574',
    'https://cdn.shopify.com/s/files/1/2598/1404/products/Black_rice_front_800x.jpg?v=1681716247',
    'https://5.imimg.com/data5/SELLER/Default/2023/5/309242645/TQ/PX/WF/16692382/organic-ambemohar-rice-white-cleaned-tested-certified-organic-250x250.jpg',
    'https://5.imimg.com/data5/SELLER/Default/2021/12/YY/LE/HS/3635811/whatsapp-image-2021-12-27-at-1-00-51-pm-1--250x250.jpeg',
    'https://5.imimg.com/data5/SELLER/Default/2022/4/UG/MZ/TW/88400203/moong-dal-250x250.jpg',
    'https://5.imimg.com/data5/JS/CH/MY-32099850/white-urad-dal-500x500.jpg',
    'https://5.imimg.com/data5/ML/QY/MY-16624432/mogar-dal-250x250.jpg'
  ];

  List<int> pricePerUnitOfEach = [
    422,
    211,
    428,
    215,
    419,
    369,
    53 * 25,
    65 * 25,
    780,
    629,
    649,
    1200,
    300,
    81 * 5,
    51 * 5,
    90,
    59,
    94
  ];
  List<String> names = [
    'Aashirvaad Superior MP Wheat Atta: 10 kgs',
    'Aashirvaad Superior MP Wheat Atta: 5 Kgs',
    'Silver Coin Atta 10 kgs',
    'Silver Coin Atta 5 kgs',
    'Sharbati Wheat 10 kg',
    'Lokwan Wheat 10 kg',
    'Master Cook Kolam Steam Rice(Kolam)',
    'Golden Ramarajyam Black(Kolam)',
    'Surti Kolam Rice 10 kg',
    'India Gate Mogra Basmati Rice 10 kg',
    'Daawat Super Basmati Rice 5 kg',
    'Organic Black Rice (5 KG Pack)',
    'Black rice 1kg',
    'Satvyk Organic Ambemohar Rice (5kg)',
    'Pari Gold Indrayani Rice(5 kgsx)',
    'Yellow Naturals Moong Dal',
    'White Urad Dal',
    'Murlidhar Sons Yellow Washed toor dal'
  ];
  List<int> categories = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  ]; //18
  List<GroceryItem> itemList = [];

  List<GroceryItem> listgiver() {
    for (int i = 0; i < pictureUrls.length; i++) {
      itemList.add(GroceryItem(
          pictureUrls[i], names[i], pricePerUnitOfEach[i], 0, categories[i]));
    }
    return itemList;
  }
}
