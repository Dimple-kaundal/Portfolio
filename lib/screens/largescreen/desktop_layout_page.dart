import 'package:flutter/material.dart';
import 'package:porfolio/constants/colors.dart';
import 'package:porfolio/constants/styles.dart';
import 'package:porfolio/screens/widgets/custom_tab_bar.dart';
import 'package:porfolio/screens/widgets/education.dart';
import 'package:porfolio/screens/widgets/footer.dart';
import 'package:porfolio/screens/widgets/header_text_widget.dart';
import 'package:porfolio/screens/widgets/myservice_widgets.dart';
import 'package:porfolio/screens/widgets/nav_bar.dart';
import 'package:porfolio/screens/widgets/rotating_image_widget.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../widgets/skills.dart';

class DesktopLayout extends StatefulWidget {
  const DesktopLayout({super.key});

  @override
  State<DesktopLayout> createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<DesktopLayout>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const NavBar(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: Styles.gradientDecoration,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: size.height * 0.18),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        HeaderTextWidget(
                          size: size,
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        Social_large(size: size),
                      ],
                    ),
                    const Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [RotatingImageContainer()],
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              Container(
                color: AppColors.ebony,
                padding: EdgeInsets.symmetric(vertical: size.width * 0.05),
                child: Column(
                  children: [
                    GradientText(
                      "My Quality Services",
                      colors: const [
                        AppColors.studio,
                        AppColors.paleSlate,
                      ],
                      style: TextStyle(
                          fontSize: size.width * 0.030,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    MyServicesWidget(size: size),
                  ],
                ),
              ),
              Container(
                width: size.width,
                padding: EdgeInsets.symmetric(vertical: size.width * 0.01),
                child: Column(
                  children: [
                    GradientTextWidget(
                      size: size,
                      text1: "My recent Work",
                    ),
                    // SizedBox(
                    //   height: size.height * 0.01,
                    // ),
                    CustomTabBar(tabController: _tabController)
                  ],
                ),
              ),
              SizedBox(
                height: size.height,
                child: CustomTabBarView(tabController: _tabController),
              ),
              SizedBox(
                height: size.height * 0.10,
              ),
              Container(
                  height: MediaQuery.of(context).size.height * .75,
                  color: AppColors.ebony,
                  child: const ExperienceEducationScreen()),
              SizedBox(
                height: size.width * 0.05,
              ),
              Container(
                color: AppColors.revolver,
                width: size.width,
                height: size.height * .8,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      GradientTextWidget(
                        size: size,
                        text1: "My Skills",
                        fsize: 12,
                        fw: FontWeight.w300,
                      ),
                      const Skills(),
                      SizedBox(
                        height: size.height * 0.1,
                      ),
                    ],
                  ),
                ),
              ),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
