

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:sketch/ui/user/login.dart';
import 'package:sketch/ui/widgets/custom_button.dart';
import 'package:sketch/utils/styles/colors.dart';

import '../../../providers/authentication_provider.dart';
import '../../widgets/custom_container.dart';
import '../../widgets/custom_dialog.dart';
import '../../widgets/navigate.dart';
import '../../widgets/spaces.dart';
import '../../widgets/text_widget.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

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
                  TextWidget(text: 'OTP Verification',
                    textSize: 24.sp,
                  ),
                  verticalSpace(20),
                  // Subtitle
                  TextWidget(
                    text: 'Please enter the verification code sent to your phone number',
                    textSize: 18.sp,
                  ),
                ],
              ),
            ),
            verticalSpace(60),
            OtpTextField(
              numberOfFields: 5,
              fieldWidth: MediaQuery.of(context).size.width * .16,
              fieldHeight: MediaQuery.of(context).size.width * .18,
              obscureText: false,
              focusedBorderColor: Colors.white,
              cursorColor: Colors.white,
              textStyle: TextStyle(
                color: Colors.white,
                  fontSize: 18.sp
              ),
              borderColor: const Color(0xFFD9DBE4),
              showFieldAsBox: true,
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              onSubmit: (String verificationCode){
                authenticationProvider.codeOTP = verificationCode;
              }, // end onSubmit
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
            verticalSpace(25),
            RichText(
              text: TextSpan(
                text: 'Didn’t receive a code? ',
                style: TextStyle(color: Colors.white, fontSize: 16.sp),
                children: [
                  TextSpan(
                      text: 'Resend',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w800,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          navigateTo(context, const LoginScreen());
                        }),
                ],
              ),
            ),          ],
        ),
      ),
    );
  }
}
