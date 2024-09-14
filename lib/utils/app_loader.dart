import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';


class AppLoader {
  static void showLoader(BuildContext context) {
    Loader.show(context,
        progressIndicator:
            const CircularProgressIndicator(color: Colors.white));
  }

  static void stopLoader() {
    Loader.hide();
  }
}
