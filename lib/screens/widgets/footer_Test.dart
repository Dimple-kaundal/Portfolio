import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:porfolio/Reusable%20Functions/navigation.dart';
import 'package:porfolio/constants/styles.dart';
import 'package:porfolio/screens/widgets/my_contact_from.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomFooter extends StatelessWidget {
  const CustomFooter({super.key});
  Future<void> _launchLinkedIn() async {
    const url =
        'https://www.linkedin.com/in/dimple-kaundal-87a355191/?viewAsMember=true';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchGitHub() async {
    const url =
        'https://github.com/Dimple-kaundal'; // Replace with your GitHub username
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Column(
      children: [
        // Purple collaboration section
        Container(
          width: double.infinity,
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(24),
          decoration: Styles.gradientDecoration.copyWith(
            borderRadius: BorderRadius.circular(25),
          ),
          child: isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Excited to collaborate',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Let’s connect and turn ideas into reality!',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 20),
                    OutlinedButton.icon(
                      onPressed: () {
                        navigateToPage(context, ContactPage());
                      },
                      icon: const Icon(Icons.handshake_outlined,
                          color: Colors.white70),
                      label: const Text("Let’s Connect"),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white70,
                        side: const BorderSide(color: Colors.white70),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                      ),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Excited to collaborate',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                      ),
                    ),
                    Text(
                      'Let’s connect and turn ideas into reality!',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white70,
                      ),
                    ),
                    OutlinedButton.icon(
                      onPressed: () {
                        navigateToPage(context, ContactPage());
                      },
                      icon: const Icon(Icons.handshake_outlined,
                          color: Colors.white70),
                      label: const Text("Let’s Connect"),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white70,
                        side: const BorderSide(color: Colors.white70),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                      ),
                    ),
                  ],
                ),
        ),

        // Bottom black footer
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 24, bottom: 32),
          color: const Color(0xFF0A0615),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Living, learning, & leveling up\none day at a time.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.linkedin),
                    color: Colors.white70,
                    onPressed: () {
                      _launchLinkedIn();
                    },
                  ),
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.github),
                    color: Colors.white70,
                    onPressed: () {
                      _launchGitHub();
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
