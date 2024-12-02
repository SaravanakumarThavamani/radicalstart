import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project1/view/houses.dart';
import 'package:project1/view/title.dart';
import 'Controller/housedetail.dart';
import 'view/place.dart';

void main() {
  runApp(HouseRentalScreen());
}

class HouseRentalScreen extends StatefulWidget {
  const HouseRentalScreen({super.key});

  @override
  State<HouseRentalScreen> createState() => _HouseRentalScreenState();
}

class _HouseRentalScreenState extends State<HouseRentalScreen> {
  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.of(context).size.width;
    final isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    final isPerfectFit = widthSize < 500;

    return AnnotatedRegion(
      value: isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: const Color.fromARGB(34, 201, 170, 255),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const Text(
                          'Explore the world! By Travelling',
                          style: TextStyle(
                              fontSize: 27, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                style: const TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  hintText: 'Where did you go?',
                                  border: UnderlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(20)),
                                  contentPadding:
                                      const EdgeInsets.only(top: 12),
                                  filled: true,
                                  fillColor: Colors.white,
                                  prefixIcon: const Icon(
                                    Icons.search,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            IconButton(
                              style: IconButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  padding: const EdgeInsets.all(10),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              onPressed: () {},
                              icon: const Icon(
                                Icons.menu,
                                size: 28,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TitleText(
                    title: 'Popular locations',
                  ),
                  SizedBox(
                    height: 180,
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      scrollDirection: Axis.horizontal,
                      itemCount: placeList.length,
                      itemBuilder: (context, index) {
                        return Places(
                          place: placeList[index],
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const TitleText(
                    title: 'Recommended',
                  ),
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      scrollDirection: Axis.horizontal,
                      itemCount: houseList.length,
                      itemBuilder: (context, index) {
                        return HouseDetails(
                          house: houseList[index],
                          width: 280,
                          isVertical: false,
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: double.infinity,
                      height: isPerfectFit ? 250 : 300,
                      margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.all(20),
                      constraints: const BoxConstraints(maxWidth: 450),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(113, 112, 112, 112),
                        image: const DecorationImage(
                          opacity: 0.8,
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://img.freepik.com/free-photo/smiling-attractive-young-woman-holding-white-cup-drinking-coffee_171337-20134.jpg'),
                        ),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: isPerfectFit
                                ? widthSize - 250
                                : widthSize - 550,
                            child: const Text(
                              'Hosting Fee for as low as 1%',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          FilledButton(
                            onPressed: () {},
                            style: FilledButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 232, 48, 110)),
                            child: const Text('Become a Host'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const TitleText(title: 'Most Viewed'),
                  ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: mostViewedHouses.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: HouseDetails(
                          width: widthSize,
                          house: mostViewedHouses[index],
                          isVertical: true,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
