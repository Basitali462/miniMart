import 'package:flutter/cupertino.dart';

class CustomTextFields{
  CustomTextFields._();

  static TextEditingController nameController = TextEditingController();
  static TextEditingController descController = TextEditingController();
  //static TextEditingController categoryController = TextEditingController();
  static TextEditingController brandController = TextEditingController();
  static TextEditingController priceController = TextEditingController();
  static TextEditingController imgController = TextEditingController();
  static TextEditingController galleryController = TextEditingController();
  static TextEditingController countryController = TextEditingController();
  static TextEditingController weightController = TextEditingController();
  static TextEditingController promoController = TextEditingController();
  static TextEditingController discountController = TextEditingController();
  static TextEditingController supplierLocController = TextEditingController();
  static TextEditingController qtyController = TextEditingController();

  static void clearTextField(){
    nameController.clear();
    descController.clear();
    brandController.clear();
    priceController.clear();
    imgController.clear();
    galleryController.clear();
    countryController.clear();
    weightController.clear();
    promoController.clear();
    discountController.clear();
    supplierLocController.clear();
    qtyController.clear();
  }
}