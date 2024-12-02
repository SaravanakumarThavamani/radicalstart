import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import 'detail.dart';
import 'house.dart';

class HouseDetails extends StatelessWidget {
  const HouseDetails({
    super.key,
    required this.width,
    required this.house,
    required this.isVertical,
  });

  final HouseModel house;
  final double width;
  final bool isVertical;

  @override
  Widget build(BuildContext context) {
    final isPerfect = width < 500;

    Card mycard = Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        width: width,
        height: isVertical && !isPerfect ? 120 : 200,
        child: Stack(
          clipBehavior: Clip.antiAlias,
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(
                house.imageUrl,
              ),
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: IconButton(
                  padding: const EdgeInsets.all(5),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_rounded,
                    size: 25,
                    color: Color.fromARGB(255, 163, 163, 163),
                  ),
                  style: IconButton.styleFrom(backgroundColor: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    Container details = Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      width: isVertical ? width - 50 : width - 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Constraints(amount: house.amount, rating: house.rating),
          Text(
            house.title,
            style: const TextStyle(
              fontSize: 17,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            'Private room / ${house.availableBeds} beds',
            style: const TextStyle(color: Color.fromARGB(186, 109, 109, 109)),
          )
        ],
      ),
    );

    return InkWell(
      onTap: () {},
      splashColor: Colors.transparent,
      borderRadius: BorderRadius.circular(20),
      child: isVertical && !isPerfect
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(flex: 1, child: mycard),
                Flexible(flex: 2, child: details),
              ],
            )
          : Column(
              children: [
                isVertical
                    ? mycard
                    : Expanded(
                        child: mycard,
                      ),
                details,
              ],
            ),
    );
  }
}
