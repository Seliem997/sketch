
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../services/authentication_service.dart';
import '../../../utils/font_styles.dart';
import '../../widgets/custom_bar_widget.dart';
import '../../widgets/custom_container.dart';
import '../../widgets/spaces.dart';
import '../../widgets/text_widget.dart';

class RegisterPhoneNumber extends StatefulWidget {
  const RegisterPhoneNumber({super.key});

  @override
  State<RegisterPhoneNumber> createState() => _RegisterPhoneNumberState();
}

class _RegisterPhoneNumberState extends State<RegisterPhoneNumber> {

  final AuthenticationService auth = AuthenticationService();
  bool isValid= false;
  late String _countryCode;
  late String _phoneNumber;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Register or Login',
        withArrow: false,
      ),
      body: Padding(
        padding: symmetricEdgeInsets(vertical: 40, horizontal: 24),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset('assets/images/img.png'),
                    verticalSpace(20),
                    CustomSizedBox(
                      width: 200,
                      child: TextWidget(
                        text: 'you Will Receive A 4 Digital Code To Verify Next',
                        textSize: MyFontSize.size15,
                        fontWeight: MyFontWeight.medium,
                        textAlign: TextAlign.center,
                        height: 1.3,
                      ),
                    ),
                    verticalSpace(15),
                    Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: TextWidget(
                          text: 'Enter Your Phone Number',
                          textSize: MyFontSize.size12,
                          fontWeight: MyFontWeight.regular,
                        )),
                    verticalSpace(16),
                    IntlPhoneField(
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
                      initialCountryCode: 'SA',
                      onChanged: (phone) {
                        setState(() {
                          isValid = false;
                        });
                        print(phone.completeNumber);
                        print(phone.number);
                        if(phone.isValidNumber()){
                          setState(() {
                            isValid = true;
                          });
                          _countryCode = phone.countryCode;
                          _phoneNumber = phone.number;
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            verticalSpace(10),
            // DefaultButton(
            //   height: 48,
            //   width: 345,
            //   fontSize: MyFontSize.size18,
            //   fontWeight: MyFontWeight.bold,
            //   backgroundColor: isValid ? AppColor.primary : AppColor.grey,
            //   enabled: isValid,
            //   radiusCircular: 6,
            //   text: 'confirm',
            //   // onPressed: () {
            //   //   navigateTo(
            //   //       context,
            //   //       // OTPScreen(phoneNumber: _phoneNumber, countryCode: _countryCode));
            //   //     /*AppLoader.showLoader(context);
            //   //     auth
            //   //         .registerOrLogin(_phoneNumber, _countryCode)
            //   //         .then((value) {
            //   //       AppLoader.stopLoader();
            //   //       if (value.status == Status.success) {
            //   //         navigateTo(
            //   //             context,
            //   //             OTPScreen(phoneNumber: _phoneNumber, countryCode: _countryCode));
            //   //       } else {
            //   //         CustomSnackBars.failureSnackBar(context, value.message);
            //   //       }
            //   //     });*/
            //   //
            //   // },
            // ),
          ],
        ),
      ),
    );
  }
}
