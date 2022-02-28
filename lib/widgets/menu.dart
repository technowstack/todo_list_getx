// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, prefer_const_constructors, unused_element

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Menu extends StatelessWidget {
  String title;
  Icon icon;
  String url;


void _launchURL(url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }

  Menu({required this.title, required this.icon, required this.url});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 2),
      child: ListTile(
        title: Text(title),
        leading: icon,
        onTap: () => _launchURL(url)
      ),
    );
  }
}
