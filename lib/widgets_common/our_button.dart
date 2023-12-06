import 'package:spark/consts/consts.dart';

Widget ourButton({onPress, color, textColor, String? title}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
        backgroundColor: color, padding: EdgeInsets.all(12)),
    onPressed: onPress,
    child: title!.text.fontFamily(bold).color(textColor).make(),
  );
}
