import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart' hide MenuItem;
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sport/mainPage.dart';
import 'package:sport/menuPage.dart';
import 'package:sport/payment.dart';

import 'Bildirim.dart';
import 'Hakkımızda.dart';
import 'Hediye.dart';
import 'Oyverin.dart';
import 'Yardim.dart';

class Screen extends StatefulWidget {
  Screen({Key? key}) : super(key: key);

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  MenuItem currentItem = MenuItems.payment;

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      style: DrawerStyle.style2,
      menuScreen: menuPage(currentItem: currentItem, onSelectedItem: (item) {}),
      mainScreen: getScreen(context),
      angle: -12,
      duration: Duration(
        milliseconds: 60,
      ),
    );
  }

  Widget getScreen(BuildContext context) {
    switch (currentItem) {
      case MenuItems.payment:
        return Payment();
      case MenuItems.hediye:
        return Hediye();
      case MenuItems.bildirim:
        return Bildirim();
      case MenuItems.yardim:
        return Yardim();
      case MenuItems.hakkimizda:
        return Hakk();
      case MenuItems.oyverin:
        return Oyverin();
    }
  }
}
