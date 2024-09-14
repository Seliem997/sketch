import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sketch/ui/widgets/custom_button.dart';
import 'package:sketch/utils/styles/colors.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog(
      {super.key,
        required this.onConfirmTap,
        this.cancelBtnText = "Cancel",
        required this.confirmBtnText ,
        required this.attentionMsg,
        this.hasOneBTN = false,
        this.hasWidget = false,
        this.iconAssetsPath,
        this.dialogWidget,
        this.dialogTopWidget,
        this.dialogTopHeight
      });

  final VoidCallback onConfirmTap;
  final String confirmBtnText;
  final String cancelBtnText;
  final String attentionMsg;
  final String? iconAssetsPath;
  final bool hasOneBTN;
  final bool hasWidget;
  final Widget? dialogWidget;
  final Widget? dialogTopWidget;
  final double? dialogTopHeight;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              dialogTopHeight != null
                  ? Column(
                children: [
                  SizedBox(
                    height: dialogTopHeight,
                    child: dialogTopWidget,
                  ),
                  const Divider()
                ],
              )
                  : iconAssetsPath != null ? Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    alignment: Alignment.center,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("${iconAssetsPath}"),
                            fit: BoxFit.cover)),
                  ),
                  // Align(
                  //     alignment: Alignment.topRight, child: CloseButton())
                ],
              ) : const SizedBox(height: 20,),
              const SizedBox(height: 10),
              Column(
                children: [
                  Text(
                    attentionMsg,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  hasWidget ? dialogWidget! : const SizedBox(),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 30, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if(!hasOneBTN)
                      DefaultButton(
                          backgroundColor: Colors.red,
                          textColor: AppColor.primary,
                          text: cancelBtnText,
                          onPressed: () => Navigator.pop(context)),
                    DefaultButton(
                        text: confirmBtnText,
                        backgroundColor: AppColor.primary,
                        textColor: Colors.white,
                        onPressed: onConfirmTap),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
