import 'package:flutter/material.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      padding: const EdgeInsets.all(32),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Hi, I’m Your Name 👋',
              style: Theme.of(context).textTheme.headlineLarge),
          const SizedBox(height: 12),
          const Text('Flutter Developer | Mobile & Web Apps'),
          const SizedBox(height: 24),
          Wrap(
            spacing: 12,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.download),
                label: const Text("Download Resume"),
              ),
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.email),
                label: const Text("Contact Me"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
