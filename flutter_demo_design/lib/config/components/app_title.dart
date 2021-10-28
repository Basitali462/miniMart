import 'package:flutter/material.dart';
import 'package:super_tooltip/super_tooltip.dart';

class AppTitle extends StatelessWidget {

  final TextEditingController controller = TextEditingController();
  Size size;
  BuildContext cntxt;
  SuperTooltip tooltip;

  Widget locationItems(Widget icon, String title){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: Row(
            children: [
              icon,
              SizedBox(width: 20,),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        Divider(
          thickness: 2,
        ),
      ],
    );
  }

  Widget locationPopup(){
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: (){
              Navigator.of(cntxt).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.grey,
              size: 32,
            ),
          ),
          title: TextField(
            controller: controller,
            decoration: InputDecoration(
              fillColor: Colors.grey.withOpacity(0.15),
              filled: true,
              border: InputBorder.none,
              hintText: 'Deliver to..',
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              locationItems(
                Icon(
                  Icons.my_location,
                  color: Colors.orange,
                ),
                'Current Location',
              ),
              locationItems(
                Icon(
                  Icons.map,
                  color: Colors.orange,
                ),
                'Current Location',
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    cntxt = context;
    return GestureDetector(
      onTap: (){
        showModalBottomSheet(
          barrierColor: Colors.transparent,
          isScrollControlled: true,
          context: context,
          builder: (context){
            return locationPopup();
          },);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: (){
              onTap(context);
            },
            child: Image.asset(
              'assets/icons/Icon-location-on.png',
            ),
          ),
          Text(
            'Kualalumpur',
            style: TextStyle(
              color: Color(0xFF00b700),
            ),
          ),
          /*Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Location',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                Expanded(
                  child: Text(
                    'Kualalumpur',
                    style: TextStyle(
                      color: Color(0xFF00b700),
                    ),
                  ),
                ),
              ],
            ),
          ),*/
          Image.asset(
            'assets/icons/Icon-arrow-back.png',
            color: Color(0xFF00b700),
          ),
        ],
      ),
    );
  }

  void onTap(BuildContext context) {
    if (tooltip != null && tooltip.isOpen) {
      tooltip.close();
      return;
    }

    // We create the tooltip on the first use
    tooltip = SuperTooltip(
      popupDirection: TooltipDirection.down,
      borderColor: Colors.transparent,
      shadowColor: Colors.grey,
      arrowTipDistance: 30,
      borderWidth: 0,
      shadowBlurRadius: 2,
      shadowSpreadRadius: 0.1,
      content: new Material(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                toolTipHead(),
                SizedBox(height: 10,),
                toolTipTextField('Malacca'),
                toolTipTextField('Georgetown'),
                toolTipTextField('kualalumpur'),
                toolTipBtn(),
              ],
            ),
          )),
    );

    tooltip.show(context);
  }

  Widget toolTipHead(){
    return Row(
      children: [
        Icon(
          Icons.location_on,
          color: Colors.red,
          size: 30,
        ),
        SizedBox(width: 20,),
        Expanded(
          child: Text(
            'Please provide your delivery location to see products at nearby store.',
          ),
        ),
      ],
    );
  }
  
  Widget toolTipTextField(String hintText){
    final TextEditingController controller = TextEditingController();
    return TextField(
      textAlignVertical: TextAlignVertical.center,
      controller: controller,
      style: TextStyle(
        fontSize: 18,
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget toolTipBtn(){
    return Row(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.red,
                width: 1,
              ),
            ),
            child: Text(
              'CANCEL',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(width: 10,),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.red,
            ),
            child: Text(
              'Set Location',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
