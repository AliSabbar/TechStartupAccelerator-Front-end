import 'dart:async';

import 'package:flutter/material.dart';
import 'package:housen/providers/dark_theme_provider.dart';
import 'package:housen/style/colors.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _AnimationContainerState();
}

class _AnimationContainerState extends State<SplashScreen> {
  bool isVisible = true;

  double widthCon = 0.0;
  double heightCon = 0.0;

  @override
  void initState() {
    super.initState();
    startAnimate();
  }

  startAnimate() async {
    await Future.delayed(const Duration(seconds: 2), (() {
      isVisible = false;
      setState(() {});
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Center(
              child: AnimatedOpacity(
                  onEnd: () {
                    widthCon = 900;
                    heightCon = 900;
                    setState(() {});
                  },
                  opacity: isVisible ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  child: Image.asset('assets/images/logo.png')),
            ),
            Positioned(
              right: -1,
              child: AnimatedContainer(
                width: widthCon,
                height: heightCon,
                onEnd: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    'home',
                    (route) => false,
                  );
                },
                duration: const Duration(milliseconds: 1000),
                decoration: BoxDecoration(
                    color: context.read<DarkModeProvider>().isDark
                        ? darkColor
                        : secondaryColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(0),
                      topLeft: Radius.circular(100),
                      bottomLeft: Radius.circular(100),
                      bottomRight: Radius.circular(100),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
