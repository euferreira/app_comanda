import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../themes/app.colors.dart';
import 'header_bottom_sheet.widget.dart';

class AppBottomSheet extends StatelessWidget {
  final Widget? title;
  final Widget? body;
  final Widget Function(ScrollController)? builder;
  final Widget? footer;
  final double? initialChildSize;
  final double? maxSize;
  final EdgeInsets? padding;

  const AppBottomSheet({
    this.title,
    this.body,
    this.builder,
    this.footer,
    this.initialChildSize,
    this.maxSize,
    this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: initialChildSize ?? 0.5,
      minChildSize: 0.3,
      maxChildSize: maxSize ?? 0.9,
      expand: false,
      builder: (context, scrollController) => Container(
        decoration: BoxDecoration(
          color: context.isDarkMode ? AppColors.black500 : AppColors.light0,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(16),
          ),
        ),
        child: Padding(
          padding:
              padding ?? const EdgeInsets.only(left: 25, right: 25, bottom: 25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const HeaderBottomSheetWidget(),
              if (title != null) title!,
              const SizedBox(height: 10),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: builder != null ? builder!(scrollController) : body,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: footer ?? Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
