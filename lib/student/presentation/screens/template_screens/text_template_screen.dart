// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:skola/common/presentation/widget/regular_text.dart';
// import 'package:skola/common/presentation/widget/title_text_bolded.dart';
// import 'package:skola/student/domain/student_notifiers/student_notifier.dart';
// import 'package:skola/theme/app_colors.dart';

// class NotificationTemplate extends ConsumerWidget {
//   const NotificationTemplate({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Scaffold(
//       body: Container(
//         color: AppColors.lightOrange,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 RegularText(
//                     text: ref.watch(studentNotifierProvider.name ?? '')),
//                 RegularText(text: '10:00'),
//               ],
//             ),
//             Center(
//               child: Column(
//                 children: const [
//                   TitleTextBolded(titleText: 'Bravo!'),
//                   RegularText(text: 'Pričekaj do kraja da ostali završe.'),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
