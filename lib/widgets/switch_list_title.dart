import 'package:flutter/material.dart';

class KSwitchTile extends StatelessWidget {
  bool value;
  void Function(bool)? onChanged;
  Text title;
  Color? activeColor;
  Text? subtitle;
  EdgeInsetsGeometry? contentPadding;

  KSwitchTile({
    super.key,
    required this.value,
    required this.onChanged,
    required this.title,
    required this.activeColor,
    required this.subtitle,
    required this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: value,
      onChanged: onChanged,
      title: title,
      activeColor: activeColor,
      subtitle: subtitle,
      contentPadding: contentPadding,
    );
  }
}
