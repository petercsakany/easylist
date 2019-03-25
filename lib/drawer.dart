import 'package:flutter/material.dart';

class ProductDrawer extends StatelessWidget {
  final String currentPage;

  ProductDrawer(this.currentPage);

  Widget _buildTile(BuildContext context) {

    String _tileTitle;
    String _route;

    if(currentPage == 'admin') {
      _tileTitle = 'Product List';
      _route = '/list';
    }
    if(currentPage == 'list') {
      _tileTitle = 'Manage Products';
      _route = '/admin';
    }
    return ListTile(
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
