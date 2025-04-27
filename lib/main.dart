import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/strings.dart';
import 'package:portfolio/sections/about_section.dart';
import 'package:portfolio/sections/experience_section.dart';
import 'package:portfolio/sections/project_section.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.blue,
      title: "My Portfolio",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home: const PortfolioHome(),
    );
  }
}

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  int currentSection = 0;
  List<Map> sectionsMap = [
    {
      "id": 0,
      "title": "About",
      "sectionWidget": AboutSection(),
    },
    {
      "id": 1,
      "title": "Experience",
      "sectionWidget": ExperienceSection(),
    },
    {
      "id": 2,
      "title": "Project",
      "sectionWidget": ProjectSection(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Row(
            spacing: 25,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Basic Info
              Flexible(flex: 2, child: basicInfoContainer()),
              // Other Info
              Flexible(flex: 8, child: otherInfoContainer()),
            ],
          ),
        ),
      ),
    );
  }

  Widget basicInfoContainer() {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        decoration: BoxDecoration(
            color: bgColor, borderRadius: BorderRadiusDirectional.circular(20)),
        child: Column(
          spacing: 14,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image
            profileImageWidget(),
            // Name
            nameWidget(),
            // Profile Name
            designationNameWidget(),
            // Horizontal Divider
            Divider(indent: 20, endIndent: 20, color: Colors.white10),
            // Row : mail Image + (Column : EMail + mail)
            contactWidget(
                icon: Icon(
                  Icons.mail_outline_rounded,
                  size: 18,
                ),
                label: "EMAIL",
                value: "zalayashraj110@gmail.com",
                context: context),
            // Row : Phone no. Image + (Column : Phone + Number)
            contactWidget(
                icon: Icon(
                  Icons.phone_iphone,
                  size: 18,
                ),
                label: "PHONE",
                value: "+91 97120 05396",
                context: context),
            contactWidget(
                icon: Icon(
                  Icons.link,
                  size: 18,
                ),
                label: "LINKEDIN",
                value: "linkedin.com/in/yashrajsinh-zala",
                context: context),
            contactWidget(
                icon: Icon(
                  Icons.link,
                  size: 18,
                ),
                label: "GITHUB",
                value: "github.com/YashrajsinhYz",
                context: context),
            // socialMediaWidget(),
          ],
        ),
      ),
    );
  }

  Widget profileImageWidget() {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4))
        ],
      ),
      child: ClipRRect(
          borderRadius: BorderRadiusDirectional.circular(25),
          child: Image.asset(profileImagePath)),
    );
  }

  Widget nameWidget() {
    return Text(
      "Yashrajsinh Zala",
      style: TextStyle(
        fontSize: 28,
        color: Colors.white,
        fontFamily: "Poppins",
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget designationNameWidget() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadiusDirectional.circular(8),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4))
        ],
      ),
      child: Text(
        "Flutter Developer",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget contactWidget(
      {dynamic icon,
      String label = "",
      String value = "",
      required BuildContext context}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadiusDirectional.circular(8),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26, blurRadius: 10, offset: Offset(0, 4))
              ],
            ),
            child: Card(child: icon),
          ),
          SizedBox(width: 10),
          Flexible(
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => launchBasedOnLabel(label, value, context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                    Text(
                      value,
                      style: TextStyle(overflow: TextOverflow.ellipsis),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> launchBasedOnLabel(
      String label, String value, BuildContext context) async {
    String url = "";
    if (label == "EMAIL") {
      url = "mailto:$value";
    } else if (label == "PHONE") {
      url = "tel:$value";
    } else if (label == "LINKEDIN" || label == "GITHUB") {
      url = value.startsWith("http") ? value : "https://$value";
    }

    final Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Could not launch $label"),
          duration: Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  Widget socialMediaWidget() {
    return Row(
      spacing: 10,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            height: 40, width: 40, child: SvgPicture.asset(githubImagePath)),
      ],
    );
  }

  Widget otherInfoContainer() {
    return Container(
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadiusDirectional.circular(20)),
      child: Center(
        child: Stack(
          children: [
            // Tab Bar View
            Container(
              child: sectionsMap[currentSection]["sectionWidget"],
            ),
            // Tab Bar : HomeSection, AboutSection, ProjectsSection, ContactSection
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 500,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E1E),
                  borderRadius: BorderRadiusDirectional.only(
                      topEnd: Radius.circular(20),
                      bottomStart: Radius.circular(20)),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 4)),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: sectionsMap
                      .map<Widget>((item) => sectionsWidget(
                            id: item["id"],
                            title: item["title"],
                          ))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Panel Elements
  Widget sectionsWidget({int id = 0, String title = ""}) {
    return Flexible(
      flex: 1,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            currentSection = id;
            setState(() {});
          },
          child: Text(title,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: currentSection == id ? Colors.blueAccent : null)),
        ),
      ),
    );
  }
}
