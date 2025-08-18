import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          // First line: Made with ❤️
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text(
                "Made with ",
                style: TextStyle(
                  fontSize: 42, // bigger
                  fontWeight: FontWeight.bold,
                  letterSpacing: 4, // more spacing
                  color: Colors.black87, //
                ),
              ),
              Text(
                "❤️",
                style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
              ),
            ],
          ),

          // Third line: INDIA
          const Text(
            "in INDIA",
            style: TextStyle(
              fontSize: 50, // extra large
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              color: Colors.black54, // more transparent look
            ),
          ),
        ],
      ),
    );
  }
}
