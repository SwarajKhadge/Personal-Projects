import 'package:flutter/material.dart';
import 'package:shopping_app/coupun_infomartion.dart';

class DisplayCoupun extends StatefulWidget {
  const DisplayCoupun({super.key});

  @override
  State<DisplayCoupun> createState() => _DisplayCoupunState();
}

class _DisplayCoupunState extends State<DisplayCoupun> {
  int i = 0;
  static Color customColorgiver(int r, int g, int b, int a) {
    return Color.fromARGB(a, r, g, b);
  }

  CoupunList coupunList = CoupunList();
  @override
  Widget build(BuildContext context) {
    List<Color> colorsList = [
      customColorgiver(223, 239, 229, 255),
      customColorgiver(239, 229, 211, 255),
      customColorgiver(202, 222, 251, 255)
    ];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          if (i == 3) {
            i = 0;
          }

          return Container(
            width: 500,
            height: 150,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: colorsList[i++]),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Enjoy an Offer of ${CoupunList.coupunList[index].percentage}% ',
                      style: const TextStyle(
                          color: Colors.green,
                          fontFamily: 'a',
                          fontSize: 30,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Coupon Code: ${CoupunList.coupunList[index].text} ',
                      style: const TextStyle(
                          color: Colors.green,
                          fontFamily: 'a',
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'This offer is valid for orders with minimum price:${CoupunList.coupunList[index].minimumPrice}',
                      style: const TextStyle(
                          color: Colors.grey,
                          fontFamily: 'a',
                          fontSize: 12,
                          fontWeight: FontWeight.w300),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(colors: [
                              Color.fromARGB(255, 99, 222, 152),
                              Color.fromARGB(255, 41, 175, 100),
                            ]),
                            borderRadius: BorderRadius.circular(26)),
                        height: 50,
                        width: 200,
                        child: const Center(
                          child: Text(
                            'Apply',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'a',
                                fontSize: 12,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Image.asset('images/coupun.png')
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 20);
        },
        itemCount: CoupunList.coupunList.length,
      ),
    );
  }
}
