// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:porfolio/screens/home_page.dart';
import 'package:porfolio/screens/widgets/major_projects.dart';
import 'package:porfolio/screens/widgets/my_contact_from.dart';
import 'package:porfolio/screens/widgets/reusable.dart';

class AdminLoginPage extends StatefulWidget {
  AdminLoginPage({
    super.key,
    this.bodyWidget,
    this.selectedButtonName,
  });
  Widget? bodyWidget;
  final String? selectedButtonName;

  @override
  State<AdminLoginPage> createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  Map<String, dynamic> user = {
    'firstName': '',
    'lastName': '',
    'profileImage': null,
    'center': 'C-DAC, Mohali',
    'center type': 'PI',
    'profile': AdminLoginPage(
      selectedButtonName: 'Admin Proflie',
      // bodyWidget: const AdminParticipatingRegs(
      //   isHeaderRequied: false,
      // ),
    )
  };
  List<Map<String, dynamic>> menuItems = [
    {
      'icon': Icons.home,
      'title': <String, dynamic>{'Home': HomePage()},
    },
    {
      'icon': Icons.work,
      'title': <String, dynamic>{'Project': MajorProjects()},
    },
    {
      'icon': Icons.email,
      'title': <String, dynamic>{'Contact': ContactPage()},
    }
  ];

  @override
  Widget build(BuildContext context) {
    return NewLoginpageFormat(
      menuItems: menuItems,
      user: user,
    );
  }
}
