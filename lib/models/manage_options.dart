import 'package:flutter/material.dart';

class ManageOption {
  ManageOption(
      {required this.trailingIcon,
      required this.title,
      required this.subTitle,
      required this.leadingIcon,
      required this.onTapManageOption});
  final Widget trailingIcon;
  final Widget title;
  final Widget subTitle;
  final Widget leadingIcon;
  final void Function() onTapManageOption;
}
