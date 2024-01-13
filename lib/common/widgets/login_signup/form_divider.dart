import 'package:flutter/material.dart';
import 'package:food_store/utils/constants/colors.dart';

class FormDivider extends StatelessWidget {
  const FormDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Flexible(
          child: Divider(thickness: 1, indent: 5, endIndent: 25),
        ),
        Text(
          "or sign up with",
          style: TextStyle(color: AppColors.darkGrey),
        ),
        Flexible(
          child: Divider(thickness: 1, indent: 25, endIndent: 5),
        ),
      ],
    );
  }
}
