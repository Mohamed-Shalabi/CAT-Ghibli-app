import 'package:flutter/material.dart';

class NavigationRow extends StatelessWidget {
  const NavigationRow({
    Key? key,
    required this.title,
    required this.navigateTo,
  }) : super(key: key);

  final String title;
  final void Function(BuildContext context) navigateTo;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateTo(context);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }
}
