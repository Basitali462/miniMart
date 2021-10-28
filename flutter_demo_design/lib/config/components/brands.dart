import 'package:flutter/material.dart';

class Brands extends StatelessWidget {
  Widget brandTitle(){
    return Row(
      children: [
        Text(
          'Available Brands',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        Spacer(),
        Text(
          'See all',
          style: TextStyle(
            decoration: TextDecoration.underline,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget brandItems(){
    return Container(
      width: 110,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            color: Colors.grey.withOpacity(0.5),
            offset: Offset(0.1, 0.1),
          ),
          BoxShadow(
            blurRadius: 2,
            color: Colors.grey.withOpacity(0.5),
            offset: Offset(-0.1, -0.1),
          ),
        ],
      ),
      margin: EdgeInsets.all(4),
      padding: EdgeInsets.all(8),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Image.asset(
          'assets/jaya_groccer.png',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          brandTitle(),
          SizedBox(height: 20,),
          Container(
            height: 120,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index){
                return brandItems();
              },),
          ),
        ],
      ),
    );
  }
}
