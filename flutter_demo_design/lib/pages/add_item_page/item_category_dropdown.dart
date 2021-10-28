import 'package:flutter/material.dart';
import 'package:flutter_demo_design/config/components/text_fields/key_identifier.dart';
import 'package:flutter_demo_design/provider/add_item_provider.dart';
import 'package:provider/provider.dart';

class ItemCategoryDropDown extends StatelessWidget {

  buildCategoryItem(item) => DropdownMenuItem(
    value: item,
    child: Text(
      item,
    ),
  );

  @override
  Widget build(BuildContext context) {
    final addItemProvider = Provider.of<AddItemProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      height: 60,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.grey
          ),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          //key: KeyIdentifier.dropDownKey,
          hint: Text(
            'Select Category',
          ),
          isExpanded: true,
          value: addItemProvider.selectedCategory,
          items: addItemProvider.categoryList.map<DropdownMenuItem<String>>((String val){
            return DropdownMenuItem<String>(
              value: val,
              child: Text(val),
            );
          }).toList(),
          onChanged: addItemProvider.onCategoryChanged,
          /*underline: Divider(
            thickness: 1,
            color: Colors.grey,
          ),*/
        ),
      ),
    );
  }
}
