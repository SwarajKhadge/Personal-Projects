import 'package:shopping_app/grocery_item.dart';
//category ka no.
// dailyFoodItems:0
// bath:1
// snacks=2
//toys:3
// washroom:4;
// clothes:5;
// electronics:6;
// furniture:7;
//All:8

class ItemList {
  Map<int, double> taxPercentage = {};
  List<double> taxInfo = [5, 18, 12, 12, 28, 12, 28, 12];

  ItemList() {
    for (int i = 0; i < 8; i++) {
      taxPercentage[i] = taxInfo[i];
    }

    for (int i = 0; i < pictureUrls.length; i++) {
      completeItemList.add(GroceryItem(
          pictureUrls[i],
          names[i],
          pricePerUnitOfEach[i],
          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.',
          categories[i]));
    }
  }
  List<String> pictureUrls = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQG1FkBrCS6gRsblaw5FIxCki1Lm0VS0HQFSw&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSC7xxznldNDxVsrMn44bMKj2P4h9F7uLMrKQ&usqp=CAU',
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
    'https://5.imimg.com/data5/ML/QY/MY-16624432/mogar-dal-250x250.jpg',
    'https://cdn.shopify.com/s/files/1/0119/2742/0992/products/2022-4-9-15-20-35_product_1_1649497835367_9d631bfd-c542-45fa-af61-741fd139e156_2000x.jpg?v=1667893593',
    'https://cdn.shopify.com/s/files/1/0119/2742/0992/products/coriander_powder_1920_2000x.jpg?v=1667893443',
    'https://cdn.shopify.com/s/files/1/0119/2742/0992/products/cardamom_elaichi_ip_1920_398e7018-f847-4bc8-b7cf-62bf9dc3c5af_large.jpg?v=1676755333',
    'https://5.imimg.com/data5/SELLER/Default/2023/2/LV/AF/RB/632820/kamal-hot-red-chilli-powder-250x250.jpg',
    'https://5.imimg.com/data5/VM/GS/MY-45310343/black-mustard-seeds-250x250.jpg',
    'https://5.imimg.com/data5/SELLER/Default/2023/1/OR/OA/VJ/105236237/turmeric-powder-500x500.png',
    'https://www.jiomart.com/images/product/600x600/490000057/saffola-gold-pro-healthy-lifestyle-ricebran-based-blended-oil-1-l-product-images-o490000057-p490000057-0-202304271657.jpg',
    'https://www.jiomart.com/images/product/600x600/490011384/saffola-gold-pro-healthy-ricebran-based-blended-oil-15-l-product-images-o490011384-p490011384-0-202207131811.jpg',
    'https://5.imimg.com/data5/ANDROID/Default/2020/11/RK/CY/IT/112392915/product-jpeg-1000x1000.jpg',
    'https://5.imimg.com/data5/SELLER/Default/2023/4/298917000/WZ/NA/SY/134635974/healthy-nashta-chatpata-mix-130-gms-1000x1000.png',
    'https://www.everythingbetter.in/wp-content/uploads/2022/08/lays-magic-masala.webp',
    'https://www.everythingbetter.in/wp-content/uploads/2022/08/classic-salted-768x768.jpg',
    'https://www.everythingbetter.in/wp-content/uploads/2022/08/lays-cream-and-onion.jpg',
    'https://www.everythingbetter.in/wp-content/uploads/2022/08/sizzling-barbeque.jpg',
    'https://www.bigbasket.com/media/uploads/p/l/205721_2-garden-firali-chivda-crispy-crunchy.jpg',
    'https://www.jiomart.com/images/product/600x600/491961317/dove-cream-beauty-bathing-bar-125-g-buy-4-get-1-free-product-images-o491961317-p590287499-0-202203152303.jpg',
    'https://www.jiomart.com/images/product/600x600/490002255/santoor-sandal-turmeric-soap-125-g-pack-of-4-product-images-o490002255-p490002255-0-202203150435.jpg',
    'https://www.jiomart.com/images/product/600x600/491019490/medimix-ayurvedic-18-herbs-classic-soap-125-g-buy-4-get-1-free-product-images-o491019490-p491019490-0-202211111852.jpg',
    'https://www.bigbasket.com/media/uploads/p/l/40242273_1-dove-deeply-moisture-body-wash-nutrium-moisture-100-gentle-cleanser.jpg',
    'https://www.jiomart.com/images/product/600x600/490360973/fiama-blackcurrant-bearberry-shower-gel-250-ml-product-images-o490360973-p490360973-0-202203141905.jpg',
    'https://www.jiomart.com/images/product/600x600/490920576/nivea-lemon-oil-shower-gel-250-ml-product-images-o490920576-p490920576-0-202211031913.jpg',
    'https://www.fnp.com/images/pr/l/v20190718173459/pony-unicorn-soft-toy_1.jpg',
    'https://www.fnp.com/images/pr/l/v20190718230450/cuddly-love-teddy-bear_1.jpg',
    'https://www.jiomart.com/images/product/420x420/rvf65enhfw/ms-little-finger-set-of-6-big-size-full-action-toy-figure-jungle-cartoon-wild-animal-toys-figure-playing-set-for-kids-current-animals-bear-rhino-elephant-leopard-tiger-lion-toys-for-children-product-images-orvf65enhfw-p597754448-0-202301211505.jpg',
    'https://n2.sdlcdn.com/imgs/k/n/b/WISHKEY-Mini-Kitchenware-Set-With-SDL288304829-1-66703.jpg',
    'https://www.bigbasket.com/media/uploads/p/l/40056937_4-harpic-toilet-cleaner-flushmatic-clear-blue.jpg',
    'https://www.bigbasket.com/media/uploads/p/l/263754_15-harpic-power-plus-disinfectant-toilet-cleaner-liquid-original.jpg',
    'https://www.bigbasket.com/media/uploads/p/l/40017766_14-harpic-disinfectant-bathroom-cleaner-liquid-floral.jpg',
    'https://www.bigbasket.com/media/uploads/p/l/40138336_3-odonil-air-freshener-zipper-super-saver.jpg',
    'https://assets.ajio.com/medias/sys_master/root/20230524/shT2/646e3154d55b7d0c63d62212/-473Wx593H-460789301-blue-MODEL.jpg',
    'https://sslimages.shoppersstop.com/sys-master/images/h19/h57/28149279719454/INF-80_ICE.jpg_230Wx334H',
    'https://sslimages.shoppersstop.com/sys-master/images/ha4/hc3/29121650884638/S23LFCASAPT44WH_WHITE_alt4.jpg_2000Wx3000H',
    'https://assets.ajio.com/medias/sys_master/root/hc1/hdc/14269753786398/-473Wx593H-460481967-black-MODEL.jpg',
    'https://5.imimg.com/data5/SELLER/Default/2022/10/JM/DD/VJ/13261298/35w-high-watt-dob-bulb-hybrid-with-box-250x250.jpg',
    'https://4.imimg.com/data4/JX/UW/MY-13345152/ac-led-tube-light-1000x1000.jpg',
    'https://5.imimg.com/data5/SELLER/Default/2023/4/298163054/SO/MZ/RA/124905300/whatsapp-image-2023-03-31-at-8-25-01-pm-1--500x500.jpeg',
    'https://www.bigbasket.com/media/uploads/p/l/106417_2-eveready-carbon-zinc-battery-red-hd-aa-1015.jpg',
    'https://www.jiomart.com/images/product/600x600/490809579/eveready-red-1012-aaa-carbon-zinc-batteries-pack-of-10-product-images-o490809579-p490809579-0-202207131317.jpg',
    'https://5.imimg.com/data5/CW/TM/WT/SELLER-10297208/plastic-rattan-stool-250x250.jpg',
    'https://www.furniturewallet.com/media/catalog/product/cache/23/image/1000x1000/9df78eab33525d08d6e5fb8d27136e95/0/8/08_22.jpg',
    'https://ii3.pepperfry.com/media/catalog/product/a/v/1100x1210/avian-sheesham-wood-2-seater-dining-set-in-provincial-teak-finish-avian-sheesham-wood-2-seater-dinin-tfta0z.jpg'
  ];

  List<double> pricePerUnitOfEach = [
    422.0,
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
    94,
    90,
    73,
    320,
    330,
    52,
    250,
    159,
    2649,
    135,
    49,
    10,
    10,
    10,
    20,
    40,
    347,
    195,
    175,
    117,
    129,
    155,
    499,
    650,
    500,
    550,
    69,
    95,
    105,
    148,
    580,
    749,
    799,
    300,
    147,
    180,
    5500,
    126,
    125,
    900,
    4999,
    25000
  ];
  List<String> names = [
    'Aashirvaad Superior MP Wheat Atta: 10kgs',
    'Aashirvaad Superior MP Wheat Atta: 5Kgs',
    'SilverCoin Atta 10kgs',
    'SilverCoin Atta 5kgs',
    'SharbatiWheat 10kg',
    'LokwanWheat 10kg',
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
    'Murlidhar Sons Yellow Washed toor dal',
    'Conscious Food Cumin Seeds (Jeera) 100g',
    'Conscious Food Coriander Powder 100g',
    'Conscious Food Cardamom 50g',
    '1 Kg Hathi Kamal Red Chilli powder',
    'Black Mustard Seed(1kgs)',
    'Turmeric Powder',
    'Saffola Gold Pro Healthy Lifestyle RiceBran\n Based Blended Oil 1 L',
    'Saffola Gold Pro healthy RiceBran Based\n Blended Oil 15 L',
    'Shree Food Mix Farsan(1kg)',
    'Healthy Nashta Chatpata Mix 130g',
    'India\'s Magic Masala',
    'Classic Salted',
    'Cream & Onion',
    'Sizzling Barbeque',
    'Garden Farali Chivda 80 g',
    'Dove Cream Beauty Bathing Bar 125 g \n(Buy 4 Get 1 Free)',
    'Santoor Sandal & Turmeric Soap 125 g\n (Pack of 4)',
    'Medimix Ayurvedic 18-Herbs Classic Soap 125 g \n(Buy 4 Get 1 Free)',
    'Dove Deeply Moisture Body Wash\nNutrium Moisture, 100% Gentle Cleanser, 250 ml',
    'Fiama Blackcurrant & Bearberry Shower Gel 250 ml',
    'Nivea Lemon & Oil Shower Gel 250 ml',
    'Pony Unicorn Soft Toy',
    'Teddy Bear',
    'Animal Toy Set',
    'Kitchen Set',
    'Harpic Toilet Cleaner - Flushmatic, Clear Blue, 50 g',
    'Harpic Disinfectant Toilet Cleaner Liquid,\n Original, 500 ml',
    'Harpic Disinfectant Bathroom Cleaner Liquid,\n Floral, 500 ml',
    'Odonil Zipper Air Freshener - Joyful Lavender,\n Soulful Jasmine & Blissful Citrus, 30 g Pack of 3',
    'Lightly Washed Slim Fit Jeans size 34',
    'Infuse Blend Crop Fit Men\'s Jeans',
    'Life Printed Cotton Relaxed Fit Men\'s T-Shirts',
    'Solid Crew-Neck T-shirt',
    'Bhagwati Led Bulb',
    'Shakti LED tube',
    'Zoko Food Processor',
    'Eveready AA Battery (10pcs)',
    'Eveready Red 1012 AAA Battery',
    'Plastic Rattan Stool',
    'Wooden Chair',
    'Wooden Table'
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
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    2,
    2,
    2,
    2,
    2,
    2,
    2,
    1,
    1,
    1,
    1,
    1,
    1,
    3,
    3,
    3,
    3,
    4,
    4,
    4,
    4,
    5,
    5,
    5,
    5,
    6,
    6,
    6,
    6,
    6,
    7,
    7,
    7
  ];

  List<GroceryItem> completeItemList = [];
  List<GroceryItem> toBeShownItemList = [];
  List<GroceryItem> listGiver(int a) {
    switch (a) {
      case 0:
        toBeShownItemList.clear();
        for (GroceryItem gI in completeItemList) {
          if (gI.category == 0) {
            toBeShownItemList.add(gI);
          }
        }
        return toBeShownItemList;

      case 1:
        toBeShownItemList.clear();
        for (GroceryItem gI in completeItemList) {
          if (gI.category == 1) {
            toBeShownItemList.add(gI);
          }
        }
        return toBeShownItemList;
      case 2:
        toBeShownItemList.clear();
        for (GroceryItem gI in completeItemList) {
          if (gI.category == 2) {
            toBeShownItemList.add(gI);
          }
        }
        return toBeShownItemList;
      case 3:
        toBeShownItemList.clear();
        for (GroceryItem gI in completeItemList) {
          if (gI.category == 3) {
            toBeShownItemList.add(gI);
          }
        }
        return toBeShownItemList;
      case 4:
        toBeShownItemList.clear();
        for (GroceryItem gI in completeItemList) {
          if (gI.category == 4) {
            toBeShownItemList.add(gI);
          }
        }
        return toBeShownItemList;
      case 5:
        toBeShownItemList.clear();
        for (GroceryItem gI in completeItemList) {
          if (gI.category == 5) {
            toBeShownItemList.add(gI);
          }
        }
        return toBeShownItemList;
      case 6:
        toBeShownItemList.clear();
        for (GroceryItem gI in completeItemList) {
          if (gI.category == 6) {
            toBeShownItemList.add(gI);
          }
        }
        return toBeShownItemList;
      case 7:
        toBeShownItemList.clear();
        for (GroceryItem gI in completeItemList) {
          if (gI.category == 7) {
            toBeShownItemList.add(gI);
          }
        }
        return toBeShownItemList;

      default:
        toBeShownItemList.clear();
        return completeItemList;
    }
  }
}
