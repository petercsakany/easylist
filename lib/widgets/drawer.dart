import 'package:flutter/material.dart';

class ProductDrawer extends StatelessWidget {
  final String currentPage;

  ProductDrawer(this.currentPage);

  Widget _buildTile(BuildContext context) {
    String _tileTitle;
    String _route;
    IconData _icon;

    if (currentPage == 'admin') {
      _tileTitle = 'Product List';
      _route = '/list';
      _icon = Icons.list;
    }
    if (currentPage == 'list') {
      _tileTitle = 'Manage Products';
      _route = '/admin';
      _icon = Icons.settings;
    }
    return ListTile(
      leading: Icon(_icon),
      title: Text(_tileTitle),
      onTap: () {
        Navigator.pushReplacementNamed(context, _route);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text('Choose'),
          ),
          _buildTile(context),
        ],
      ),
    );
  }
}
