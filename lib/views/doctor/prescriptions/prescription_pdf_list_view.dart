import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project_emr/res/res.dart';
import 'package:project_emr/widgets/widgets.dart';

class PrescriptionPdfListView extends StatelessWidget {
  const PrescriptionPdfListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: 'Prescriptions',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(16),
            ListView.separated(
              shrinkWrap: true,
              itemCount: 30,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => const Gap(12),
              itemBuilder: (context, index) => Card(
                margin: Dimens.edgeInsets16_0_16_0,
                color: Colors.white,
                elevation: 5,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueAccent.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(Dimens.ten),
                  ),
                  child: Padding(
                    padding: Dimens.edgeInsets10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Prescription$index.pdf',
                          style: Styles.black14w500,
                        ),
                        const Gap(5),
                        const Text('Date : 2024-01-01'),
                        Gap(5),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.remove_red_eye,
                                  color: ColorsValue.secondaryColor,
                                ),
                                label: const Text(
                                  'View',
                                  style: TextStyle(
                                      color: ColorsValue.secondaryColor),
                                ),
                              ),
                            ),
                            const Gap(15),
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.download,
                                  color: ColorsValue.secondaryColor,
                                ),
                                label: const Text(
                                  'Download',
                                  style: TextStyle(
                                      color: ColorsValue.secondaryColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
