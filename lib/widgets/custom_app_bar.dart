import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('My Portfolio'),
      actions: [
        TextButton(onPressed: () {}, child: const Text("Home")),
        TextButton(onPressed: () {}, child: const Text("About")),
        TextButton(onPressed: () {}, child: const Text("Projects")),
        TextButton(onPressed: () {}, child: const Text("Contact")),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
