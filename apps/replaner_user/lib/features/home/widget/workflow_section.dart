import 'package:flutter/material.dart';

class OurProcessSection extends StatelessWidget {
  const OurProcessSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFe2fae2),
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Column(
        children: [
          // Process steps row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: const [
              ProcessStep(
                icon: Icons.local_attraction_outlined,
                title: "fIND DEALER",
                subtitle: "NEAR YOU",
              ),
              ProcessStep(
                icon: Icons.local_shipping_outlined,
                title: "PICKUP FROM",
                subtitle: "YOUR PLACE",
              ),
              ProcessStep(
                icon: Icons.currency_rupee_outlined,
                title: "GET THE",
                subtitle: "BEST RATES",
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Action button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 54, 153, 67),
              ),
              label: const Text(
                "Sell Your Scrap Now",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              icon: const Icon(
                Icons.arrow_forward,
                size: 20,
                color: Colors.white,
              ),
              iconAlignment: IconAlignment.end,
            ),
          ),
        ],
      ),
    );
  }
}

class ProcessStep extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const ProcessStep({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        SizedBox(
          width: 100,
          child: CircleAvatar(
            radius: 32,
            backgroundColor: Colors.white60,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(icon, size: 40, color: Colors.blueGrey.shade700),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        Text(
          subtitle,
          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
