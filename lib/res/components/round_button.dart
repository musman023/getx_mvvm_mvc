import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getxmvc/res/colors/app_color.dart';

class RoundButton extends StatelessWidget {
  final bool loading;
  final String title;
  final double height, width;
  final VoidCallback onPress;
  final Color textColor, buttonColor;
  const RoundButton({
    super.key,
    this.loading = false,
    required this.title,
    this.height = 50,
    this.width = 60,
    required this.onPress,
    this.textColor = AppColor.primaryTextColor,
    this.buttonColor = AppColor.primaryButtonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: loading
          ? const Center(child: CircularProgressIndicator())
          : Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: AppColor.whiteColor),
            ),
    );
  }
}
