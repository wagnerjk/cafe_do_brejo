import 'package:cafe_do_brejo/app/views/widgets/header/model/menu_enum.dart';
import 'package:cafe_do_brejo/app/views/widgets/header/model/menu_model.dart';
import 'package:cafe_do_brejo/app/views/widgets/header/model/menu_model_extension.dart';
import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  final Size size;
  final void Function(int) pageClick;
  const Header({required this.size, required this.pageClick, super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  var color = Colors.black;
  late List<MenuModel> listMenus;

  void _initializeListMenus() {
    listMenus = MenuEnum.values
        .map((menuEnum) => MenuModel(
              menuEnum: menuEnum,
              isActive: false,
              isSelected: false,
            ))
        .toList();
  }

  @override
  void initState() {
    _initializeListMenus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: widget.size.height * 0.15,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Image.asset(
              'assets/images/LOGO_CAFE_DO_BREJO.png',
            ),
          ),
          Row(
            children: [
              for (final menuModel in listMenus)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: InkWell(
                    enableFeedback: true,
                    onTap: () {
                      widget.pageClick(menuModel.menuEnum.id);
                      setState(() {
                        listMenus.map((e) => e.menuEnum.id != menuModel.menuEnum.id ? e.isSelected = false : e.isSelected = true).toList();
                      });
                    },
                    child: MouseRegion(
                      onHover: (_) {
                        setState(() {
                          menuModel.isActive = true;
                        });
                      },
                      onExit: (_) {
                        setState(() {
                          menuModel.isActive = false;
                        });
                      },
                      child: Text(
                        menuModel.menuEnum.name,
                        style: TextStyle(
                          fontFamily: 'Avallon',
                          fontSize: 30,
                          color: menuModel.getTextColor(),
                        ),
                      ),
                    ),
                  ),
                )
            ],
          )
        ],
      ),
    );
  }
}
