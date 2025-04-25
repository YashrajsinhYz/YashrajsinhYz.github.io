import 'package:flutter/material.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key});

  final List<Map<String, String>> projects = const [
    {
      'title': 'Single Touch Gesture',
      'type': 'Package',
      'asset': 'images/img.png'
    },
    {
      'title': 'Brick Breaker',
      'type': 'Application',
      'asset': 'images/img.png'
    },
    {'title': 'Task Management App', 'type': 'Application', 'asset': 'images/img.png'},
    {'title': 'Miracle Cloud', 'type': 'Application', 'asset': 'images/img.png'},
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Projects',
              style: textTheme.headlineLarge?.copyWith(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold)),
          Container(
            margin: EdgeInsets.symmetric(vertical: 18),
            height: 6,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadiusDirectional.circular(15),
            ),
          ),

          /// Tabs
          Wrap(
            spacing: 16,
            children: ['All', 'Applications', 'Packages']
                .map((filter) => FilterChip(
                      label: Text(filter),
                      selected: filter == 'All',
                      onSelected: (_) {},
                      selectedColor: Colors.blueAccent,
                      backgroundColor: const Color(0xFF2C2C2C),
                      labelStyle: TextStyle(
                        color: filter == 'All' ? Colors.black : Colors.white,
                      ),
                    ))
                .toList(),
          ),
          const SizedBox(height: 20),

          /// Grid
          GridView.builder(
            itemCount: projects.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1.1,
            ),
            itemBuilder: (context, index) {
              final project = projects[index];
              return PortfolioCard(
                title: project['title']!,
                type: project['type']!,
                imagePath: project['asset']!,
              );
            },
          )
        ],
      ),
    );
  }
}

/// Individual project card
class PortfolioCard extends StatelessWidget {
  final String title;
  final String type;
  final String imagePath;

  const PortfolioCard({
    super.key,
    required this.title,
    required this.type,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2C),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: Image.asset(imagePath, fit: BoxFit.contain),
            ),
          ),
          const SizedBox(height: 8),
          Text(title,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.white)),
          Text(type,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Colors.grey[400])),
        ],
      ),
    );
  }
}
