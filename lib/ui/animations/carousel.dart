import 'package:flutter/material.dart';
import 'package:learn/core/core.dart';

class Carousel extends StatefulWidget {
  final List<String> assets;
  const Carousel({required this.assets});
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  late PageController controller;
  int currentpage = 1;

  @override
  void initState() {
    super.initState();

    controller = PageController(
      initialPage: currentpage,
      keepPage: false,
      viewportFraction: 0.5,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: SizedBox(
          height: 234.fh,
          width: double.infinity,
          child: SizedBox(
            child: PageView.builder(
              onPageChanged: (value) {
                if (value < widget.assets.length) {
                  setState(() {
                    currentpage = value;
                  });
                  return;
                }
                controller.animateToPage(
                  0,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.fastOutSlowIn,
                );
              },
              controller: controller,
              itemBuilder: (context, index) => builder(index),
            ),
          ),
        ),
      ),
    );
  }

  Widget builder(int index) {
    if (index < widget.assets.length) {
      return AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          double value = 1.0;
          if (controller.position.haveDimensions) {
            value = controller.page! - index;
            value = (1 - (value.abs() * .5)).clamp(0.0, 1.0).toDouble();
          }

          return Center(
            child: SizedBox(
              height: Curves.easeOut.transform(value) * 300,
              width: Curves.easeOut.transform(value) * 250,
              child: child,
            ),
          );
        },
        child: _buildCarouselBody(index),
      );
    }
    return const SizedBox();
  }

  Widget _buildCarouselBody(int index) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        clipBehavior: currentpage == index ? Clip.hardEdge : Clip.none,
        children: [
          Positioned(
            left: currentpage == index
                ? 0
                : currentpage == index + 1
                    ? 75.fw
                    : currentpage == index - 1
                        ? -75.fw
                        : 0,
            child: Center(
              child: SizedBox(
                height: index == currentpage ? 234.fh : 188.fh,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(300),
                  child: Image.asset(
                    'assets/img/' + widget.assets[index],
                    fit: BoxFit.fill,
                    // color: index == currentpage ? null : Colors.white.withOpacity(0.5),
                    // colorBlendMode: BlendMode.modulate,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ClipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(size.width / 4, size.height, size.width / 2, size.height);
    path.quadraticBezierTo(size.width - size.width / 4, size.height, size.width, size.height - 40);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
