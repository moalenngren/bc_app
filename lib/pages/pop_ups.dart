import 'package:flutter/material.dart';
import 'package:bc_app/styles.dart';
import 'package:bc_app/layouts/common_layouts.dart';
import 'package:bc_app/pages/shop_page.dart';
import 'package:numberpicker/numberpicker.dart';

void shopItemAmountPicker(ShopItem item, BuildContext context, Function setAmount) {
    showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return new NumberPickerDialog.integer(
            minValue: 1,
            maxValue: 10,
            title: new Text("Choose amount"),
            initialIntegerValue: 1,
          );
        }).then((int value) {
      if (value != null && value > 0) {
            print("Chose amount " + value.toString());
            setAmount(value, item);
      } else {
        print("Chose cancel (from popup)");
        //setAmount(0, item);
      }
    });
  }