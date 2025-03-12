import 'package:flutter/material.dart';
import 'package:porfolio/constants/colors.dart';
// Make sure AppColors is defined

class Skills extends StatefulWidget {
  const Skills({super.key});

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late AnimationController _animationController;

  final List<Map<String, dynamic>> skills = [
    {"imagePath": "assets/images/dartlogo.png", "name": "Dart"},
    {"imagePath": "assets/images/flutter.png", "name": "Flutter"},
    {"imagePath": "assets/images/firebase.png", "name": "Firebase"},
    {"imagePath": "assets/images/th.png", "name": "React"},
    {"imagePath": "assets/images/Bootstrap.png", "name": "BootStrap"},
    {"imagePath": "assets/images/html.png", "name": "HTML"},
    {"imagePath": "assets/images/Css.png", "name": "CSS"},
    {"imagePath": "assets/images/javascript.png", "name": "JavaScript"},
    {"imagePath": "assets/images/database.png", "name": "MongoDB"},
    {"imagePath": "assets/images/swagger.png", "name": "RESTful APIs"},
    {"imagePath": "assets/images/C.png", "name": "C Programming"},
    {"imagePath": "assets/images/python.png", "name": "Python"},
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 25),
    )..repeat();

    _animationController.addListener(() {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(
          _scrollController.offset + 1.5,
        );
        if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent - 1) {
          _scrollController.jumpTo(0);
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isMobile = size.width < 600;

    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 300),
      child: ListView.builder(
        controller: _scrollController,
        itemCount: skills.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final skill = skills[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: MySkillsDes(
              imagePath: skill["imagePath"],
              name: skill["name"],
              isMobile: isMobile, // Pass this flag to the child widget
            ),
          );
        },
      ),
    );
  }
}

class MySkillsDes extends StatefulWidget {
  final String imagePath;
  final String name;
  final bool isMobile;

  const MySkillsDes({
    super.key,
    required this.imagePath,
    required this.name,
    required this.isMobile, // Receive the flag to adjust layout
  });

  @override
  State<MySkillsDes> createState() => _MySkillsDesState();
}

class _MySkillsDesState extends State<MySkillsDes> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // For mobile, increase container width and show only 2 items at a time
    double containerWidth = widget.isMobile
        ? size.width * 0.45 // Make container width bigger on mobile
        : (size.width < 900 ? size.width * 0.25 : size.width * 0.16);

    return MouseRegion(
      onEnter: (_) => hover(true),
      onExit: (_) => hover(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: containerWidth,
        height:
            containerWidth, // Make height equal to width for square containers
        decoration: BoxDecoration(
          color: AppColors.ebony,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isHovered
                ? Image.asset(
                    widget.imagePath,
                    height: widget.isMobile ? 100 : 200,
                    width: widget.isMobile ? 120 : 200,
                  )
                : Image.asset(
                    widget.imagePath,
                    height: widget.isMobile ? 180 : 150,
                    width: widget.isMobile ? 150 : 150,
                    fit: BoxFit.fitWidth,
                  ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 2),
              child: Text(
                widget.name,
                style: TextStyle(
                  color: AppColors.paleSlate,
                  fontFamily: "Poppins",
                  fontWeight: isHovered ? FontWeight.bold : FontWeight.w500,
                  fontSize:
                      widget.isMobile ? 18 : 25, // Adjust font size for mobile
                ),
              ),
            ),
            const SizedBox(height: 3),
          ],
        ),
      ),
    );
  }

  void hover(bool hovered) {
    setState(() {
      isHovered = hovered;
    });
  }
}
