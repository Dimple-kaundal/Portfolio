import 'package:flutter/material.dart';
import 'package:porfolio/Reusable%20Functions/navigation.dart';
import 'package:porfolio/constants/colors.dart';
import 'package:porfolio/screens/home_page.dart';
import 'package:porfolio/screens/widgets/contact_form.dart';
import 'package:porfolio/screens/widgets/major_projects.dart';
import 'package:porfolio/screens/widgets/my_contact_from.dart';

class NavBar extends StatefulWidget implements PreferredSizeWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isSmallScreen = size.width < 415;

    return AppBar(
      title: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.revolver,
            ),
            child: const Text(
              "DK",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(width: 8),
          const Flexible(
            child: Text("Dimple Kaundal",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontSize: 12,
                )),
          ),
        ],
      ),
      backgroundColor: AppColors.valhalla,
      elevation: 0,
      actions: [
        // For large screens
        if (!isSmallScreen) ...[
          NavButton(
            title: 'Home',
            onTap: () {
              navigateToPage(context, const HomePage());
            },
          ),
          NavButton(
            title: 'Projects',
            onTap: () {
              navigateToPage(context, const MajorProjects());
            },
          ),
          NavButton(
            title: 'Contact',
            onTap: () {
              navigateToPage(context, ContactPage());
            },
          ),
        ],
        // For small screens - Hamburger menu
        // if (isSmallScreen)
        //   PopupMenuButton<String>(
        //     icon: const Icon(Icons.menu, color: AppColors.paleSlate),
        //     itemBuilder: (BuildContext context) => [
        //       PopupMenuItem<String>(
        //         value: 'Home',
        //         child: const Text('Home'),
        //       ),
        //       PopupMenuItem<String>(
        //         value: 'Projects',
        //         child: const Text('Projects'),
        //       ),
        //       PopupMenuItem<String>(
        //         value: 'Contact',
        //         child: const Text('Contact'),
        //       ),
        //     ],
        //     onSelected: (value) {
        //       if (value == 'Home') {
        //         navigateToPage(context, const HomePage());
        //       } else if (value == 'Projects') {
        //         navigateToPage(context, const MajorProjects());
        //       } else if (value == 'Contact') {
        //         navigateToPage(context, const ContactForm());
        //       }
        //     },
        //   ),
      ],
    );
  }
}

class NavButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const NavButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontFamily: "Poppins",
          fontSize: 15,
        ),
      ),
    );
  }
}
