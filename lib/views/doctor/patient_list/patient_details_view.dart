import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:project_emr/res/res.dart';
import 'package:project_emr/utils/utils.dart';
import 'package:project_emr/widgets/widgets.dart';

class PatientDetailsView extends StatelessWidget {
  const PatientDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: 'Kevin Nash',
      ),
      body: Padding(
        padding: Dimens.edgeInsets16,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: Get.height * 0.25,
                width: Get.width,
                decoration: BoxDecoration(
                  color: ColorsValue.secondaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset('assets/images/patient.png'),
              ),
              const Gap(15),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name : Kevin Nash',
                            style: Styles.blackBold14,
                          ),
                          Text(
                            'Age : 32 Yrs, M',
                            style: Styles.blackBold14,
                          ),
                        ],
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {},
                        style: const ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(ColorsValue.primaryColor),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.history_rounded,
                              size: 20,
                              color: Colors.white,
                            ),
                            const Gap(5),
                            Text(
                              'History',
                              style: Styles.white12w500,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Gap(20),
                  Text(
                    'Symptoms :',
                    style: Styles.blackBold14,
                  ),
                  const Gap(10),
                  Text(
                    'High Temperature\nRunning Nose\nThroat Pain',
                    style: Styles.black14,
                  ),
                  const Gap(20),
                  CustomTextfield(
                    hintText: 'Chief Complaint',
                    onChange: (value) {},
                  ),
                  const Gap(20),
                  CustomDropdownField(
                    onChanged: (p0) {},
                    hintText: 'Diagnostic',
                    dropDownList: [
                      DropDownValueModel(name: 'Food Poision', value: '1'),
                      DropDownValueModel(name: 'Gastritis', value: '1'),
                      DropDownValueModel(
                          name: 'Peptic Ulcer Disease (PUD)', value: '1'),
                      DropDownValueModel(name: 'Gastroparesis', value: '1'),
                      DropDownValueModel(name: 'Gastroenteritis', value: '1'),
                    ],
                  ),
                  const Gap(20),
                  GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    childAspectRatio: 1.5,
                    children: [
                      PatientOptions(
                        title: 'Previous Prescription',
                        ontap: () {},
                      ),
                      const PatientOptions(
                        title: 'Order Medicine',
                        color: Colors.amber,
                        ontap: RouteManagement.goToOrderMedicine,
                      ),
                      PatientOptions(
                        title: 'Order Lab Test',
                        color: Colors.red,
                        ontap: () {},
                      ),
                      PatientOptions(
                        title: 'Order Radiology Test',
                        color: Colors.green,
                        ontap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PatientOptions extends StatelessWidget {
  const PatientOptions({
    super.key,
    required this.title,
    this.color = Colors.cyan,
    required this.ontap,
  });

  final String title;
  final Color? color;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return ScaleTap(
      onPressed: ontap,
      child: Card(
        elevation: 10,
        color: Colors.white,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimens.ten),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [color ?? Colors.cyan, color!.withOpacity(0.3)],
            ),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(Dimens.ten),
              child: Text(
                title,
                style: Styles.black14w500,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
