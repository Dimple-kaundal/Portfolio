import 'package:flutter/material.dart';
import 'package:porfolio/constants/colors.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class ExperienceEducationScreen extends StatelessWidget {
  const ExperienceEducationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isTablet = constraints.maxWidth < 900;
          bool isMobile = constraints.maxWidth < 600;

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 16.0 : 0),
            child: isTablet
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: _buildCards(),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(child: _buildCards()[0]),
                      const SizedBox(width: 16),
                      Flexible(child: _buildCards()[1]),
                    ],
                  ),
          );
        },
      ),
    );
  }

  List<Widget> _buildCards() {
    return [
      ExperienceEducationCard(
        title: "My Experience",
        icon: Icons.work,
        details: [
          ExperienceDetail("  Aug 2024 - Present", "Flutter Developer Intern",
              "C-DAC, Mohali"),
          ExperienceDetail("2024", "MERN Stack Developer Trainee",
              "Solitaire Infosys Pvt Ltd, Mohali"),
          ExperienceDetail("2021", "Data Science Trainee", "CDAC, Mohali"),
        ],
      ),
      ExperienceEducationCard(
        title: "My Education",
        icon: Icons.school,
        details: [
          ExperienceDetail("2022-2024", "Masters In Computer Application",
              "Himachal Pradesh University"),
          ExperienceDetail("2020", "Bachelor in Computer Application",
              "Govt Degree College Solan"),
          ExperienceDetail("2017", "Higher Secondary Education",
              "Sanatan Dharam Sen. Sec. School, Solan"),
          ExperienceDetail("2015", "Secondary School Education",
              "Sanatan Dharam Sen. Sec. School, Solan"),
        ],
      ),
    ];
  }
}

class ExperienceEducationCard extends StatefulWidget {
  final String title;
  final IconData icon;
  final List<ExperienceDetail> details;

  const ExperienceEducationCard({
    super.key,
    required this.title,
    required this.icon,
    required this.details,
  });

  @override
  State<ExperienceEducationCard> createState() =>
      _ExperienceEducationCardState();
}

class _ExperienceEducationCardState extends State<ExperienceEducationCard> {
  late List<bool> _isHovered;

  @override
  void initState() {
    super.initState();
    _isHovered = List.generate(widget.details.length, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(widget.icon, color: AppColors.paleSlate, size: 24),
              const SizedBox(width: 8),
              GradientText(
                widget.title,
                colors: const [AppColors.paleSlate, AppColors.studio],
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.details.length,
            itemBuilder: (context, index) {
              return MouseRegion(
                onEnter: (_) => setState(() => _isHovered[index] = true),
                onExit: (_) => setState(() => _isHovered[index] = false),
                child: ExperienceEducationItem(
                  detail: widget.details[index],
                  isHovered: _isHovered[index],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ExperienceDetail {
  final String year;
  final String title;
  final String organization;

  ExperienceDetail(this.year, this.title, this.organization);
}

class ExperienceEducationItem extends StatelessWidget {
  final bool isHovered;
  final ExperienceDetail detail;

  const ExperienceEducationItem(
      {super.key, required this.detail, required this.isHovered});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        border: Border.all(
            color: isHovered ? AppColors.studio : Colors.transparent),
        borderRadius: BorderRadius.circular(8),
        gradient: isHovered
            ? const LinearGradient(colors: [AppColors.studio, AppColors.ebony])
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(detail.year,
              style: TextStyle(
                  color: isHovered ? AppColors.paleSlate : AppColors.studio,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(detail.title,
              style: const TextStyle(
                  color: AppColors.paleSlate,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(detail.organization,
              style: const TextStyle(color: AppColors.paleSlate, fontSize: 14)),
        ],
      ),
    );
  }
}
