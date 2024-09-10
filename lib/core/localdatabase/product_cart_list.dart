


import 'package:flutter/material.dart';
import 'package:innovins/core/localdatabase/database.dart';
import 'package:sqflite/sqflite.dart';


class ProductCartListOffline {
  dynamic productId;
  String? name;
  String? moq;
  String? price;
  String? discountedPrice;
  dynamic quantity;


  ProductCartListOffline(
      {
        this.productId,
        this.name,
        this.moq,
        this.price,
        this.discountedPrice,
        this.quantity});

  ProductCartListOffline.empty();

  Map<String, dynamic> toMap() {
    Map map = <String, dynamic>{
      'productId': productId,
      'name': name,
      'moq': moq,
      'price': price,
      'discountedPrice': discountedPrice,
      'quantity': quantity,
    };
    return map as Map<String, dynamic>;
  }

  ProductCartListOffline.fromMap(Map<String, dynamic> map) {
    productId = map['productId'];
    name = map['name'];
    moq = map['moq'];
    price = map['price'];
    discountedPrice = map['discountedPrice'];
    quantity = map['quantity'];
  }

  Future<ProductCartListOffline> save() async{
    DbHelper dbHelper=DbHelper();
    Database? dbClient = await dbHelper.db;
    productId= await dbClient?.insert('ProductCartListOffline', toMap());
    return this;
  }

  Future<List<ProductCartListOffline>> getProduct() async{
    DbHelper dbHelper=DbHelper();
    var dbClient = await dbHelper.db;

    List<Map> maps= await dbClient!.query('ProductCartListOffline',
        columns:[
          'productId',
          'name',
          'moq',
          'price',
          'discountedPrice',
          'quantity'
        ], orderBy: "Id asc");
    List<ProductCartListOffline> ams=[];
    if(maps.isNotEmpty){
      for (int i=0;i<maps.length;i++){
        ams.add(ProductCartListOffline.fromMap(maps[i] as Map<String, dynamic>));
      }
    }
    debugPrint(maps.toString());
    return ams;
  }

  Future<int> delete(int id) async {
    DbHelper dbHelper = DbHelper();
    var dbClient = await dbHelper.db;
    int ids = await dbClient!.delete('ProductCartListOffline', where: 'productId=?', whereArgs: [id]);

    return ids;
  }




}