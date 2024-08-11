import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project_emr/res/res.dart';
import 'package:project_emr/utils/utils.dart';
import 'package:project_emr/widgets/widgets.dart';

class AddDependentsView extends StatelessWidget {
  const AddDependentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Add Dependents',
        actions: [
          Padding(
            padding: EdgeInsets.only(right: Dimens.sixteen),
            child: ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  ColorsValue.secondaryColor,
                ),
              ),
              onPressed: () {},
              child: Text(
                '+ Add New',
                style: Styles.black12,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: Dimens.edgeInsets16,
        child: Row(
          children: [
            const Expanded(
              child: CustomButton(
                title: 'Save',
                isDisable: false,
                onTap: RouteManagement.goToUploadDocuments,
              ),
            ),
            const Gap(10),
            Expanded(
              child: CustomButton(
                title: 'Cancel',
                isDisable: false,
                buttonType: ButtonType.cancelled,
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: Dimens.edgeInsets16,
        child: Column(
          children: [
            CustomTextfield(
              onChange: (value) {},
              hintText: 'National ID',
            ),
            const Gap(10),
            CustomTextfield(
              onChange: (value) {},
              hintText: 'Name',
            ),
            const Gap(10),
            CustomTextfield(
              onChange: (value) {},
              hintText: 'Age',
            ),
            const Gap(10),
            CustomTextfield(
              onChange: (value) {},
              hintText: 'Relation',
            ),
          ],
        ),
      ),
    );
  }
}
