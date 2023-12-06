import 'package:spark/consts/consts.dart';
import 'package:spark/consts/lists.dart';
import 'package:spark/views/category_screen/category_details.dart';
import 'package:spark/widgets_common/bg_widget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      appBar: AppBar(
        title: categories.text.fontFamily(bold).white.make(),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: 9,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              mainAxisExtent: 200),
          itemBuilder: ((context, index) {
            return Column(
              children: [
                Image.asset(
                  categoryImages[index],
                  height: 100,
                  width: 200,
                  fit: BoxFit.cover,
                ),
                10.heightBox,
                "${categoryList[index]}"
                    .text
                    .color(darkFontGrey)
                    .align(TextAlign.center)
                    .make()
              ],
            )
                .box
                .gray200
                .rounded
                .clip(Clip.antiAlias)
                .outerShadowSm
                .make()
                .onTap(() {
              Get.to(() => CategoryDetails(title: categoryList[index]));
            });
          }),
        ),
      ),
    ));
  }
}
