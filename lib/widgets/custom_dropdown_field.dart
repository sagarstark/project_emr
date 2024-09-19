import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:project_emr/res/res.dart';

class CustomDropdownField extends StatelessWidget {
  const CustomDropdownField({
    super.key,
    required this.dropDownList,
    required this.hintText,
    required this.onChanged,
  });

  final List<DropDownValueModel> dropDownList;
  final String hintText;
  final Function(dynamic) onChanged;

  @override
  Widget build(BuildContext context) {
    return DropDownTextField(
      readOnly: true,
      onChanged: onChanged,
      textFieldDecoration: InputDecoration(
        // alignLabelWithHint: true,
        labelText: hintText,
        hintText: hintText,
        hintStyle: Styles.grey14,
        floatingLabelStyle:
            Styles.grey14.copyWith(color: ColorsValue.primaryColor),
        labelStyle: Styles.grey14,
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(
            Dimens.ten,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.withOpacity(.3),
            width: Dimens.one,
          ),
          borderRadius: BorderRadius.circular(
            Dimens.ten,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorsValue.primaryColor,
            width: Dimens.one,
          ),
          borderRadius: BorderRadius.circular(
            Dimens.ten,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(
            Dimens.ten,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: Dimens.one,
          ),
          borderRadius: BorderRadius.circular(
            Dimens.ten,
          ),
        ),
      ),
      dropDownList: dropDownList,
    );
  }
}
