import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxmvc/res/colors/app_color.dart';

class GeneralExceptionWidget extends StatefulWidget {
  final VoidCallback onPress;
  const GeneralExceptionWidget({super.key, required this.onPress});

  @override
  State<GeneralExceptionWidget> createState() => _GeneralExceptionWidgetState();
}

class _GeneralExceptionWidgetState extends State<GeneralExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: Get.height * .15,
          ),
          const Center(
            child: Icon(
              Icons.cloud_off,
              color: AppColor.redColor,
              size: 50,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Center(
                child: Text(
              'general_exception'.tr,
              textAlign: TextAlign.center,
            )),
          ),
          SizedBox(
            height: Get.height * .15,
          ),
          InkWell(
            onTap: widget.onPress,
            child: Container(
              height: 44,
              width: 160,
              decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Text(
                "Retry",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: AppColor.whiteColor),
              )),
            ),
          )
        ],
      ),
    );
  }
}
