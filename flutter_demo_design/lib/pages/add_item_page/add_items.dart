import 'package:flutter/material.dart';
import 'package:flutter_demo_design/config/components/text_fields/key_identifier.dart';
import 'package:flutter_demo_design/config/components/text_fields/text_field.dart';
import 'package:flutter_demo_design/config/enums/app_state_enum.dart';
import 'package:flutter_demo_design/config/models/items_model.dart';
import 'package:flutter_demo_design/config/services/sheet_api.dart';
import 'package:flutter_demo_design/config/theme/app_theme.dart';
import 'package:flutter_demo_design/pages/add_item_page/add_item_fields.dart';
import 'package:flutter_demo_design/pages/add_item_page/item_category_dropdown.dart';
import 'package:flutter_demo_design/pages/add_item_page/pick_image_btn.dart';
import 'package:flutter_demo_design/pages/add_item_page/select_multi_images.dart';
import 'package:flutter_demo_design/provider/add_item_provider.dart';
import 'package:provider/provider.dart';

class AddItems extends StatefulWidget {
  @override
  _AddItemsState createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> {
  final formKey = GlobalKey<FormState>();

  addItem(AddItemProvider provider) async{
    final item = ItemsModel(
      name: CustomTextFields.nameController.text,
      description: CustomTextFields.descController.text,
      category: provider.selectedCategory,
      brand: CustomTextFields.brandController.text,
      price: CustomTextFields.priceController.text,
      image: provider.selectedImageName,
      //image: CustomTextFields.imgController.text,
      gallery: CustomTextFields.galleryController.text,
      country: CustomTextFields.countryController.text,
      weight: CustomTextFields.weightController.text,
      pricePromo: CustomTextFields.promoController.text,
      discountPercentage: CustomTextFields.discountController.text,
      supplier: CustomTextFields.supplierLocController.text,
      quantity: CustomTextFields.qtyController.text,
    );
    final id = await SheetApi.getRowCount() + 1;
    print('row id $id');
    final newUser = item.copy(id: id);
    await SheetApi.insert([newUser.toJson()]);
    provider.changeAppState(AppStateEnum.idle);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CustomTextFields.clearTextField();
  }

  @override
  Widget build(BuildContext context) {
    final addItemProvider = Provider.of<AddItemProvider>(context);
    return Stack(
      children: [
        WillPopScope(
          onWillPop: () async{return false;},
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              automaticallyImplyLeading: false,
              leading: GestureDetector(
                onTap: (){
                  Navigator.of(context).pop();
                  addItemProvider.onCategoryChanged(null);
                  addItemProvider.selectedImageName = '';
                  //KeyIdentifier.dropDownKey.currentState.reset();
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AddItemField(
                        textController: CustomTextFields.nameController,
                        placeHolder: 'Name',
                        inputType: TextInputType.text,
                        validation: (value){
                          return value != null && value.isEmpty ? 'Enter Name' : null;
                        },
                      ),
                      AddItemField(
                        textController: CustomTextFields.descController,
                        placeHolder: 'Description',
                        inputType: TextInputType.text,
                      ),
                      ItemCategoryDropDown(),
                      /*AddItemField(
                        textController: CustomTextFields.categoryController,
                        placeHolder: 'Category',
                        inputType: TextInputType.text,
                        validation: (value){
                          return value != null && value.isEmpty ? 'Add Category' : null;
                        },
                      ),*/
                      AddItemField(
                        textController: CustomTextFields.brandController,
                        placeHolder: 'Brand',
                        inputType: TextInputType.text,
                      ),
                      AddItemField(
                        textController: CustomTextFields.priceController,
                        placeHolder: 'Price',
                        inputType: TextInputType.number,
                        validation: (value){
                          return value != null && value.isEmpty ? 'Enter Price' : null;
                        },
                      ),
                      PickImageButton(),
                      //SelectMultipleImagesButton(),
                      /*AddItemField(
                        textController: CustomTextFields.galleryController,
                        placeHolder: 'Gallery',
                        inputType: TextInputType.text,
                      ),*/
                      AddItemField(
                        textController: CustomTextFields.countryController,
                        placeHolder: 'From_Country',
                        inputType: TextInputType.text,
                      ),
                      AddItemField(
                        textController: CustomTextFields.weightController,
                        placeHolder: 'Weight',
                        inputType: TextInputType.number,
                      ),
                      AddItemField(
                        textController: CustomTextFields.promoController,
                        placeHolder: 'Price Promo',
                        inputType: TextInputType.number,
                      ),
                      AddItemField(
                        textController: CustomTextFields.discountController,
                        placeHolder: 'Discount_Percentage',
                        inputType: TextInputType.number,
                      ),
                      AddItemField(
                        textController: CustomTextFields.supplierLocController,
                        placeHolder: 'Supplier_Location',
                        inputType: TextInputType.text,
                      ),
                      AddItemField(
                        textController: CustomTextFields.qtyController,
                        placeHolder: 'Quantity',
                        inputType: TextInputType.number,
                        validation: (value){
                          return value != null && value.isEmpty ? 'Enter Quantity' : null;
                        },
                      ),
                      GestureDetector(
                        onTap: (){
                          if(formKey.currentState.validate()){
                            print('validated');
                            addItem(addItemProvider);
                            addItemProvider.changeAppState(AppStateEnum.busy);
                          }else{
                            print('please validate form');
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 50),
                          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 34),
                          decoration: BoxDecoration(
                            color: AppTheme.selectedContainerColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'Add Item',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ),
        ),
        addItemProvider.currentAppState == AppStateEnum.idle
            ? Container()
            : Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.black.withOpacity(0.4),
          child: Center(child: CircularProgressIndicator()),
        ),
      ],
    );
  }
}
