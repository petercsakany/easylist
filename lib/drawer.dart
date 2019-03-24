import 'package:flutter/material.dart';

import './pages/product_admin.dart';
import './pages/product_list.dart';

class ProductDrawer extends StatelessWidget {
  String currentPage = '';

  ProductDrawer(this.currentPage);

  Widget _buildTile(BuildContext context) {

    String _tileTitle;
    Widget _pageRoute;

    if(currentPage == 'admin') {
      _tileTitle = 'Product List';
      _pageRoute = ProductListPage();
    }
    if(currentPage == 'list') {
      _tileTitle = 'Manage Products';
      _pageRoute = ProductAdminPage();
    }
    return ListTile(
            title: Text(_tileTitle),
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => _pageRoute));
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
