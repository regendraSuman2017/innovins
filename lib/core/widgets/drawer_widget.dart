
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Add Product'),

            onTap: () {
            },
          ),
          ListTile(
            title: const Text('View Listing'),
            onTap: () {
            },
          ),
        ],
      ),
    );
  }
}