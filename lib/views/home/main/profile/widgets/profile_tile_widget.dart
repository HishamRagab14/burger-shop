import 'package:burger_shop_app/common/app_style.dart';
import 'package:burger_shop_app/common/reusable_text.dart';
import 'package:burger_shop_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class ProfileTileWidget extends StatelessWidget {
  const ProfileTileWidget({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });
  final String title;
  final IconData icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: VisualDensity.compact,
      minLeadingWidth: 0,
      onTap: onTap,
      leading: Icon(icon),
      title: ReusableText(
        text: title,
        style: appStyle(14, kGrey, FontWeight.normal),
      ),
      trailing:
          title != 'Settings'
              ? Icon(AntDesign.right, size: 18.sp)
              : Image.asset(
                'assets/images/egypt.png',
                width: 20.w,
                height: 20.h,
              ),
    );
  }
}
