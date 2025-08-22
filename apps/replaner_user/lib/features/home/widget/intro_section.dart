import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class IntroCarousel extends StatelessWidget {
  const IntroCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {
        "text": "Deal with your scrap and sell them now!",
        "image": "assets/images/home_intro.png",
        "color": const Color.fromARGB(255, 73, 170, 86),
      },
      {
        "text": "Have bulk scrap? Get the best deals instantly!",
        "image": "assets/images/home_intro2.png",
        "color": const Color.fromARGB(255, 143, 97, 60),
      },
    ];

    return CarouselSlider(
      items: items.map((item) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Builder(
            builder: (context) {
              return IntroSection(
                text: item["text"]!,
                imagePath: item["image"]!,
                color: item["color"]!,
              );
            },
          ),
        );
      }).toList(),
      options: CarouselOptions(
        height: 180,
        enlargeCenterPage: false,
        autoPlay: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 1200),
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayCurve: Curves.linearToEaseOut,
        viewportFraction: 1.0,
        enableInfiniteScroll: true,
      ),
    );
  }
}

class IntroSection extends StatelessWidget {
  final String text;
  final String imagePath;
  final Color color;

  const IntroSection({
    super.key,
    required this.text,
    required this.imagePath,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 8,
                      ),
                    ),
                    child: const Text("Sell now"),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Image.asset(imagePath, height: 180),
          ),
        ],
      ),
    );
  }
}
