import 'package:flutter/cupertino.dart';

import 'model/menu_model.dart';

class HeaderController extends ChangeNotifier {
  static final HeaderController _instance = HeaderController._();
  HeaderController._();
  factory HeaderController() => HeaderController._instance;

  final List<MenuModel> _listMenus = <MenuModel>[];
  int _idMenuSelected = 0;

  List<MenuModel> get getListMenus => _listMenus;

  void addListMenu(List<MenuModel> menulist) {
    _listMenus.addAll(menulist);
    notifyListeners();
  }

  int get idMenuSelected => _idMenuSelected;

  void setSelected(int idMenu) {
    _idMenuSelected = idMenu;
    _listMenus.map((menuModel) => menuModel.menuEnum.id != idMenu ? menuModel.isSelected = false : menuModel.isSelected = true).toList();
    notifyListeners();
  }
}
