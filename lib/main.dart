import 'package:flutter/material.dart';
import 'package:flutter_getx/_core/util/routers.dart';
import 'package:get/get_core/src/smart_management.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(
    GetMaterialApp(
        initialRoute: '/',
        getPages: GetXNamedRouter.routing,
        debugShowCheckedModeBanner: false,
        smartManagement: SmartManagement.keepFactory),
  );
}
