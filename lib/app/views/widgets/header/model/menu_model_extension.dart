import 'package:cafe_do_brejo/app/views/widgets/header/model/menu_model.dart';
import 'package:flutter/material.dart';

extension ColorTextMenu on MenuModel {
  Color getTextColor() {
    if (isSelected) {
      return Colors.red[700]!;
    }
    if (isActive) {
      return Colors.red[300]!;
    }
    return Colors.black;
  }

  double getFontSize() {
    if (isSelected) {
      return 30;
    }
    return 26;
  }
}
