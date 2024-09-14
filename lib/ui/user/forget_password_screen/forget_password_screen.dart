import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:sketch/ui/widgets/custom_button.dart';
import 'package:sketch/utils/styles/colors.dart';

import '../../../providers/authentication_provider.dart';
import '../../widgets/custom_container.dart';
import '../../widgets/custom_dialog.dart';
import '../../widgets/custom_textField.dart';
import '../../widgets/spaces.dart';
import '../../widgets/text_widget.dart';

class ForgetScreen extends StatelessWidget {
  const ForgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthenticationProvider authenticationProvider = Provider.of<AuthenticationProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: symmetricEdgeInsets(horizontal: 20),
        child: Column(
          children: [
            verticalSpace(40),
            CustomContainer(
              height: 91,
              width: 161,
              child: Image.asset('assets/images/whiteLogo.png',),
            ),
            verticalSpace(60),
            Align(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(text: 'Forget Password?',
                    textSize: 24.sp,
                  ),
                  verticalSpace(20),
                  // Subtitle
                  TextWidget(
                    text: 'Please enter your mobile number to reset password',
                    textSize: 18.sp,
                  ),
                ],
              ),
            ),
            verticalSpace(60),
            const CustomTextField(
              labelText: 'Phone Number',
              keyboardType: TextInputType.phone,
            ),
            verticalSpace(60),
            DefaultButton(
                backgroundColor: Colors.white,
                width: 354,
                height: 50,
                textColor: AppColor.primary,
                fontWeight: FontWeight.w600,
                text: 'Send Code',
                onPressed: () {
                  if(authenticationProvider.codeOTP.length == 4){

                  } else {
                    showDialog(
                        context: context,
                        builder: (context) => CustomDialog(
                          attentionMsg: 'Fill All Fields',
                          hasOneBTN: true,
                          confirmBtnText: 'Okay',
                          onConfirmTap: () =>
                              Navigator.pop(context),
                        ));
                  }
                }),

          ],
        ),
      ),
    );
  }
}
