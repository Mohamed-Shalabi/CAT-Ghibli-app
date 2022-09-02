import 'package:flutter/material.dart';
import 'package:state_management_session_two/global/styles/themes.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: context.colorScheme.onSurface,
      thickness: 2,
    );
  }
}
