import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:sketch/ui/mainLayout/app_layout.dart';
import 'package:sketch/ui/user/forget_password_screen/forget_password_screen.dart';
import 'package:sketch/ui/user/login.dart';
import 'package:sketch/ui/user/otp/otp_screen.dart';
import 'package:sketch/ui/widgets/custom_button.dart';
import 'package:sketch/ui/widgets/navigate.dart';
import 'package:sketch/ui/widgets/spaces.dart';
import 'package:sketch/ui/widgets/text_widget.dart';
import 'package:sketch/utils/styles/colors.dart';

import '../../../providers/authentication_provider.dart';
import '../../widgets/custom_container.dart';
import '../../widgets/custom_textField.dart';
import '../../widgets/eye_widget.dart';



class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  @override
  Widget build(BuildContext context) {
    final AuthenticationProvider authProvider= Provider.of<AuthenticationProvider>(context);
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: Center(
        child: SingleChildScrollView(
          padding: symmetricEdgeInsets(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              verticalSpace(20),
              CustomContainer(
                height: 91,
                width: 161,
                child: Image.asset('assets/images/whiteLogo.png',),
              ),
              verticalSpace(40),
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(text: 'Hi',
                      textSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    verticalSpace(10),
                    // Subtitle
                    TextWidget(
                      text: 'Create Your Account',
                      textSize: 18.sp,
                    ),
                    verticalSpace(40),
                  ],
                ),
              ),
              const CustomTextField(
                labelText: 'Mobile Number',
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 30),
              const CustomTextField(
                labelText: 'User Name',
              ),
              const SizedBox(height: 30),
              CustomTextField(
                obscureText: authProvider.obscureText,
                labelText: 'Password',
                suffixIcon: EyeWidget(
                    onTap: () {
                      authProvider.showPassword();
                    }),
              ),
              const SizedBox(height: 25),
              // Login Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: DefaultButton(
                  text: 'Sign Up',
                  backgroundColor: Colors.white,
                  textColor: AppColor.primary,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  width: 354,
                  height: 50,
                  radiusCircular: 12,
                  onPressed: (){
                    navigateTo(context, AppLayout());
                  },
                ),
              ),
              const SizedBox(height: 15),
              // Or Login With
              Row(
                children: [
                  const Expanded(child: CustomContainer(backgroundColor: Colors.white,height: 1,)),
                  horizontalSpace(10),
                  const Text(
                    'Or Signup with',
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 16,
                    ),
                  ),
                  horizontalSpace(10),
                  const Expanded(child: CustomContainer(backgroundColor: Colors.white,height: 1,)),
                ],
              ),
              verticalSpace(15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: DefaultButtonWithIcon(
                  icon: SvgPicture.asset('assets/svg/facebook.svg'),
                  labelText: '   Continue with Facebook',
                  backgroundButton: const Color(0xFF1877F2),
                  textColor: AppColor.primary,
                  labelSize: 16,
                  width: 354,
                  height: 50,
                  borderRadius: BorderRadius.circular(12),
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  onPressed: (){
                    navigateTo(context, OTPScreen());
                  },
                ),
              ),
              verticalSpace(10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: DefaultButtonWithIcon(
                  icon: SvgPicture.asset('assets/svg/google.svg'),
                  labelText: '   Continue with Google',
                  backgroundButton: Colors.white,
                  textColor: AppColor.primary,
                  labelSize: 16,
                  width: 354,
                  height: 50,
                  borderRadius: BorderRadius.circular(12),
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  onPressed: (){},
                ),
              ),
              verticalSpace(10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: DefaultButtonWithIcon(
                  icon: SvgPicture.asset('assets/svg/apple.svg'),
                  labelText: '   Continue with Apple',
                  backgroundButton: Colors.white,
                  textColor: AppColor.primary,
                  labelSize: 16,
                  width: 354,
                  height: 50,
                  borderRadius: BorderRadius.circular(12),
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  onPressed: (){},
                ),
              ),
              verticalSpace(15),
              RichText(
                text: TextSpan(
                  text: 'Already have an account?  ',
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                  children: [
                    TextSpan(
                        text: 'Sign in',
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}


