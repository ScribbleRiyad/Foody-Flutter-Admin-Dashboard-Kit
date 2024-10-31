import 'package:flutter/material.dart';
import 'package:foody/model/customer_list.dart';
import 'package:foody/views/my_controller.dart';
import 'package:foody/views/ui/customer/customer_list_screen.dart';
import 'package:get/get.dart';

class CustomerListController extends MyController {
  List<CustomersList> customers = [];
  DataTableSource? data;

  @override
  void onInit() {
    CustomersList.dummyList.then((value) {
      customers = value.sublist(10, 50);
      data = MyData(customers);
      update();
    });
    super.onInit();
  }

  @override
  void onThemeChanged() {
    data = MyData(customers);
    update();
  }

  void gotoCustomerAdd() {
    Get.toNamed('/admin/customers/create');
  }
}
