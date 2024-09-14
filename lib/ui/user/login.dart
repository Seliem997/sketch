import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:sketch/ui/mainLayout/app_layout.dart';
import 'package:sketch/ui/user/forget_password_screen/forget_password_screen.dart';
import 'package:sketch/ui/user/otp/otp_screen.dart';
import 'package:sketch/ui/widgets/custom_button.dart';
import 'package:sketch/ui/widgets/navigate.dart';
import 'package:sketch/ui/widgets/spaces.dart';
import 'package:sketch/ui/widgets/text_widget.dart';
import 'package:sketch/utils/styles/colors.dart';

import '../../generated/l10n.dart';
import '../../providers/authentication_provider.dart';
import '../widgets/custom_container.dart';
import '../widgets/custom_textField.dart';
import '../widgets/eye_widget.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
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
                    TextWidget(text: S.of(context).welcomeBack,
                       textSize: 24.sp,
                     ),
                    verticalSpace(10),
                    // Subtitle
                    TextWidget(
                      text: S.of(context).loginToYourAccount,
                      textSize: 18.sp,
                    ),
                    verticalSpace(40),
                  ],
                ),
              ),
              const CustomTextField(
                labelText: 'Phone Number',
                keyboardType: TextInputType.phone,
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
              const SizedBox(height: 20),
              // Forgot Password
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: (){
                    navigateTo(context, const ForgetScreen());
                  },
                  child: const Text(
                    'Forget Password?',
                    style: TextStyle(color: Colors.white54),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // Login Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: DefaultButton(
                  text: 'Login',
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
              const SizedBox(height: 20),
              // Or Login With
              Row(
                children: [
                  const Expanded(child: CustomContainer(backgroundColor: Colors.white,height: 1,)),
                  horizontalSpace(10),
                  const Text(
                    'Or Login with',
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 16,
                    ),
                  ),
                  horizontalSpace(10),
                  const Expanded(child: CustomContainer(backgroundColor: Colors.white,height: 1,)),

                ],
              ),
              verticalSpace(20),
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
            ],
          ),
        ),
      ),
    );
  }
}


class SocialButton extends StatelessWidget {
  final Color color;
  final String iconPath;
  final String text;
  final VoidCallback onPressed;

  const SocialButton({
    Key? key,
    required this.color,
    required this.iconPath,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: SvgPicture.asset(
          iconPath,
          height: 24,
          color: Colors.white,
        ),
        label: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
