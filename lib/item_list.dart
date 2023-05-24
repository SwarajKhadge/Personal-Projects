import 'package:shopping_app/grocery_item.dart';

class ItemList {
  List<String> pictureUrls = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQG1FkBrCS6gRsblaw5FIxCki1Lm0VS0HQFSw&usqp=CAU',
'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSG8J70-c4b--qI3o2qXzSnlqfmJc5stGBCnA&usqp=CAU',
  ];

  List<int> pricePerUnitOfEach = [422,211
  ];
  List<String> names = ['Aashirvaad Superior MP Wheat Atta: 10 kgs','Aashirvaad Superior MP Wheat Atta: 5 Kgs'];
  List<int> categories = [
    0,0
  ];
  List<GroceryItem> itemList = [];

  List<GroceryItem> listgiver() {
    for (int i = 0; i < pictureUrls.length; i++) {
      itemList.add(GroceryItem(
          pictureUrls[i], names[i], pricePerUnitOfEach[i], 0, categories[i]));
    }
    return itemList;
  }
}
