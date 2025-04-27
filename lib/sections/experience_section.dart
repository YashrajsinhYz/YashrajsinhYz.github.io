import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Experience',
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

          /// Education
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadiusDirectional.circular(8),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: Offset(0, 4))
                      ],
                    ),
                    child: Icon(CupertinoIcons.book),
                  ),
                  Container(
                    height: 18,
                    width: 0.5,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                    width: 16,
                    child: Center(
                      child: Stack(
                        children: [
                          Center(
                            child: Container(
                              height: 16,
                              width: 16,
                              decoration: BoxDecoration(
                                color: Colors.white10,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              height: 8,
                              width: 8,
                              decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 12),
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SectionHeader(title: 'Education'),
                    ResumeItem(
                      title: 'Atmiya University',
                      subtitle:
                          'Bachelor of Technology in Information Technology (B.Tech. IT)',
                      duration: '2019 – 2023',
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 24),

          /// Experience
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadiusDirectional.circular(8),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: Offset(0, 4))
                      ],
                    ),
                    child: Icon(CupertinoIcons.book),
                  ),
                  Container(
                    height: 18,
                    width: 0.5,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                    width: 16,
                    child: Center(
                      child: Stack(
                        children: [
                          Center(
                            child: Container(
                              height: 16,
                              width: 16,
                              decoration: BoxDecoration(
                                color: Colors.white10,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              height: 8,
                              width: 8,
                              decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 240,
                    width: 0.5,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                    width: 16,
                    child: Center(
                      child: Stack(
                        children: [
                          Center(
                            child: Container(
                              height: 16,
                              width: 16,
                              decoration: BoxDecoration(
                                color: Colors.white10,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              height: 8,
                              width: 8,
                              decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 12),
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SectionHeader(title: 'Experience'),
                    ResumeItem(
                      title: 'Flutter Developer',
                      subtitle: 'Foecht • Mar 2025 – Present',
                      bulletPoints: [
                        'Designed new features and implemented UI designs into code using Flutter.',
                        'Developed and crafted functional solutions for smooth onboarding features and data entries.',
                        'Integrated Google and in-house-built sign-in services.',
                        'Maintained proper functionalities and modular UI code structure.',
                        'Implemented proper gateway integration based on secure transactions.',
                        'Participated in version control and documentation to deliver faster solutions.',
                        'Refactored legacy code to improve readability and reduce technical debt.',
                        'Enhanced modular widgets and user-friendly experiences throughout the app.',
                        'Published Android/iOS apps and deployed the app in PlayStore and AppStore.',
                      ],
                    ),
                    ResumeItem(
                      title: 'Flutter Developer',
                      subtitle: 'RKIT Software Pvt. Ltd. • Jan 2023 – Feb 2025',
                      bulletPoints: [
                        'Worked majorly with Flutter UI and functional UI designs in fully functional user interfaces.',
                        'Integrated Restful APIs for data retrieval, file-based or stream-based rendering.',
                        'Improved application performance via on-screen and onboarding user experience.',
                        'Contributed to responsive UI, reusability widgets and common features components.',
                        'Participated in agile environment meetings and code structure discussions.',
                        'Wrote scalable, testable, and reusable code.',
                        'Used clean architecture and MVVM design-based best practices.',
                        'Maintained modular structure to provide better app feature compatibility.',
                        'Collaborated with cross-functional teams including designers and developers.',
                        'Published Android/iOS apps and deployed the app in PlayStore and AppStore.',
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Align(
            alignment: Alignment.centerLeft,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(250, 50),
                foregroundColor: Colors.black,
                backgroundColor: Colors.blueAccent,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(16)),
              ),
              onPressed: () {
                // Trigger download logic or navigation to CV URL
              },
              icon: const Icon(
                Icons.download,
                color: Colors.black,
              ),
              label: const Text('Download Resume',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          )
        ],
      ),
    );
  }
}

/// Reusable header
class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 26),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}

/// Reusable resume item
class ResumeItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? duration;
  final List<String>? bulletPoints;

  const ResumeItem({
    super.key,
    required this.title,
    required this.subtitle,
    this.duration,
    this.bulletPoints,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.white)),
          const SizedBox(height: 4),
          Text(subtitle,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.grey[400])),
          if (duration != null)
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text(duration!,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Colors.grey[500])),
            ),
          if (bulletPoints != null)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: bulletPoints!
                    .map(
                      (point) => Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("• ",
                              style: TextStyle(
                                  color: Colors.blueAccent, fontSize: 14)),
                          Text(point,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: Colors.grey[300])),
                        ],
                      ),
                    )
                    .toList(),
              ),
            )
        ],
      ),
    );
  }
}
