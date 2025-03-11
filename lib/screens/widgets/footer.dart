import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:porfolio/Reusable%20Functions/navigation.dart';
import 'package:porfolio/constants/colors.dart';
import 'package:porfolio/screens/widgets/contact_form.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});
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

  // Function to send email
  Future<void> _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'dimplekaundal595@gmail.com', // Replace with your email
      queryParameters: {
        'subject': 'Hello, I saw your portfolio!',
        'body': 'I wanted to reach out to you...'
      },
    );

    if (await canLaunch(emailUri.toString())) {
      await launch(emailUri.toString());
    } else {
      throw 'Could not send email';
    }
  }

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isTablet = size.width < 1120;
    bool isMobile = size.width < 600;

    // Function to adjust font size based on screen width
    double getFontSize(double baseSize) {
      if (isMobile) {
        return baseSize * 0.8; // Reduce font size for mobile (less than 600px)
      }
      return baseSize; // Use the base size for larger screens
    }

    return Wrap(
      children: [
        Container(
          color: AppColors.revolver,
          height: MediaQuery.of(context).size.height * .61,
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  // height: MediaQuery.of(context).size.height * (350 / 1080),
                  decoration: const BoxDecoration(
                    color: AppColors.ebony,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * .32),
                      Text(
                        "Living, learning, & leveling up\none day at a time.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: getFontSize(14), // Adjust font size
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButtons(FontAwesomeIcons.linkedin, () {
                            widget._launchLinkedIn();
                          }),
                          IconButtons(FontAwesomeIcons.github, () {
                            widget._launchGitHub();
                          }),
                          IconButtons(FontAwesomeIcons.envelope, () {
                            widget._launchEmail();
                          }),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 250,
                left: 20,
                right: 20,
                child: MouseRegion(
                  onEnter: (_) {
                    setState(() {
                      isLoading = true;
                    });
                  },
                  onExit: (_) {
                    setState(() {
                      isLoading = false;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(microseconds: 10),
                    padding: isTablet
                        ? const EdgeInsets.all(35)
                        : const EdgeInsets.symmetric(
                            vertical: 40, horizontal: 16),
                    height: isTablet ? 195 : 155,
                    decoration: BoxDecoration(
                      color:
                          isLoading ? AppColors.paleSlate : AppColors.valhalla,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: isTablet
                        ? Column(
                            children: [
                              myText("Excited to collaborate",
                                  getFontSize(22)), // Adjust font size
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .02),
                              myText(
                                  "Let’s connect and turn ideas into reality!",
                                  getFontSize(15)), // Adjust font size
                              const SizedBox(height: 9),
                              OutlinedButton.icon(
                                onPressed: () {},
                                icon: Icon(FontAwesomeIcons.handPeace,
                                    color: isLoading
                                        ? AppColors.valhalla
                                        : AppColors.paleSlate),
                                label: const Text("Let’s Connect"),
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: isLoading
                                      ? AppColors.ebony
                                      : AppColors.paleSlate,
                                  side: BorderSide(
                                      color: isLoading
                                          ? AppColors.ebony
                                          : AppColors.paleSlate),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Wrap(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                myText("Excited to collaborate",
                                    getFontSize(24)), // Adjust font size
                                myText(
                                  "Let’s connect and turn ideas into reality!",
                                  getFontSize(18), // Adjust font size
                                ),
                                const SizedBox(height: 12),
                                OutlinedButton.icon(
                                  onPressed: () {
                                    navigateToPage(context, ContactForm());
                                  },
                                  icon: Icon(FontAwesomeIcons.handPeace,
                                      color: isLoading
                                          ? AppColors.valhalla
                                          : AppColors.paleSlate),
                                  label: const Text("Let’s Connect"),
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: isLoading
                                        ? AppColors.ebony
                                        : AppColors.paleSlate,
                                    side: BorderSide(
                                        color: isLoading
                                            ? AppColors.ebony
                                            : AppColors.paleSlate),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget IconButtons(IconData icon, Function()? onPressed) {
    return IconButton(
      icon: Icon(icon),
      onPressed: onPressed,
      color: AppColors.paleSlate,
    );
  }

  Widget myText(String text, double fontSize) {
    return Text(
      text,
      style: GoogleFonts.poppins(
          fontSize: fontSize, // Apply dynamic font size
          fontWeight: FontWeight.bold,
          color: isLoading ? AppColors.valhalla : AppColors.paleSlate),
    );
  }
}
