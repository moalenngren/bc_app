import 'package:flutter/material.dart';
import 'package:bc_app/styles.dart';
import 'package:bc_app/layouts/common_layouts.dart';
import 'package:bc_app/layouts/build_shop_item_layout.dart';
import 'package:bc_app/pages/pop_ups.dart';

class ShopItem {
  String title;
  String description;
  String imageString;
  int price;
  bool isInStock;
  bool isAddedToCart;
  bool hasVariations;
  List variations;
  String chosenVariation;
  int amountInCart;

  ShopItem(
      this.title,
      this.description,
      this.imageString,
      this.price,
      this.isInStock,
      this.isAddedToCart,
      this.hasVariations,
      this.variations,
      this.chosenVariation,
      this.amountInCart);
}

class ShopPage extends StatefulWidget {
  ShopPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ShopPageState createState() => new _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  List<ShopItem> myCart = [];
  //CREATING SHOP ITEMS
  List<ShopItem> allShopItems = [
    new ShopItem(
        "White T-shirt",
        "Unisex in sizes S-XXL",
        "assets/images/white_tshirt.png",
        150,
        true,
        false,
        true,
        ["Small", "Medium", "Large", "X-Large", "XX-Large"],
        "",
        0),
    new ShopItem("White Totebag", "50 x 60 cm, eco material",
        "assets/images/white_bag.png", 70, true, false, false, [], "", 0),
    new ShopItem(
        "Don't Want To Dance",
        "EP, soft CD cover, released 2018",
        "assets/images/dont_want_to_dance.jpeg",
        150,
        true,
        false,
        false,
        [],
        "",
        0),
  ];

  @override
  Widget build(BuildContext context) {
    void setAmount(int nr, ShopItem item) {
      if (nr != null && nr > 0) {
        setState(() {
          item.amountInCart = nr;
          item.isAddedToCart = !item.isAddedToCart;
          myCart.add(item);
          print("Added " + item.title + " to cart");
        });
      } else {
        print("Cancelled adding to cart");
      }
      print("My cart consists of " + myCart.length.toString() + " objects");
    }

    //ADD TO CART
    void addToCart(ShopItem item) {
      setState(() {
        if (item.isAddedToCart) {
          myCart.remove(item);
          print("Removed " + item.title + " from cart");
          item.isAddedToCart = !item.isAddedToCart;
          item.amountInCart = 0;
          print("My cart consists of " + myCart.length.toString() + " objects");
        } else if (!item.isAddedToCart && item.hasVariations) {
          print("Popup with alternatives");
          item.isAddedToCart = !item.isAddedToCart;
          myCart.add(item);
        } else {
          print("Popup with amount");
          shopItemAmountPicker(item, context, setAmount);
        }
      });
    }

//SHOP HEADER
    List<Widget> widgetList = [];
    widgetList.add(headerText("SHOP"));

//BUILD ALL SHOP ITEM LAYOUTS
    for (ShopItem item in allShopItems) {
      widgetList.add(buildShopItemLayout(item, addToCart));
      if (allShopItems.length != (allShopItems.indexOf(item) + 1)) {
        widgetList.add(smallLine(height: 0.5, color: yellow, margin: 0.0));
      }
    }

    return new Scaffold(
      appBar: new AppBar(
        title: apptitle("Shop"),
        backgroundColor: appBarColor,
        actions: <Widget> [appBarIconsInfo(context), appBarIconsSettings(context), appBarIconsProfile(context)]),
      body: ListView(
          padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
          children: widgetList),
      backgroundColor: backgroundColor,
    );
  }
}
