import 'package:cafe_do_brejo/app/views/widgets/header/header_controller.dart';
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
  final _headerController = HeaderController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        width: double.infinity,
        height: constraints.maxHeight * 0.15,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/footer_bg.png'),
            fit: BoxFit.fitHeight,
            colorFilter: ColorFilter.mode(Colors.black, BlendMode.modulate),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.02),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: constraints.maxHeight * 0.01),
              //   padding: EdgeInsets.only(bottom: constraints.maxWidth * 0.03, top: constraints.maxWidth * 0.01),
              child: Image.asset(
                'assets/images/LOGO_CAFEDOBREJO_ICONE_1COR.png',
                // 'assets/images/LOGO_CAFE_DO_BREJO.png',
                height: constraints.maxHeight * 0.1,
                color: Colors.white,
                gaplessPlayback: true,
                filterQuality: FilterQuality.high,
                isAntiAlias: true,
              ),
            ),
            AnimatedBuilder(
                animation: _headerController,
                builder: (context, _) {
                  return Row(
                    children: [
                      for (final menuModel in _headerController.getListMenus)
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.02, vertical: 10),
                          child: InkWell(
                            enableFeedback: true,
                            onTap: () {
                              widget.pageClick(menuModel.menuEnum.id);
                              // _headerController.setSelected(menuModel.menuEnum.id);
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
                              child: AnimatedDefaultTextStyle(
                                style: TextStyle(
                                  fontFamily: 'Avallon',
                                  fontSize: menuModel.getFontSize(),
                                  color: menuModel.getTextColor(),
                                ),
                                duration: const Duration(milliseconds: 300),
                                child: Text(menuModel.menuEnum.name),
                              ),
                            ),
                          ),
                        ),
                    ],
                  );
                })
          ],
        ),
      );
    });
  }
}
