import 'package:flutter/material.dart';
import 'package:replaner_user/features/home/domain/data/scrap_categories_data.dart';
import 'package:replaner_user/features/home/widget/categories_detailSheet.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Know your Scrap",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.2,
          children: [
            _buildCategoryCard(
              image: 'assets/images/paper-waste.png', // Paper
              title: "Paper",
              color: const Color(0xFFFFE0CC), // Light orange
              onTap: () => CategoriesBottomSheet.show(
                context,
                "Paper",
                scrapCategories["Paper"]["desc"],
                scrapCategories["Paper"]["image"],
                List<Map<String, String>>.from(
                  scrapCategories["Paper"]["items"],
                ),
              ),
            ),
            _buildCategoryCard(
              image: 'assets/images/plastic-waste.png', // Plastic
              title: "Plastic",
              color: const Color(0xFFFFE4EC), // Light pink
              onTap: () => CategoriesBottomSheet.show(
                context,
                "Plastic",
                scrapCategories["Plastic"]["desc"],
                scrapCategories["Plastic"]["image"],
                List<Map<String, String>>.from(
                  scrapCategories["Plastic"]["items"],
                ),
              ),
            ),
            _buildCategoryCard(
              image: 'assets/images/metal-waste.png', // Metal
              title: "Metal",
              color: const Color(0xFFD6E9FF), // Light blue
              onTap: () => CategoriesBottomSheet.show(
                context,
                "Metal",
                scrapCategories["Metal"]["desc"],
                scrapCategories["Metal"]["image"],
                List<Map<String, String>>.from(
                  scrapCategories["Metal"]["items"],
                ),
              ),
            ),
            _buildCategoryCard(
              image: 'assets/images/e-waste.png', // E-Waste
              title: "E-Waste",
              color: const Color(0xFFD9F5FF), // Light cyan
              onTap: () => CategoriesBottomSheet.show(
                context,
                "E-Waste",
                scrapCategories["E-Waste"]["desc"],
                scrapCategories["E-Waste"]["image"],
                List<Map<String, String>>.from(
                  scrapCategories["E-Waste"]["items"],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCategoryCard({
    required String image,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    // Convert to HSL and reduce lightness for darker text color
    final hsl = HSLColor.fromColor(color);
    final darkerColor = hsl
        .withLightness((hsl.lightness - 0.5).clamp(0.0, 1.0))
        .toColor();

    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.9),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withValues(alpha: 0.5), width: 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: darkerColor,
                  letterSpacing: 1.4, // darker shade of background color
                ),
              ),
            ),
            Image.asset(image, height: 80, fit: BoxFit.cover),
          ],
        ),
      ),
    );
  }
}
