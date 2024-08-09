import 'package:flutter/material.dart';

class FadingAnimation extends StatefulWidget {
  const FadingAnimation({super.key, required this.child});
  final Widget child;
  @override
  State<FadingAnimation> createState() => _FadingAnimationState();
}

class _FadingAnimationState extends State<FadingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> opacityAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900));
    opacityAnimation = Tween(begin: 0.2, end: 0.8).animate(animationController);
    animationController.addListener(() {
      setState() {}
    });
    animationController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacityAnimation.value,
      child: widget.child,
    );
  }
}
