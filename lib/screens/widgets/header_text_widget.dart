import 'package:flutter/material.dart';
import 'package:porfolio/constants/colors.dart';
import 'package:porfolio/screens/widgets/download_cv_widget.dart';
import 'package:porfolio/screens/widgets/social_widget.dart';
import 'package:porfolio/screens/widgets/text_widet.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class HeaderTextWidget extends StatelessWidget {
  final Size size;
  const HeaderTextWidget({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: size.width * 0.07,
      ),
      child: Column(
        crossAxisAlignment: size.width > 600
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextWidget(
            sSize: size,
            text: "I am Dimple",
            color: Colors.white,
            size: 26,
            fw: FontWeight.w400,
            alignment: TextAlign.center,
          ),
          GradientTextWidget(
            size: size,
            alignment: TextAlign.center,
            text1: "Flutter Developer",
            text2: "UX Designer",
          ),
          SizedBox(
            width: size.width * 0.5,
            child: TextWidget(
              sSize: size,
              // alignment: TextAlign.justify,
              text:
                  "Enthusiastic and motivated Flutter developer always eager to learn and grow. With expertise in mobile app development and a passion for emerging technologies, I strive to stay up-to-date with the latest Flutter updates and trends to deliver cutting-edge, efficient, and scalable applications.",
              size: 16,
              color: Colors.white,
              fw: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

class GradientTextWidget extends StatelessWidget {
  final TextAlign? alignment;
  final String? text1;
  final String? text2;
  final Color? color1;
  final Color? color2;
  final double? fsize;
  final FontWeight? fw;
  const GradientTextWidget(
      {super.key,
      required this.size,
      this.alignment,
      this.fw,
      this.color1,
      this.text1,
      this.text2,
      this.color2,
      this.fsize});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GradientText(
      textAlign: size.width < 600 && alignment != null ? alignment : null,
      "$text1\n${text2 ?? ""}",
      colors: const [
        AppColors.studio,
        AppColors.paleSlate,
      ],
      style: TextStyle(
          fontSize: size.width * 0.040,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.bold),
    );
  }
}

class Social_large extends StatelessWidget {
  const Social_large({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.5,
      child: const Row(
        children: [
          DownloadCVButton(),
          SizedBox(
            width: 20,
          ),
          SocialWidget()
        ],
      ),
    );
  }
}
