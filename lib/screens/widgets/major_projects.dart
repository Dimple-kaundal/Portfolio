import 'package:flutter/material.dart';
import 'package:porfolio/Reusable%20Functions/navigation.dart';
import 'package:porfolio/constants/colors.dart';
import 'package:porfolio/constants/styles.dart';
import 'package:porfolio/screens/widgets/nav_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class MajorProjects extends StatelessWidget {
  const MajorProjects({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    return Scaffold(
      appBar: const NavBar(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: Styles.gradientDecoration,
        child: Column(
          crossAxisAlignment:
              isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
          mainAxisAlignment:
              isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: Text(
                "Project Showcase: Where Innovation Meets Code",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.paleSlate,
                ),
              ),
            ),
            SizedBox(height: 15),
            Text(
              "Take a look at some of the projects I've poured my passion and skills into. Each one reflects my dedication to creating seamless and impactful digital experiences. Dive into my work!",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: AppColors.paleSlate,
              ),
            ),
            SizedBox(height: 49),
            Expanded(child: MyProjectsList()),
          ],
        ),
      ),
    );
  }
}

class MyProjectsList extends StatefulWidget {
  const MyProjectsList({super.key});

  @override
  State<MyProjectsList> createState() => _MyProjectsListState();
}

class _MyProjectsListState extends State<MyProjectsList> {
  final List<String> projectImages = [
    'assets/images/wbl.png',
    'assets/images/react.png',
    'assets/images/wordpress1.png',
  ];

  final List<String> projectTitles = [
    'Work Based Learning Program',
    'Fitness Tracker',
    'The Coffee House',
  ];

  final List<String> projectSkills = [
    'Technology Used : Dart , Flutter, Firebase',
    'Technology Used : MongoDB, Express, React, Node.js',
    'Technology Used : XAMPP, MySQL, WordPress, Elementor Plugin',
  ];

  final List<String> projectDescriptions = [
    'The Work-Based Learning (WBL) App is designed to support the Ministry of Electronics and IT’s Work-Based Learning Programme for fresh Graduate Engineers from marginalized sections.',
    'A Fitness Tracker web application built with the MERN stack, helping users manage and track their fitness journey, log workouts, and view personalized diet plans.',
    'Designed and developed a responsive and modern coffee shop website using WordPress and Elementor, featuring an engaging user experience with an online ordering system.',
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = 3;

    // **🔧 Fix: Correct CrossAxisCount Handling**
    if (screenWidth < 600) {
      crossAxisCount = 1;
    } else if (screenWidth < 1300) {
      crossAxisCount = 2;
    } else {
      crossAxisCount = 3;
    }

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: projectImages.length,
      itemBuilder: (context, index) {
        return MyProjectList(
          image: AssetImage(projectImages[index]),
          description: projectDescriptions[index],
          title: projectTitles[index],
          technology: projectSkills[index],
        );
      },
    );
  }
}

class MyProjectList extends StatelessWidget {
  final String description;
  final ImageProvider image;
  final String title;
  final String technology;

  const MyProjectList({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.technology,
  });

  // Future<void> _launchURL() async {
  //   const url = 'https://wblp.in/';
  //   final Uri uri = Uri.parse(url);
  //   if (await canLaunch(uri.toString())) {
  //     await launch(uri.toString());
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  Future<void> _launchUrl() async {
    final Uri uri = Uri.parse("https://github.com/Dimple-kaundal");

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    bool liveButton = title == 'Work Based Learning Program';

    // **📌 Adjust Card Sizing Dynamically**
    double cardHeight =
        screenWidth < 900 ? screenHeight * 0.25 : screenHeight * 0.50;
    double cardWidth =
        screenWidth < 900 ? screenWidth * 0.70 : screenWidth * 0.35;

    // **📌 Adjust Font Sizes Dynamically**
    double fontSizeTitle = screenWidth < 900 ? 16 : 22;
    double fontSizeTech = screenWidth < 900 ? 15 : 16;
    double fontSizeDescription = screenWidth < 900 ? 15 : 17;

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenHeight * .009, vertical: screenWidth * .009),
      child: SizedBox(
        width: cardWidth,
        // height: 250,
        child: SizedBox(
          height: cardHeight,
          child: Card(
            // color: Colors.red,
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: SizedBox(
              width: cardWidth,
              height: cardHeight,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: cardHeight * .05,
                          vertical: cardWidth * .02),
                      child: Image(
                        image: image,
                        // height: cardHeight * 0.55,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        title,
                        style: TextStyle(
                            color: AppColors.valhalla,
                            fontFamily: 'Poppins',
                            fontSize: fontSizeTitle,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      technology,
                      style: TextStyle(
                        color: AppColors.ebony,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: fontSizeTech,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Expanded(
                      child: Text(
                        description,
                        style: TextStyle(
                          color: AppColors.ebony,
                          fontFamily: 'Poppins',
                          fontSize: fontSizeDescription,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Row(
                        children: [
                          myElevatedButton("Git Repo", () {
                            _launchUrl();
                          }),
                          if (liveButton) ...[
                            SizedBox(width: screenWidth * 0.02),
                            // myElevatedButton("View Live", _launchURL),
                          ]
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget myElevatedButton(String text, Function() onpressed) {
  return ElevatedButton(
    onPressed: onpressed,
    style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.studio),
        padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 16, vertical: 10)),
        shape: WidgetStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ))),
    child: Text(
      text,
      style: const TextStyle(color: Colors.white, fontSize: 18),
    ),
  );
}
