import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:porfolio/constants/colors.dart';
import 'package:porfolio/screens/widgets/text_widet.dart';

class MyServicesWidget extends StatefulWidget {
  final Size size;
  const MyServicesWidget({super.key, required this.size});

  @override
  State<MyServicesWidget> createState() => _MyServicesWidgetState();
}

class _MyServicesWidgetState extends State<MyServicesWidget> {
  final List<bool> _isHovered = [false, false, false, false, false];
  final List<String> title = [
    "App Development",
    "Web Development",
    "UI/UX Design with Figma",
    "WordPress",
  ];

  final List<String> description = [
    "As an expert Flutter developer, I create cross-platform mobile apps that run seamlessly on both iOS and Android. From initial concept to deployment, I build user-friendly, high-performance apps with stunning UIs, smooth animations, and integrated functionalities.",
    "Specializing in building dynamic, responsive websites and web applications using modern technologies such as HTML, CSS, JavaScript, and frameworks like React and Node.js. I provide scalable, secure, and high-performing web solutions tailored to your business needs.",
    "As a proficient Figma designer, I craft visually appealing and user-centric interfaces that deliver an engaging experience. I work on creating wireframes, prototypes, and high-fidelity designs to make sure the product resonates with your audience and offers seamless usability.",
    "Developing custom WordPress themes and plugins to meet the specific needs of your website. I provide fully tailored solutions that extend the functionality and design of WordPress, making your site unique and feature-rich."
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: title.length,
      itemBuilder: (context, index) {
        return MouseRegion(
          onEnter: (_) => setState(() => _isHovered[index] = true),
          onExit: (_) => setState(() => _isHovered[index] = false),
          child: AnimatedContainer(
            padding: const EdgeInsets.symmetric(
                horizontal: 20, vertical: 20), // Reduce vertical padding
            duration: const Duration(microseconds: 300),
            curve: Curves.easeInOut,
            margin: EdgeInsets.symmetric(horizontal: widget.size.width * 0.05),
            width: widget.size.width,
            decoration: BoxDecoration(
              color: _isHovered[index] ? null : Colors.transparent,
              border: Border.all(
                color: _isHovered[index]
                    ? AppColors.studio.withOpacity(0.5)
                    : Colors.transparent,
              ),
              gradient: _isHovered[index]
                  ? const LinearGradient(
                      colors: [AppColors.studio, AppColors.ebony],
                    )
                  : null,
            ),
            child: widget.size.width > 600
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween, // Adjusted spacing
                    children: [
                      // Index Text (e.g., "1")
                      TextWidget(
                        sSize: widget.size,
                        text: "${index + 1}",
                        size: 25,
                        color: Colors.white,
                      ),
                      SizedBox(
                          width: widget.size.height * 0.05), // Reduced space
                      // Title Text
                      Expanded(
                        child: TextWidget(
                          sSize: widget.size,
                          text: title[index],
                          size: 22,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                          width: widget.size.height * 0.01), // Reduced space
                      // Description Text
                      Expanded(
                        child: TextWidget(
                          sSize: widget.size,
                          text: description[index],
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                      // Icon for hover state
                      FaIcon(
                        _isHovered[index]
                            ? FontAwesomeIcons.arrowTrendUp
                            : FontAwesomeIcons.arrowTrendDown,
                        color:
                            _isHovered[index] ? Colors.white : AppColors.studio,
                      )
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Index Text (e.g., "1")
                      TextWidget(
                        sSize: widget.size,
                        text: "${index + 1}",
                        size: 22,
                        color: Colors.white,
                      ),
                      SizedBox(
                          height: widget.size.height * 0.01), // Reduced space
                      // Title Text
                      TextWidget(
                        sSize: widget.size,
                        text: title[index],
                        size: 20,
                        color: Colors.white,
                      ),
                      SizedBox(
                          height: widget.size.height * 0.01), // Reduced space
                      // Description Text
                      Wrap(
                        direction: Axis.horizontal,
                        children: [
                          TextWidget(
                            alignment: TextAlign.start,
                            sSize: widget.size,
                            text: description[index],
                            size: 16,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
