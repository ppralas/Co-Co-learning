import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skola/common/presentation/widget/regular_text.dart';
import 'package:skola/common/presentation/widget/title_text_bolded.dart';
import 'package:skola/student/presentation/screens/solutions.dart';
import 'package:skola/student/presentation/screens/template_screens/grid_screen_template.dart';
import 'package:skola/student/presentation/widgets/activity_card.dart';
import 'package:skola/student/presentation/widgets/exam_done_card.dart';
import 'package:skola/theme/app_colors.dart';

class ExamDone extends ConsumerWidget {
  const ExamDone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridScreenTemplate(
      widget1: ExamDoneCard(
        color: AppColors.lightBlue,
      ),
      widget2: ExamDoneCard(
        color: AppColors.lightOrange,
      ),
      widget3: ExamDoneCard(
        color: AppColors.lightYellow,
      ),
      widget4: ExamDoneCard(
        color: AppColors.veryLightPurple,
      ),
    );
  }
}

class ExamDoneCard extends StatelessWidget {
  final Color color;

  const ExamDoneCard({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: InkWell(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(24),
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(4),
            ),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TitleTextBolded(titleText: 'Vjezba je gotova!'),
              SizedBox(
                height: 24,
              ),
              RegularText(text: 'Idemo vidjeti rezultate!')
            ],
          ),
        ),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SolutionsScreen(),
          ),
        ),
      ),
    );
  }
}
