//
// @Author: "Eldor Turgunov"
// @Date: 22.10.2023
//
import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'card_content.dart';
import 'card_model.dart';

class SlidingCardsView extends StatefulWidget {
  const SlidingCardsView({super.key});

  @override
  State<SlidingCardsView> createState() => _SlidingCardsViewState();
}

class _SlidingCardsViewState extends State<SlidingCardsView> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.8);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.48,
      child: PageView.builder(
        clipBehavior: Clip.none,
        controller: pageController,
        itemCount: demoCardData.length,
        itemBuilder: (context, index) {
          // double offset = pageOffset - index;

          return AnimatedBuilder(
            animation: pageController,
            builder: (context, child) {
              double pageOffset = 0;
              if (pageController.position.haveDimensions) {
                pageOffset = pageController.page! - index;
              }
              double gauss =
                  math.exp(-(math.pow((pageOffset.abs() - 0.5), 2) / 0.08));
              return Transform.translate(
                offset: Offset(-32 * gauss * pageOffset.sign, 0),
                child: Container(
                  clipBehavior: Clip.none,
                  margin: const EdgeInsets.only(left: 8, right: 8, bottom: 24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(8, 20),
                        blurRadius: 24,
                      ),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      // Image
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(12)),
                        child: Image.asset(
                          'assets/${demoCardData[index].image}',
                          height: MediaQuery.of(context).size.height * 0.3,
                          alignment: Alignment(-pageOffset.abs(), 0),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      Expanded(child: child!),
                    ],
                  ),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Expanded(
                  child: CardContent(
                    name: demoCardData[index].name,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
