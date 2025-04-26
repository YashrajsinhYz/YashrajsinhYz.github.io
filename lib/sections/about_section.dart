import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AboutSection extends StatelessWidget {
  AboutSection({super.key});

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("About Me",
              style: TextStyle(
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
          const Text(
            "Software Engineer with 2+ years of experience building scalable, high-performance Flutter applications. Skilled in clean architecture, backend integration, and DevOps practices. Published the single_touch_gesture package on pub-dev to solve multi-touch gesture issues in Flutter UIs. Passionate about writing clean code, solving real-world problems, and continuous learning.",
            style: TextStyle(fontSize: 16, height: 1.6),
          ),
          const SizedBox(height: 32),
          const Text("What I'm Doing",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: const [
              InfoCard(
                  title: "Mobile Apps",
                  subtitle:
                      "Creating sleek, high-performance mobile applications for both Android and iOS ecosystems."),
              InfoCard(
                  title: "UI/UX Design",
                  subtitle:
                      "Crafting intuitive and visually stunning user experiences tailored for maximum engagement."),
              InfoCard(
                  title: "Backend Development",
                  subtitle:
                      "Building robust and scalable backend solutions with seamless API and service integration."),
              InfoCard(
                  title: "DevOps",
                  subtitle:
                      "Streamlining development and operations with CI/CD pipelines, automation, and cloud infrastructure."),
            ],
          ),
          const SizedBox(height: 32),
          const Text("Skills",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          SizedBox(
            height: 160,
            child: ListView(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              children: [
                SkillIcon(imagePath: 'images/Dart.svg'),
                SkillIcon(imagePath: 'images/Flutter.svg'),
                SkillIcon(imagePath: 'images/Firebase.svg'),
                SkillIcon(imagePath: 'images/AndroidStudio.svg'),
                SkillIcon(imagePath: 'images/Figma.svg'),
                SkillIcon(imagePath: 'images/Postman.svg'),
                SkillIcon(imagePath: 'images/Xcode.svg'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const InfoCard({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 450,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4))
        ],
      ),
      child: Row(
        children: [
          SvgPicture.asset('images/Flutter.svg', width: 50, height: 50),
          const SizedBox(width: 16),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 8),
                Text(subtitle,
                    style: const TextStyle(
                        fontSize: 14, overflow: TextOverflow.visible)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SkillIcon extends StatelessWidget {
  final String imagePath;

  const SkillIcon({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: SvgPicture.asset(imagePath, width: 150, height: 150),
    );
  }
}
