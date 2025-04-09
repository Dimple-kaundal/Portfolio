import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:porfolio/Reusable%20Functions/navigation.dart';
import 'package:porfolio/constants/colors.dart';
import 'package:porfolio/screens/widgets/contact_form.dart';
import 'package:porfolio/screens/widgets/my_contact_from.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialWidget extends StatelessWidget {
  const SocialWidget({super.key});

  Future<void> _launchLinkedIn() async {
    final Uri linkedInAppUri =
        Uri.parse("linkedin://profile/dimple-kaundal-87a355191");
    final Uri linkedInWebUri =
        Uri.parse("https://www.linkedin.com/in/dimple-kaundal-87a355191");

    if (await canLaunchUrl(linkedInAppUri)) {
      // Open in LinkedIn App
      await launchUrl(linkedInAppUri);
    } else {
      // Open in external browser instead of WebView
      await launchUrl(linkedInWebUri, mode: LaunchMode.externalApplication);
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

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // LinkedIn Button
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
            // ignore: deprecated_member_use
            border: Border.all(color: AppColors.studio.withOpacity(0.5)),
          ),
          child: Center(
            child: IconButton(
              hoverColor: AppColors.paleSlate,
              onPressed: () {
                _launchLinkedIn();
                // LinkedIn URL
              },
              icon: const FaIcon(
                FontAwesomeIcons.linkedinIn,
                color: AppColors.studio,
                size: 15,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),

        // GitHub Button
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.studio.withOpacity(0.5)),
          ),
          child: Center(
            child: IconButton(
              hoverColor: AppColors.paleSlate,
              onPressed: () {
                _launchGitHub();
                // GitHub URL
              },
              icon: const FaIcon(
                FontAwesomeIcons.github,
                color: AppColors.studio,
                size: 15,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),

        // Email Button
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.studio.withOpacity(0.5)),
          ),
          child: Center(
            child: IconButton(
              hoverColor: AppColors.paleSlate,
              onPressed: () {
                navigateToPage(context, ContactPage());
                // Email URL
              },
              icon: const FaIcon(
                FontAwesomeIcons.envelope,
                color: AppColors.studio,
                size: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
