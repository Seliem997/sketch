import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sketch/ui/onboarding/onboarding_screen.dart';
import 'package:sketch/ui/widgets/navigate.dart';

import '../user/login.dart';
import '../user/register/register.dart';
import '../widgets/custom_container.dart';
import '../widgets/spaces.dart';

class AppSplash extends StatefulWidget {
  const AppSplash({super.key});

  @override
  State<AppSplash> createState() => _AppSplashState();
}

class _AppSplashState extends State<AppSplash> with TickerProviderStateMixin {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0)).then((value) => loadData());

    super.initState();
  }

  void loadData() async {
    await Future.delayed(const Duration(seconds: 3));
    //await userProvider.getUserData().then((value) => navigateAndFinish(
    //context, const HomeScreen(),
    // ));
    navigateAndFinish(context, const LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const CustomContainer(
            radiusCircular: 0,
              height: double.infinity,
              width: double.infinity,
              image: DecorationImage(
                  image: AssetImage('assets/images/splash.png',),fit: BoxFit.fill)),
          const CustomContainer(
              radiusCircular: 0,
              height: double.infinity,
              width: double.infinity,
              image: DecorationImage(
                  image: AssetImage('assets/images/splashHover.png'),fit: BoxFit.fill)),
          Center(
            child: CustomContainer(
              padding: symmetricEdgeInsets(horizontal: 50),
              child: Image.asset('assets/images/whiteLogo.png'),
              ),
          ),


        ],
      ),
    );
  }
}
