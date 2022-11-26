import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../themes/app.colors.dart';

class HeaderBottomSheetWidget extends StatelessWidget {
  final Widget? child;

  const HeaderBottomSheetWidget({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Align(
          alignment: Alignment.center,
          child: Container(
            width: 38,
            height: 4,
            decoration: BoxDecoration(
              color: Get.isDarkMode ? AppColors.grey700 :  AppColors.light400,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
        const SizedBox(height: 24),
        if (child != null) ...[
          child!,
          const SizedBox(height: 16),
        ],
      ],
    );
  }
}
