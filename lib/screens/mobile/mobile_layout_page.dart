import 'package:flutter/material.dart';
import 'package:porfolio/constants/colors.dart';
import 'package:porfolio/constants/styles.dart';
import 'package:porfolio/screens/tablet/tablet_layout_page.dart';
import 'package:porfolio/screens/widgets/custom_tab_bar.dart';
import 'package:porfolio/screens/widgets/education.dart';
import 'package:porfolio/screens/widgets/footer.dart';
import 'package:porfolio/screens/widgets/footer_Test.dart';
import 'package:porfolio/screens/widgets/header_text_widget.dart';
import 'package:porfolio/screens/widgets/myservice_widgets.dart';
import 'package:porfolio/screens/widgets/nav_bar.dart';
import 'package:porfolio/screens/widgets/rotating_image_widget.dart';
import 'package:porfolio/screens/widgets/skills.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({super.key});

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout>
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
      // appBar: const NavBar(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: Styles.gradientDecoration,
        child: Stack(
          children: [
            /// 🛠️ The Scrollable Container
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.05),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [RotatingImageContainer()],
                    ),
                  ),
                  SizedBox(height: size.width * 0.09),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              HeaderTextWidget(size: size),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Social_Tab(size: size)
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: size.width * 0.09),
                  Container(
                    color: AppColors.ebony,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.02),
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
                          SizedBox(height: size.height * 0.02),
                          MyServicesWidget(size: size),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      GradientTextWidget(
                        size: size,
                        text1: "My recent Work",
                      ),
                      CustomTabBar(tabController: _tabController),
                    ],
                  ),
                  SizedBox(
                    height: size.height,
                    child: CustomTabBarView(tabController: _tabController),
                  ),
                  SizedBox(height: size.height * 0.10),

                  /// 🛠️ **Fixed Content Inside a Scrollable Container**
                  SingleChildScrollView(
                    child: Container(
                      // height: MediaQuery.of(context).size.height * .75,
                      color: AppColors.ebony,
                      child: Column(
                        children: [
                          ExperienceEducationScreen(),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: size.width * 0.05),

                  /// 🛠️ **Fixed Skills Section**
                  Container(
                    color: AppColors.revolver,
                    width: size.width,
                    height: size.height * .7,
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
                          SizedBox(height: size.height * 0.1),
                        ],
                      ),
                    ),
                  ),

                  /// 🛠️ **Fixed Footer**
                  SizedBox(
                    height: size.height * 0.50,
                    child: CustomFooter(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
