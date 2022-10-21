import 'package:cafe_do_brejo/app/views/contact_page.dart';
import 'package:cafe_do_brejo/app/views/first_page.dart';
import 'package:cafe_do_brejo/app/views/about_page.dart';
import 'package:cafe_do_brejo/app/views/products_page.dart';
import 'package:cafe_do_brejo/app/views/widgets/header/header.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController pageController = PageController();
  bool headerVisible = false;

  List<Widget> _getWidgetList() {
    return const [FirstPage(), AboutPage(), ProductsPage(), ContactPage()];
  }

  void _goToPage(int page) {
    pageController.animateToPage(page, duration: const Duration(milliseconds: 600), curve: Curves.ease);
  }

  @override
  void initState() {
    pageController.addListener(() {
      setState(() {
        headerVisible = pageController.page! > 0.7;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            //   allowImplicitScrolling: true,
            pageSnapping: false,
            scrollDirection: Axis.vertical,
            children: _getWidgetList(),
          ),
          Visibility(
            visible: headerVisible,
            maintainAnimation: true,
            maintainState: true,
            maintainSize: true,
            child: Header(size: size, pageClick: _goToPage),
          ),
        ],
      ),
    );
  }
}
