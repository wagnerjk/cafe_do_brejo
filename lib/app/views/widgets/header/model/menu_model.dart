import 'package:cafe_do_brejo/app/views/widgets/header/model/menu_enum.dart';

class MenuModel {
  final MenuEnum menuEnum;
  bool isActive;
  bool isSelected;

  MenuModel({required this.menuEnum, required this.isActive, required this.isSelected});
}
