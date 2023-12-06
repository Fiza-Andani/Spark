import 'package:spark/consts/consts.dart';
import 'package:spark/consts/lists.dart';
import 'package:spark/views/auth_screen/signup_screen.dart';
import 'package:spark/views/home_screen/home.dart';
import 'package:spark/widgets_common/appLogo_widget.dart';
import 'package:spark/widgets_common/bg_widget.dart';
import 'package:spark/widgets_common/custom_textfield.dart';
import 'package:spark/widgets_common/our_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.1).heightBox,
            appLogoWidget(heightBox: const HeightBox(10)),
            5.heightBox,
            "Login to $appname".text.white.size(18).fontFamily(bold).make(),
            5.heightBox,
            Column(
              children: [
                customTextField(hint: emailHint, title: email),
                customTextField(hint: passwordHint, title: pasword),
                Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {}, child: forgetPassword.text.make())),
                3.heightBox,
                //ourButton().box.width(context.screenWidth - 50).make(),
                ourButton(
                    color: maganta,
                    title: login,
                    textColor: whiteColor,
                    onPress: () {
                      Get.to(() => Home());
                    }).box.width(context.screenWidth - 50).make(),
                3.heightBox,
                createNewAccount.text.color(fontGrey).make(),
                3.heightBox,
                ourButton(
                    color: textfieldGrey,
                    title: signup,
                    textColor: maganta,
                    onPress: () {
                      Get.to(() => const SignUp());
                    }).box.width(context.screenWidth - 50).make(),
                10.heightBox,
                loginWith.text.color(fontGrey).make(),
                10.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      3,
                      (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: lightGrey,
                              radius: 25,
                              child: Image.asset(
                                socialIconList[index],
                                width: 30,
                              ),
                            ),
                          )),
                ),
              ],
            )
                .box
                .white
                .rounded
                .padding(const EdgeInsets.all(16))
                .width(context.screenWidth - 70)
                .shadowSm
                .make(),
          ],
        ),
      ),
    ));
  }
}
