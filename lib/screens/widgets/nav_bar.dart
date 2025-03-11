import 'package:flutter/material.dart';
import 'package:porfolio/Reusable%20Functions/navigation.dart';
import 'package:porfolio/constants/colors.dart';
import 'package:porfolio/screens/home_page.dart';
import 'package:porfolio/screens/widgets/contact_form.dart';
import 'package:porfolio/screens/widgets/major_projects.dart';

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
          Flexible(
            child: const Text("Dimple Kaundal",
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
        NavButton(
          title: 'Home',
          onTap: () {
            navigateToPage(context, const HomePage());
          },
          isSmallScreen: isSmallScreen,
        ),
        NavButton(
          title: 'Projects',
          onTap: () {
            navigateToPage(context, const MajorProjects());
          },
          isSmallScreen: isSmallScreen,
        ),
        NavButton(
          title: 'Contact',
          onTap: () {
            navigateToPage(context, const ContactForm());
          },
          isSmallScreen: isSmallScreen,
        ),
      ],
    );
  }
}

class NavButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isSmallScreen;

  const NavButton(
      {super.key,
      required this.title,
      required this.onTap,
      required this.isSmallScreen});

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      TextButton(
        onPressed: onTap,
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white,
              fontFamily: "Poppins",
              fontSize: isSmallScreen ? 10 : 15),
        ),
      ),
    ]);
  }
}
