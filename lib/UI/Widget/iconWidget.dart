import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  final String imageUrl;
  final String? number;
  final Function()? onTap;

  const IconWidget({Key? key, required this.imageUrl,this.number, this.onTap,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.only(right: 22),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Image.asset(imageUrl,height: 20,width: 20,color: Colors.grey.shade600,),
            const SizedBox(
              width: 4,
            ),
            Text(number??''),
          ],
        ),
      ),
    );
  }
}
