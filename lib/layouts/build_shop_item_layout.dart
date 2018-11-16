import 'package:bc_app/styles.dart';
import 'package:flutter/material.dart';
import 'package:bc_app/pages/shop_page.dart';

Container buildShopItemLayout(ShopItem item, Function addToCart) {
  //TITLE, DESC, PRICE
  Column top3Texts = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          item.title,
          style:
              TextStyle(fontFamily: "Quarca", fontSize: 40.0, color: lightGrey),
          textAlign: TextAlign.left,
        ),
        Text(item.description,
            style: TextStyle(
                fontSize: 25.0, color: lightGrey, fontFamily: "Quarca")),
        Container(
            margin: EdgeInsets.only(top: 5.0),
            child: Text(item.price.toString() + " SEK",
                style: TextStyle(
                  fontFamily: "Quarca",
                  fontSize: 30.0,
                  color: yellow,
                )))
      ]);

  //CART BUTTON
  GestureDetector roundCartButton = new GestureDetector(
      onTap: () {
        print("TAPPED!");
        addToCart(item);
      },
      child: Container(
          margin: EdgeInsets.only(left: 10.0),
          decoration: new BoxDecoration(
              color: item.isAddedToCart ? orange : yellow,
              borderRadius: new BorderRadius.all(Radius.circular(25.0))),
          child: Container(
              margin: EdgeInsets.all(10.0),
              child: Icon(
                item.isAddedToCart
                    ? Icons.remove_shopping_cart
                    : Icons.add_shopping_cart,
                color: darkGrey,
              ))));

  //ADD TEXT + BUTTON
  Row addRow = Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[
      Text(item.isAddedToCart ? "Remove" : "Add",
          style: TextStyle(
              fontSize: 22.0,
              fontFamily: "Quarca",
              color: item.isAddedToCart ? orange : yellow)),
      roundCartButton
    ],
  );

  //IMAGE
  GestureDetector image = GestureDetector(
    onTap: (){
      //imagePopUp;
      print("Tapped image");
    },
child: Image.asset(item.imageString)
  );

  return Container(
      //height: 200.0,
      margin: EdgeInsets.symmetric(vertical: 20.0),
      decoration: new BoxDecoration(
          //color: orange,
          borderRadius: new BorderRadius.all(Radius.circular(35.0))),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(flex: 1, child: image),
            Expanded(
                flex: 2,
                child: Container(
                    margin: EdgeInsets.only(left: 20.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[top3Texts, addRow])))
          ],
        ),
      )) /*)*/;
}
