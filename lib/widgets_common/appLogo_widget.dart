import 'package:spark/consts/consts.dart';

Widget appLogoWidget({required HeightBox heightBox}) {
  return Image.asset(icAppLogo)
      .box
      .white
      .size(130, 130)
      .padding(EdgeInsets.all(0.01))
      .rounded
      .make();
}
