import 'package:flutter/material.dart';
import 'package:flutter_demo_design/config/enums/app_state_enum.dart';
import 'package:flutter_demo_design/provider/add_item_provider.dart';
import 'package:provider/provider.dart';

class PickImageButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final addItemProvider = Provider.of<AddItemProvider>(context);
    return GestureDetector(
      onTap: () {
        addItemProvider.pickImage();
        //addItemProvider.changeAppState(AppStateEnum.busy);
      },
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: 60,
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(5),
        ),
        child: FittedBox(
          fit: BoxFit.fill,
          child: Text(
            addItemProvider.selectedImageName == null || addItemProvider.selectedImageName.isEmpty
                ? 'Image'
                : addItemProvider.selectedImageName,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
