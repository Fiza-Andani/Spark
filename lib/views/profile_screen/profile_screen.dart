import 'package:flutter/material.dart';
import 'package:spark/consts/consts.dart';
import 'package:spark/consts/lists.dart';
import 'package:spark/views/profile_screen/components/details_card.dart';
import 'package:spark/widgets_common/bg_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
          body: SafeArea(
        // padding: EdgeInsets.all(8),
        child: Column(
          children: [
            //edit profile button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Align(
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.edit,
                  color: whiteColor,
                ),
              ).onTap(() {}),
            ),
            //user details
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.asset(
                    imgProfile2,
                    width: 100,
                    fit: BoxFit.cover,
                  ).box.roundedFull.clip(Clip.antiAlias).make(),
                  10.widthBox,
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "User".text.white.fontFamily(semibold).make(),
                      "customer@demo.com".text.white.make()
                    ],
                  )),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(color: whiteColor)),
                    onPressed: () {},
                    child: logout.text.fontFamily(semibold).white.make(),
                  )
                ],
              ),
            ),

            20.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                detailsCard(
                    count: "00",
                    title: "In your Cart",
                    width: context.screenWidth / 3.4),
                detailsCard(
                    count: "32",
                    title: "In your Wish List",
                    width: context.screenWidth / 3.4),
                detailsCard(
                    count: "675",
                    title: " Your Orders",
                    width: context.screenWidth / 3.4)
              ],
            ),
            //40.heightBox,
            //buttons section
            ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: lightGrey,
                      );
                    },
                    itemCount: profileButtonsList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: Image.asset(
                          profileButtonsIcon[index],
                          width: 26,
                        ),
                        title: "${profileButtonsList[index]}"
                            .text
                            .color(darkFontGrey)
                            .fontFamily(semibold)
                            .make(),
                      );
                    })
                .box
                .white
                .rounded
                .margin(EdgeInsets.all(12))
                .shadowSm
                .padding(EdgeInsets.symmetric(horizontal: 16))
                .make()
                .box
                .color(lightpink)
                .make(),
          ],
        ),
      )),
    );
  }
}
