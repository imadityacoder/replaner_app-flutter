import 'package:flutter/material.dart';

class CategoriesBottomSheet {
  static void show(
     BuildContext context,
    String category,
    String desc,
    String bannerImage, // full width banner image
    List<Map<String, dynamic>>
    subCategories, // [{ "icon": Icons, "name": "Iron", "rate": "₹30/KG"}]
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent, // make background transparent
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Stack(
          alignment: Alignment.topCenter,
          children: [
            // Main sheet
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: DraggableScrollableSheet(
                expand: false,
                initialChildSize: 0.9, // 90% height
                minChildSize: 0.5,
                maxChildSize: 0.95,
                builder: (context, scrollController) {
                  return Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Banner Image
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(16),
                          ),
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Image.asset(
                                bannerImage,
                                width: double.infinity,
                                height: 180,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Center(
                                      child: Placeholder(fallbackHeight: 180),
                                    ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 60,
                                color: Colors.black38,
                              ),
                              // Title
                              Text(
                                category,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              desc,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.brown[700],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        // Sub Categories
                        Expanded(
                          child: ListView.builder(
                            controller: scrollController,
                            itemCount: subCategories.length,
                            itemBuilder: (context, index) {
                              final sub = subCategories[index];
                              return Card(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 6,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                elevation: 2,
                                child: ListTile(
                                  leading: CircleAvatar(
                                    radius: 24,

                                    backgroundImage: AssetImage(
                                      'assets/images/${sub["pic"].toString().toLowerCase()}',
                                    ),
                                  ),
                                  title: Text(
                                    sub["name"],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                    ),
                                  ),
                                  trailing: Text(
                                    "₹${sub["rate"]}/kg",
                                    style: const TextStyle(
                                      color: Colors.black54,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Floating handle OUTSIDE sheet
            Positioned(
              top: 0,
              child: Container(
                width: 80,
                height: 6,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
