import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_watch_shop/global_widgets/custom_appbar.dart';
import 'package:flutter_watch_shop/models/product.dart';
import 'package:flutter_watch_shop/services/alert.service.dart';
import 'package:flutter_watch_shop/utils/colors.dart';
import 'package:flutter_watch_shop/views/product_details/widgets/color_chooser.dart';

class ProductDetailsPage extends StatefulWidget {
  final Product product;

  const ProductDetailsPage({Key key, @required this.product}) : super(key: key);

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int _selectedColorIndex = 0;
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    ScreenUtil.instance = ScreenUtil(
      width: 388,
      height: 1600,
      allowFontScaling: true,
    )..init(context);

    final multiplier = screenHeight / screenWidth;

    final spacer = SizedBox(height: 10.0);

    final image = Hero(
      tag: widget.product.id,
      child: Image.asset(
        widget.product.photos[_selectedColorIndex],
        height: ScreenUtil().setHeight(400) * multiplier,
      ),
    );

    final name = Text(
      widget.product.name.toUpperCase(),
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
      ),
    );

    final brand = Text(
      widget.product.brand.toUpperCase(),
      style: TextStyle(fontSize: 14.0, color: Colors.grey),
    );

    final chooseColor = Text(
      "Choose a Color",
      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
    );

    final colorChooser = ColorChooser(
      colors: widget.product.colors,
      selectedColorIndex: _selectedColorIndex,
      onColorSelected: (int selected) {
        setState(() {
          _selectedColorIndex = selected;
        });
      },
    );

    final top = Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 50.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.scaffoldColor,
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            name,
            spacer,
            brand,
            image,
            chooseColor,
            colorChooser
          ],
        ),
      ),
    );

    final bottom = Container(
      height: MediaQuery.of(context).size.height * 0.12, // 95.0
      color: Colors.white,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.0),
        )),
        onPressed: () {
          AlertService().showAlert(
            context: context,
            message: "${widget.product.name} has been added to cart.",
            type: AlertType.success,
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Add To Cart - ",
              style: TextStyle(
                fontSize: 22.0,
              ),
            ),
            Text(
              "\$${widget.product.price.toString()}",
              style: TextStyle(fontSize: 22.0, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(isHome: false),
      body: Column(
        children: <Widget>[top, bottom],
      ),
    );
  }
}
