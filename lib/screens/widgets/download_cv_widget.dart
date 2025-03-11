import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:porfolio/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class DownloadCVButton extends StatelessWidget {
  const DownloadCVButton({
    super.key,
  });

  // Method to launch the CV URL for download
  Future<void> downloadCV() async {
    const String fileUrl =
        'https://drive.google.com/open?id=1X1yvKaOPIjaSFc1x3qlI52OLFOhEh51p&usp=drive_fs'; // Replace with your actual file URL

    // Launch the URL to trigger the download
    if (await canLaunch(fileUrl)) {
      await launch(fileUrl);
    } else {
      throw 'Could not launch $fileUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: downloadCV, // Trigger download when the button is clicked
      child: Container(
        height: 50,
        width: 250,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.paleSlate),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Download CV",
              style: TextStyle(color: AppColors.paleSlate),
            ),
            SizedBox.square(
              dimension: 12,
            ),
            FaIcon(
              FontAwesomeIcons.download,
              color: AppColors.paleSlate,
              size: 18,
            )
          ],
        ),
      ),
    );
  }
}
