/*

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../generated/l10n.dart';
import '../../../utils/app_loader.dart';
import '../../../utils/enum/request_status.dart';
import '../../../utils/font_styles.dart';
import '../../../utils/styles/colors.dart';
import '../../../utils/snack_bars.dart';
import '../../home.dart';
import '../../widgets/custom_bar_widget.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_container.dart';
import '../../widgets/custom_form_field.dart';
import '../../widgets/image_editable.dart';
import '../../widgets/navigate.dart';
import '../../widgets/spaces.dart';
import '../../widgets/text_widget.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    TextEditingController nameTextController =
        TextEditingController(text: userProvider.profileData?.name);
    TextEditingController emailTextController =
        TextEditingController(text: userProvider.profileData?.email);
    TextEditingController phoneTextController = TextEditingController(
        text: userProvider.profileData?.phone);
    TextEditingController fwIdTextController = TextEditingController(
        text: userProvider.profileData?.fwId);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'myProfile',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageEditable(
              imageUrl: userProvider.profileData?.image ?? '',
              showEditIcon: true,
              onTap: () async {
                AppLoader.showLoader(context);
                await ImagePicker.platform
                    .getImage(source: ImageSource.gallery, imageQuality: 30)
                    .then((image) async {
                  if (image != null) {
                    await userProvider.updateProfilePicture(
                        context, image.path).then((value) {
                          AppLoader.stopLoader();
                    });
                  }
                });
                AppLoader.stopLoader();
              },
            ),
            verticalSpace(21),
            Padding(
              padding: symmetricEdgeInsets(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                      text: 'id',
                      textSize: MyFontSize.size18,
                      fontWeight: MyFontWeight.medium,
                  ),
                  verticalSpace(10),
                  CustomSizedBox(
                      height: 40,
                      width: double.infinity,
                      child: DefaultFormField(
                        padding: onlyEdgeInsets(start: 10, bottom: 8),
                        hintText: 'enterId',
                        fillColor: AppColor.borderGreyLight,
                        filled: true,
                        enabled: false,
                        textColor: AppColor.grey,
                        controller: fwIdTextController,
                      )),
                  verticalSpace(27),
                  Row(
                    children: [
                      TextWidget(
                          text: 'name',
                          textSize: MyFontSize.size18,
                          fontWeight: MyFontWeight.medium),
                      horizontalSpace(3),
                      TextWidget(
                        text: 'optional',
                        textSize: MyFontSize.size8,
                        fontWeight: MyFontWeight.regular,
                        color: AppColor.lightGrey,
                      ),
                    ],
                  ),
                  verticalSpace(10),
                  CustomSizedBox(
                    height: 40,
                    width: double.infinity,
                    child: DefaultFormField(
                      controller: nameTextController,
                      hintText: 'enterName',
                      fillColor: AppColor.lightBabyBlue,
                      filled: true,
                      textColor: AppColor.grey,
                      textSize: MyFontSize.size15,
                      fontWeight: MyFontWeight.medium,
                      maxLines: 1,
                      padding: onlyEdgeInsets(start: 10, bottom: 8),
                    ),
                  ),
                  verticalSpace(27),
                  Row(
                    children: [
                      TextWidget(
                          text: 'email',
                          textSize: MyFontSize.size18,
                          fontWeight: MyFontWeight.medium),
                      horizontalSpace(3),
                      TextWidget(
                        text: 'optional',
                        textSize: MyFontSize.size8,
                        fontWeight: MyFontWeight.regular,
                        color: AppColor.lightGrey,
                      ),
                    ],
                  ),
                  verticalSpace(10),
                  CustomSizedBox(
                    height: 40,
                    width: double.infinity,
                    child: DefaultFormField(
                      controller: emailTextController,
                      hintText: 'enterEmail',
                      fillColor: AppColor.lightBabyBlue,
                      filled: true,
                      textColor: AppColor.grey,
                      textSize: MyFontSize.size15,
                      fontWeight: MyFontWeight.medium,
                      maxLines: 1,
                      padding: onlyEdgeInsets(start: 10, bottom: 8),
                    ),
                  ),
                  verticalSpace(27),
                  TextWidget(
                      text: 'phoneNumber',
                      textSize: MyFontSize.size18,
                      fontWeight: MyFontWeight.medium),
                  verticalSpace(10),
                  CustomSizedBox(
                    height: 40,
                    width: double.infinity,
                    child: DefaultFormField(
                      enabled: false,
                      controller: phoneTextController,
                      hintText: 'enterPhoneNumber',
                      fillColor: AppColor.borderGreyLight,
                      filled: true,
                      textColor: AppColor.grey,
                      textSize: MyFontSize.size15,
                      fontWeight: MyFontWeight.medium,
                      padding: onlyEdgeInsets(start: 10, bottom: 8),
                    ),
                  ),
                ],
              ),
            ),
            verticalSpace(60),
            Column(
              children: [
                TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: TextWidget(
                              text: 'areYouSureToDeleteTheAccount',
                              color: AppColor.black,
                            ),
                          ),
                          actions: [
                            Padding(
                              padding: symmetricEdgeInsets(vertical: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  DefaultButton(
                                    width: 130,
                                    height: 30,
                                    text: 'cancel',
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    backgroundColor: AppColor.boldGreen,
                                  ),
                                  DefaultButton(
                                    width: 130,
                                    height: 30,
                                    text: 'delete',
                                    onPressed: () async{
                                      await userProvider.deleteAccount();
                                      navigateAndFinish(context, const HomeScreen());
                                    },
                                    backgroundColor: AppColor.textRed,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: TextWidget(
                      text: 'deleteAccount',
                      fontWeight: MyFontWeight.semiBold,
                      textSize: MyFontSize.size17,
                      color: const Color(0xFFFF2A34)),
                ),
                verticalSpace(12),
                DefaultButton(
                  text: 'save',
                  onPressed: () async {
                    FocusScope.of(context).unfocus();
                    AppLoader.showLoader(context);
                    await userProvider
                        .updateUserProfile(
                            email: emailTextController.text,
                            name: nameTextController.text)
                        .then((value) {
                      if (value == Status.success) {
                        CustomSnackBars.successSnackBar(
                            context, 'profileUpdated');
                      } else {
                        CustomSnackBars.somethingWentWrongSnackBar(context);
                      }
                    });
                    AppLoader.stopLoader();
                  },
                  width: 345,
                  height: 48,
                  fontWeight: MyFontWeight.bold,
                  fontSize: 21,
                )
              ],
            ),
            verticalSpace(42),
          ],
        ),
      ),
    );
  }
}
*/
