import 'package:flutter/material.dart';
import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'dart:math' as math show pi;

class CollapsPage extends StatefulWidget {
  const CollapsPage({Key? key}) : super(key: key);

  @override
  _CollapsPageState createState() => _CollapsPageState();
}

class _CollapsPageState extends State<CollapsPage> {
  late List<CollapsibleItem> _items;
  late String _headline;
  final _avatarImg = const NetworkImage('https://buff.ly/3rpNWMS');

  @override
  void initState() {
    super.initState();
    _items = _generateItems;
    _headline = _items.firstWhere((item) => item.isSelected).text;
  }

  List<CollapsibleItem> get _generateItems {
    return [
      CollapsibleItem(
        text: 'Dashboard',
        icon: Icons.assessment,
        onPressed: () => setState(() => _headline = 'DashBoard'),
        isSelected: true,
      ),
      CollapsibleItem(
        text: 'Notifications',
        icon: Icons.notifications,
        onPressed: () => setState(() => _headline = 'Notifications'),
      ),
      CollapsibleItem(
        text: 'Errors',
        icon: Icons.close,
        onPressed: () => setState(() => _headline = 'Errors'),
      ),
      CollapsibleItem(
        text: 'Settings',
        icon: Icons.settings,
        onPressed: () => setState(() => _headline = 'Settings'),
      ),
    ];
  }

  Widget _body(Size size, BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
      child: Center(
        child: Transform.rotate(
          angle: math.pi / 2,
          child: Transform.translate(
            offset: Offset(-size.height * 0.3, -size.width * 0.3),
            child: Text(
              _headline,
              style: Theme.of(context).textTheme.headline2,
              overflow: TextOverflow.visible,
              softWrap: false,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: CollapsibleSidebar(
        toggleTitleStyle: const TextStyle(fontSize: 20),
        textStyle:
            const TextStyle(fontSize: 20, decoration: TextDecoration.none),
        titleStyle:
            const TextStyle(fontSize: 20, decoration: TextDecoration.none),
        items: _items,
        avatarImg: _avatarImg,
        title: 'Aristide Sabi',
        onTitleTap: () {},
        toggleTitle: '',
        body: _body(size, context),
        height: double.infinity,
        borderRadius: 15,
        backgroundColor: const Color(0xff2B3138),
        selectedIconBox: const Color(0xff2F4047),
        selectedIconColor: const Color(0xff4AC6EA),
        selectedTextColor: const Color(0xffF3F7F7),
        unselectedIconColor: const Color(0xff6A7886),
        unselectedTextColor: const Color(0xffC0C7D0),
        curve: Curves.fastLinearToSlowEaseIn,
        fitItemsToBottom: true,
        showToggleButton: true,
        sidebarBoxShadow: const [
          BoxShadow(
            color: Colors.blue,
            blurRadius: 10,
            spreadRadius: 0.01,
            offset: Offset(3, 3),
          ),
        ],
      ),
    );
  }
}
