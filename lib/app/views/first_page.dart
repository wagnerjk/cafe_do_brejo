import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> with SingleTickerProviderStateMixin {
  late AnimationController logoAnimationController;
  late Animation<double> logoAnimation;

  void _initializaLogoAnimation() {
    logoAnimationController = AnimationController(duration: const Duration(seconds: 2), vsync: this);
    logoAnimation = CurvedAnimation(parent: logoAnimationController, curve: const Interval(0.2, 0.8));
  }

  @override
  void initState() {
    _initializaLogoAnimation();
    logoAnimationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    logoAnimationController.dispose();
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
        ),
        Center(
          child: Image.asset(
            'assets/images/LOGO_CAFE_DO_BREJO.png',
            width: size.width * 0.3,
            opacity: logoAnimation,
          ),
        )
      ],
    );
  }
}
