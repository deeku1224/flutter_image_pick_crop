import 'package:flutter/material.dart';
import 'package:flutter_image_pick_crop/widgets/blurredSmallContainer.dart';
import 'package:flutter_image_pick_crop/screens/singlesPage.dart';

class OfferCard extends StatelessWidget {
  final product;
  const OfferCard({
    Key key,
    this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: product.length,
        itemBuilder: (context, index) => BlurredSmallContainer(
          onPress: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SinglesPage(
                        isFav: product[index].isFavourite,
                        product: product[index])));
          },
          index: index,
          name: product[index].name,
          image: product[index].image,
          price: product[index].price,
        ),
      ),
    );
  }
}
