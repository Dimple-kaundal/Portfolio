import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:porfolio/constants/colors.dart';
import 'package:porfolio/screens/widgets/project_card.dart';

class CustomTabBar extends StatefulWidget {
  final TabController tabController;
  const CustomTabBar({super.key, required this.tabController});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double tabBarWidth =
        size.width > 950 ? size.width * 0.36 : size.width * 0.50;

    return Container(
      width: tabBarWidth,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent),
        color: AppColors.ebony,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TabBar(
        controller: widget.tabController,
        dividerColor: Colors.transparent,
        tabs: const [
          Tab(text: "All"),
          Tab(text: "Apps"),
          Tab(text: "UI/UX"),
          Tab(text: "Web Development"),
        ],
        indicator: BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.circular(20),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        labelStyle: const TextStyle(
          fontSize: 18, // Increase font size
          fontWeight: FontWeight.bold,
        ),
        labelColor: Colors.white,
        unselectedLabelColor: Colors.grey,
        labelPadding: const EdgeInsets.symmetric(
          horizontal: 25.0,
        ),
      ),
    );
  }
}

class CustomTabBarView extends StatelessWidget {
  final TabController tabController;

  const CustomTabBarView({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final List<Map<String, String>> allProjects = [
      {
        'imagePath': kIsWeb
            ? 'https://dimplekaundalsportfolio.netlify.app/assets/images/wbl.png'
            : 'assets/images/wbl.png',
        'title': 'App Development',
        'description':
            "The Work-Based Learning (WBL) App is a mobile application designed to support the Ministry of Electronics and IT’s (MeitY) Work-Based Learning Programme aimed at empowering fresh Graduate Engineers from marginalized sections such as SC, ST, Women, and EWS Candidates"
      },
      {
        'imagePath': 'assets/images/react.png',
        'title': 'Web Development',
        'description':
            "The Fitness Tracker web application built with the MERN stack, designed to help users manage and track their fitness journey. It allows users to log workouts, view personalized diet plans, shop for fitness equipment and supplements, and manage their profiles"
      },
      {
        'imagePath': 'assets/images/wordpress.png',
        'title': 'UI/UX',
        'description':
            "The Coffee House website is a responsive and customizable platform designed for coffee shops. Built on WordPress, it features an interactive menu, online ordering, customer reviews, and SEO optimization. With key plugins like WooCommerce and Elementor."
      },
      {
        'imagePath': 'assets/images/wordpress1.png',
        'title': 'UI/UX',
        'description':
            "The Coffee House website is a responsive and customizable platform designed for coffee shops. Built on WordPress, it features an interactive menu, online ordering, customer reviews, and SEO optimization. With key plugins like WooCommerce and Elementor"
      },
      {
        'imagePath': 'assets/images/cofee.jpg',
        'title': 'UI/UX',
        'description':
            "The Coffee House website is a responsive and customizable platform designed for coffee shops. Built on WordPress, it features an interactive menu, online ordering, customer reviews, and SEO optimization. With key plugins like WooCommerce and Elementor"
      },
    ];

    return TabBarView(
      controller: tabController,
      children: [
        AllProject(
          size: size,
          projects: allProjects,
        ),
        AllProject(
          size: size,
          projects: allProjects
              .where((project) => project['title'] == 'App Development')
              .toList(),
        ),
        AllProject(
          size: size,
          projects: allProjects
              .where((project) => project['title'] == 'UI/UX')
              .toList(),
        ),
        AllProject(
          size: size,
          projects: allProjects
              .where((project) => project['title'] == 'Web Development')
              .toList(),
        ),
      ],
    );
  }
}

class AllProject extends StatelessWidget {
  const AllProject({super.key, required this.size, required this.projects});
  final Size size;
  final List<Map<String, String>> projects;

  @override
  Widget build(BuildContext context) {
    // Determine the number of columns dynamically
    int crossAxisCount =
        size.width > 950 ? 2 : 1; // 2 for desktop, 1 for tablet/mobile

    return Container(
      margin: size.width < 600
          ? EdgeInsets.symmetric(horizontal: size.width * 0.05)
          : EdgeInsets.symmetric(
              horizontal: size.width * 0.10), // No margin for small screens
      padding: EdgeInsets.all(
          size.width < 600 ? 0 : 20), // No padding for small screens
      child: Center(
        child: GridView.builder(
          itemCount: projects.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio:
                size.width > 600 ? 3 / 2 : 3 / 3, // Bigger cards for tablet
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final project = projects[index];
            debugPrint("Trying to load: ${project['imagePath']}");
            return ProjectCard(
              imagePath: project['imagePath']!,
              description: project['description']!,
              title: project['title']!,
            );
          },
        ),
      ),
    );
  }
}
