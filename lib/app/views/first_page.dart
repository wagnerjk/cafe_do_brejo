import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(value: 20, duration: const Duration(seconds: 2), vsync: this)
      //   ..animateTo(100, duration: const Duration(milliseconds: 900));
      ..forward(from: 100);
    //   ..reverse();
    //   ..repeat();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Image.asset(
          'assets/images/fundo-madeira-clara.jpg',
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
          //   color: Colors.white.withOpacity(0.7),
          //   color: const Color.fromRGBO(255, 255, 255, 0.7),
          //   colorBlendMode: BlendMode.modulate,
        ),
        Center(
          child: Image.asset(
            'assets/images/LOGO_CAFE_DO_BREJO.png',
            width: size.width * 0.3,
            opacity: animationController,
          ),
        )
      ],
    );
  }
}
