import 'package:flutter/material.dart';

void main() {
  runApp(const SkillsMarquee());
}

class SkillsMarquee extends StatefulWidget {
  const SkillsMarquee({super.key});

  @override
  _SkillsMarqueeState createState() => _SkillsMarqueeState();
}

class _SkillsMarqueeState extends State<SkillsMarquee> {
  final ScrollController _scrollController = ScrollController();
  final List<Map<String, dynamic>> skills = [
    {"icon": Icons.design_services, "name": "Figma", "percentage": 92},
    {"icon": Icons.diamond, "name": "Sketch", "percentage": 80},
    {"icon": Icons.adb, "name": "Xd", "percentage": 85},
    {"icon": Icons.wordpress, "name": "WordPress", "percentage": 99},
    {"icon": Icons.code, "name": "React", "percentage": 89},
    {"icon": Icons.javascript, "name": "JavaScript", "percentage": 93},
  ];

  @override
  void initState() {
    super.initState();
    // Start scrolling animation
    _startScrolling();
  }

  void _startScrolling() {
    // Scroll continuously in a loop
    Future.delayed(const Duration(seconds: 1), () {
      _scrollController.addListener(() {
        if (_scrollController.hasClients) {
          // If the scroll reaches the end, jump back to the beginning for seamless scrolling
          if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent) {
            _scrollController.jumpTo(0); // Jump to the start
          } else {
            // Continuously scroll with smooth animation
            _scrollController.animateTo(
              _scrollController.offset + 1.5, // Scroll speed
              duration: const Duration(milliseconds: 50),
              curve: Curves.linear,
            );
          }
        }
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("My Skills"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "My Skills",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.purpleAccent,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "We put your ideas and wishes into unique web projects that inspire you and your customers.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 20),
            // Infinite Scrolling ListView.builder
            SizedBox(
              height: 120, // Smaller Card Size
              child: ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                itemCount:
                    skills.length * 2, // Duplicate list for smooth looping
                itemBuilder: (context, index) {
                  final skill = skills[
                      index % skills.length]; // Infinite looping of the list
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SkillCard(
                      icon: skill["icon"],
                      name: skill["name"],
                      percentage: skill["percentage"],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Animated Skill Card with Hover Effect
class SkillCard extends StatefulWidget {
  final IconData icon;
  final String name;
  final int percentage;

  const SkillCard({
    super.key,
    required this.icon,
    required this.name,
    required this.percentage,
  });

  @override
  _SkillCardState createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 100, // Smaller Width
        decoration: BoxDecoration(
          color: isHovered ? Colors.purpleAccent : Colors.black54,
          borderRadius: BorderRadius.circular(12),
          boxShadow: isHovered
              ? [const BoxShadow(color: Colors.purpleAccent, blurRadius: 10)]
              : [],
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(widget.icon, color: Colors.white, size: 24),
            const SizedBox(height: 5),
            Text(
              widget.name,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            ),
            const SizedBox(height: 3),
            Text(
              "${widget.percentage}%",
              style: const TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
