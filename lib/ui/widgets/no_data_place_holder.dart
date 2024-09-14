import 'package:flutter/material.dart';
import 'package:sketch/ui/widgets/text_widget.dart';

import '../../utils/styles/colors.dart';

class NoDataPlaceHolder extends StatelessWidget {
  const NoDataPlaceHolder({super.key, this.useExpand = true});
  final bool useExpand;

  @override
  Widget build(BuildContext context) {
    return useExpand
        ? Expanded(
            child: Container(
              alignment: Alignment.center,
              child: const TextWidget(
                text: 'noDataAvailable',
                color: Colors.white,
              ),
            ),
          )
        : const Center(
            child: TextWidget(
              text: 'noDataAvailable',
              color: Colors.white,
            ),
          );
  }
}
