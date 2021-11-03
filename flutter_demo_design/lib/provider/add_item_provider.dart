import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo_design/config/enums/app_state_enum.dart';
import 'package:image_picker/image_picker.dart';

class AddItemProvider with ChangeNotifier{
  AppStateEnum currentAppState = AppStateEnum.idle;
  //select category
  List<String> categoryList = ['Fruits', 'Veggies', 'Dairy', 'Meat'];
  String selectedCategory;

  //upload image
  File selectedImage;
  String selectedImageName;

  List<File> selectedMultiImgs;
  List<String> selectedMultiImagesNames;

  String multiSelectedImagesName;

  onCategoryChanged(String val){
    selectedCategory = val;
    notifyListeners();
  }

  Future pickImage() async{
    print('image picker');
    try{
      print('image picker try');
      final image = await ImagePicker().pickImage(source: ImageSource.gallery).timeout(Duration(seconds: 10));
      changeAppState(AppStateEnum.idle);
      print('picked image $image');
      if(image == null) return;
      selectedImageName = image.name;
      print(selectedImageName);
      final temporaryPath = File(image.path);
      selectedImage = temporaryPath;
    } on PlatformException catch(e){
      print('Failed to load image: $e');
    } on TimeoutException catch(e){
      print('Timeout');
      changeAppState(AppStateEnum.idle);

    }
    notifyListeners();
  }

  Future pickMultipleImages() async{
    print('image picker');
    try{
      print('image picker try');
      final image = await ImagePicker().pickMultiImage().timeout(Duration(seconds: 15));
      changeAppState(AppStateEnum.idle);
      print('picked image $image');
      if(image == null) return;
      selectedMultiImagesNames = image.map((e) => e.name).toList();
      setMultiImagesNames(selectedMultiImagesNames);
      //print(selectedImageName);
      final temporaryPath = image.map((e) => e.path).toList();
      selectedMultiImgs = temporaryPath.map((e){
        return File(e);
      }).toList();
    } on PlatformException catch(e){
      print('Failed to load image: $e');
    } on TimeoutException catch(e){
      print('Timeout');
      changeAppState(AppStateEnum.idle);

    }
    notifyListeners();
  }

  void setMultiImagesNames(List<String> names){
    if(names.isEmpty || names == null){
      return ;
    }
    for(int i = 0; i < names.length; i++){
      multiSelectedImagesName = multiSelectedImagesName + names[i]+',';
    }
    //notifyListeners();
  }

  void changeAppState(AppStateEnum val){
    currentAppState = val;
    notifyListeners();
  }
}