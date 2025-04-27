import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key});

  final List<Map<String, String>> projects = const [
    {
      'title': 'Single Touch Gesture',
      'type': 'Package',
      'asset': 'images/img.png',
      'url': 'https://pub.dev/packages/single_touch_gesture',
    },
    {
      'title': 'Miracle Cloud',
      'type': 'Application',
      'asset': 'images/img.png',
      'url':
          'https://play.google.com/store/apps/details?id=com.miracleerp.cloud',
    },
    {
      'title': 'Brick Breaker',
      'type': 'Application',
      'asset': 'images/img.png',
      'url': 'https://github.com/YashrajsinhYz/Brick_Breaker',
    },
    {
      'title': 'Task Management App',
      'type': 'Application',
      'asset': 'images/img.png',
      'url': 'https://github.com/YashrajsinhYz/Task-Management-App',
    },
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
          /*Wrap(
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
          ),*/
          const SizedBox(height: 20),

          /// Grid
          /*GridView.builder(
            itemCount: projects.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1 ,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1.1,
            ),*/
          ListView.builder(
            shrinkWrap: true,
            itemCount: projects.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final project = projects[index];
              return PortfolioCard(
                title: project['title']!,
                type: project['type']!,
                imagePath: project['asset']!,
                urlLink: project['url']!,
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
  final String urlLink;

  const PortfolioCard({
    super.key,
    required this.title,
    required this.type,
    required this.imagePath,
    required this.urlLink,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => launchBasedOnLabel(url: urlLink, context: context),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            color: const Color(0xFF1E1E1E),
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26, blurRadius: 10, offset: Offset(0, 4))
            ],
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Portfolio Show Case Image
                  /*Expanded(
                    child: Center(
                      child: Image.asset(imagePath, fit: BoxFit.contain),
                    ),
                  ),*/
                  // const SizedBox(height: 8),
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
              const Spacer(),
              Center(child: Icon(Icons.open_in_new)),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> launchBasedOnLabel(
      {required String url, required BuildContext context}) async {
    final Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Something went wrong, try again!"),
          duration: Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }
}
