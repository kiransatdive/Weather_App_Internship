import 'package:flutter/material.dart';

import '/constants/app_colors.dart';

class RoundTextField extends StatelessWidget {
  const RoundTextField({
    super.key,
    this.controller,
  });

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: AppColors.accentBlue,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        controller: controller,
        style: const TextStyle(
          color: AppColors.white,
        ),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.only(left: 20, right: 40),
          fillColor: Colors.white,
          focusColor: Colors.white,
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(
            color: AppColors.grey,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
