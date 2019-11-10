import 'package:flutter/material.dart';
import 'package:flutter_watch_shop/models/product.dart';
import 'package:flutter_watch_shop/router.dart' as router;
import 'package:flutter_watch_shop/utils/colors.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key key, @required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final spacer = SizedBox(height: 5.0);

    final image = Hero(tag: product.id, child: Image.asset(product.photos[0]));

    final name = Text(
      product.name.toUpperCase(),
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.bold,
      ),
    );

    final brand = Text(
      product.brand.toUpperCase(),
      style: TextStyle(fontSize: 11.0, color: Colors.grey),
    );

    final price = Text(
      "\$${product.price.toString()}",
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.0),
      child: MaterialButton(
        color: AppColors.primaryLightColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        onPressed: () => Navigator.pushNamed(
            context, router.productDetailsViewRoute,
            arguments: product),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              image,
              spacer,
              name,
              spacer,
              spacer,
              brand,
              spacer,
              price
            ],
          ),
        ),
      ),
    );
  }
}
