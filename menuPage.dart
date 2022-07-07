import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class menuPage extends StatefulWidget {
  final MenuItem currentItem;
  final ValueChanged<MenuItem> onSelectedItem;

  const menuPage({Key? key, required this.currentItem, required this.onSelectedItem}) : super(key: key);

  @override
  State<menuPage> createState() => _menuPageState();
}

class MenuItems {
  static const payment = MenuItem('Ödeme', Icons.payment);
  static const hediye = MenuItem('Hediye', Icons.gif_outlined);
  static const bildirim = MenuItem('Geri Bildirim', Icons.notification_add);
  static const yardim = MenuItem('Yardım', Icons.help);
  static const hakkimizda = MenuItem('Hakkımızda', Icons.book);
  static const oyverin = MenuItem('Oy verin', Icons.how_to_vote);

  static const all = <MenuItem>[
    payment,
    hediye,
    bildirim,
    yardim,
    hakkimizda,
    oyverin
  ];
}

class _menuPageState extends State<menuPage> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Spacer(),
            ...MenuItems.all.map(buildMenuItem).toList(),
            Spacer(
              flex: 2,
            )
          ],
        )),
      ),
    );
    
  }
   Widget buildMenuItem(MenuItem item,currentItem,Function onSelectedItem) => ListTileTheme(
    selectedColor: Colors.white,
     child: ListTile(
      selectedTileColor: Colors.black,
          selected: widget.currentItem==item,
          minLeadingWidth: 20,
          leading: Icon(item.icon),
          title: Text(item.title),
          onTap: () =>widget.onSelectedItem(item){
            setState(() {
              currentItem=item;
            });
          },
        ),
   );

 
}

class MenuItem {
  final String title;
  final IconData icon;

  const MenuItem(this.title, this.icon);
}
