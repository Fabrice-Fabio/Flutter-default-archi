

import 'package:flutter/material.dart';

Future bottomModalSheetCustom({
  required Widget child,
  required BuildContext parentContext,
  double height=200,
}) => showModalBottomSheet(
    shape: const RoundedRectangleBorder(
        side: BorderSide(),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15))),
    useRootNavigator: true,
    isScrollControlled: true,
    enableDrag: true,
    context: parentContext,
    builder: (context) => Padding(
      padding:
      EdgeInsets.only(bottom: MediaQuery.of(parentContext).viewInsets.bottom),
      child: Container(
        height: height,
        padding: const EdgeInsets.only(
          left: 15,
          right: 15,
          top: 15,
        ),
        child: child,
      ),
    ));