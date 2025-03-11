import 'package:flutter/material.dart';
import 'package:porfolio/constants/colors.dart';
import 'package:porfolio/screens/widgets/major_projects.dart';

class ProjectCard extends StatefulWidget {
  final String imagePath;
  final String title;
  final String description;

  const ProjectCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool isSmallScreen = size.width < 600;

    // Image size logic based on screen width
    double imageHeight = size.width < 528
        ? size.height * 0.30 // Smaller image for screens less than 528px
        : (size.width >= 528 && size.width < 600
            ? size.height * 0.45 // Slightly larger for medium-sized screens
            : size.height * 0.35); // Normal size for larger screens

    double imageWidth = size.width < 528
        ? size.width * 0.80 // Smaller width for screens less than 528px
        : (size.width >= 528 && size.width < 600
            ? size.width *
                0.55 // Medium size for screens between 528px and 600px
            : size.width * 0.50); // Normal width for larger screens

    // Font size logic based on screen width
    double titleFontSize = size.width >= 528 && size.width <= 598 ? 20 : 18;
    double descriptionFontSize =
        size.width >= 528 && size.width <= 598 ? 14 : (isSmallScreen ? 10 : 15);

    // Adjusting the margin between image and text
    double spacing = isSmallScreen
        ? 10.0 // Smaller spacing for small screens
        : (size.width < 600 && size.width > 528
            ? 20.0 // Medium spacing for screens between 528px and 600px
            : 30.0); // Larger spacing for larger screens

    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: Card(
        color: AppColors.ebony,
        child: Container(
          margin: isSmallScreen
              ? EdgeInsets.zero
              : const EdgeInsets.only(left: 20, right: 20, bottom: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Wrap(
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: isSmallScreen
                              ? EdgeInsets.zero
                              : const EdgeInsets.all(10),
                          child: Opacity(
                            opacity: 0.9,
                            child: Image.asset(
                              widget.imagePath,
                              height: imageHeight,
                              width: imageWidth,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                            height:
                                spacing), // Add dynamic space between image and text
                        Padding(
                          padding: isSmallScreen
                              ? EdgeInsets.zero
                              : const EdgeInsets.only(left: 20),
                          child: Expanded(
                            child: Text(
                              widget.description,
                              style: TextStyle(
                                color: AppColors.paleSlate,
                                fontFamily: "Poppins",
                                fontSize: descriptionFontSize,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedContainer(
                  margin: const EdgeInsets.all(10),
                  curve: Curves.linear,
                  duration: const Duration(milliseconds: 400),
                  height: _isHovered
                      ? (isSmallScreen
                          ? size.height * 0.10
                          : size.height * 0.15)
                      : 0,
                  width: size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.studio.withOpacity(0.5),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Padding(
                      padding: isSmallScreen
                          ? EdgeInsets.zero
                          : const EdgeInsets.all(10),
                      child: Wrap(
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  widget.title,
                                  style: TextStyle(
                                    fontSize: titleFontSize,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const MajorProjects(),
                                    ),
                                  );
                                },
                                child: Center(
                                  child: Text(
                                    "Click to visit",
                                    style: TextStyle(
                                      fontSize: titleFontSize,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }
}
