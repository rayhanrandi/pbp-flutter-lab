import 'dart:ffi';

import 'package:flutter/material.dart';

class Budget {
  String? judul;
  String? nominal;
  String? tipe;

  Budget(String judul, String nominal, String tipe) {
    this.judul = judul;
    this.nominal = nominal;
    this.tipe = tipe;
  }

  Widget show() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(
          color: Colors.grey,
        ),
      ),
      elevation: 2,
      shadowColor: Colors.black,
      child: ListTile(
        title: Text(
          judul.toString(),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
        subtitle: Text(nominal.toString()),
        trailing: Text(
          tipe.toString(),
          style: const TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
