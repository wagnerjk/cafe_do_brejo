import 'package:cafe_do_brejo/app/views/contact_page.dart';
import 'package:cafe_do_brejo/app/views/first_page.dart';
import 'package:cafe_do_brejo/app/views/about_page.dart';
import 'package:cafe_do_brejo/app/views/products_page.dart';
import 'package:cafe_do_brejo/app/views/widgets/header/header.dart';
import 'package:cafe_do_brejo/app/views/widgets/header/model/menu_enum.dart';
import 'package:cafe_do_brejo/app/views/widgets/header/model/menu_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'widgets/header/header_controller.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _pageController = PageController();
  final ValueNotifier<bool> _headerVisible = ValueNotifier(false);
  final _headerController = HeaderController();

  List<Widget> _getWidgetList() {
    return const [FirstPage(), AboutPage(), ProductsPage(), ContactPage()];
  }

  void _goToPage(int page) {
    _pageController.animateToPage(page, duration: const Duration(milliseconds: 600), curve: Curves.ease);
    _headerController.setSelected(page);
  }

  initializeListMenus() {
    var p = MenuEnum.values.map((menuEnum) => MenuModel(menuEnum: menuEnum, isActive: false, isSelected: false)).toList();
    _headerController.addListMenu(p);
    // MenuEnum.values.map((menuEnum) => _headerController.addMenu(MenuModel(menuEnum: menuEnum, isActive: false, isSelected: false)));
  }

  @override
  void initState() {
    initializeListMenus();
    // _headerController.initializeListMenus();
    _pageController.addListener(() {
      if (_pageController.position.userScrollDirection != ScrollDirection.idle) {
        final page = _pageController.page ?? 0;
        _headerVisible.value = page > 0.7 ? true : false;
        if ((page - page.toInt()) > 0.9) {
          var idPage = page.toInt() + 1;
          if (_pageController.position.userScrollDirection == ScrollDirection.forward) {
            idPage = page.toInt();
          }
          if (idPage != _headerController.idMenuSelected) {
            _headerController.setSelected(idPage);
          }
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _headerVisible.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            //   allowImplicitScrolling: true,
            pageSnapping: false,
            scrollDirection: Axis.vertical,
            children: _getWidgetList(),
            // onPageChanged: (idMenu) {
            //   _headerController.setSelected(idMenu);
            // },
          ),
          ValueListenableBuilder<bool>(
            valueListenable: _headerVisible,
            builder: (context, isVisible, _) {
              return AnimatedOpacity(
                opacity: isVisible ? 1 : 0,
                duration: const Duration(milliseconds: 500),
                child: Header(size: size, pageClick: _goToPage),
              );
            },
          ),
        ],
      ),
    );
  }
}
