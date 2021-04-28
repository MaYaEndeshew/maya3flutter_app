import 'package:flutter/material.dart';

class NavModel {
  String title;
  IconData icon;

  NavModel({this.title, this.icon});
}

List<NavModel> navItems = [
  NavModel(title: "All notes", icon: Icons.library_books_rounded),
  NavModel(title: "Reminders", icon: Icons.alarm_on_outlined),
  NavModel(title: "Category", icon: Icons.category_outlined),
  NavModel(title: "Recycle bin", icon: Icons.delete_forever),
  NavModel(title: "Themes", icon: Icons.color_lens_outlined),
  NavModel(title: "Language", icon: Icons.language),
  NavModel(title: "Settings", icon: Icons.settings),
];
