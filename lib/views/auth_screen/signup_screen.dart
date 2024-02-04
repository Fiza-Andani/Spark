import 'package:spark/consts/consts.dart';
import 'package:spark/controller/auth_controller.dart';
import 'package:spark/views/home_screen/home.dart';
import 'package:spark/widgets_common/appLogo_widget.dart';
import 'package:spark/widgets_common/bg_widget.dart';
import 'package:spark/widgets_common/custom_textfield.dart';
import 'package:spark/widgets_common/our_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool? ischeck = false;
  var controller = Get.put(AuthController());

  var nameControler = TextEditingController();
  var emailControler = TextEditingController();
  var passwordControler = TextEditingController();
  var retypepasswordControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            // (context.screenHeight * 0.1).heightBox,
            appLogoWidget(heightBox: const HeightBox(10)),
            3.heightBox,
            "Join the  $appname".text.white.size(18).fontFamily(bold).make(),
            3.heightBox,
            Column(
              children: [
                customTextField(
                    hint: nameHint, title: name, controller: nameControler),
                customTextField(
                    hint: emailHint, title: email, controller: emailControler),
                customTextField(
                    hint: passwordHint,
                    title: pasword,
                    controller: passwordControler),
                customTextField(
                    hint: passwordHint,
                    title: retypePassword,
                    controller: retypepasswordControler),
                Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {}, child: forgetPassword.text.make())),
                1.heightBox,
                //ourButton().box.width(context.screenWidth - 50).make(),

                Row(
                  children: [
                    Checkbox(
                      checkColor: whiteColor,
                      value: ischeck,
                      onChanged: (newValue) {
                        setState(() {
                          ischeck = newValue;
                        });
                      },
                    ),
                    10.widthBox,
                    Expanded(
                      child: RichText(
                          text: const TextSpan(children: [
                        TextSpan(
                            text: "I agree to the",
                            style: TextStyle(
                              fontFamily: regular,
                              color: fontGrey,
                            )),
                        TextSpan(
                            text: termsAndCondition,
                            style: TextStyle(
                              fontFamily: regular,
                              color: maganta,
                            )),
                        TextSpan(
                            text: " & ",
                            style: TextStyle(
                              fontFamily: regular,
                              color: fontGrey,
                            )),
                        TextSpan(
                            text: privacyPolicy,
                            style: TextStyle(
                              fontFamily: bold,
                              color: maganta,
                            ))
                      ])),
                    ),
                  ],
                ),
                ourButton(
                    color: ischeck == true ? maganta : lightGrey,
                    title: signup,
                    textColor: whiteColor,
                    onPress: () async {
                      if (ischeck != false) {
                        try {
                          await controller
                              .signupMethod(
                            context: context,
                            email: emailControler.text,
                            password: passwordControler.text,
                          )
                              .then((value) {
                            return controller.storeUserData(
                                name: nameControler.text,
                                email: emailControler.text,
                                password: passwordControler.text);
                          }).then((value) {
                            VxToast.show(context, msg: loggedin);
                            Get.offAll(() => Home());
                          });
                        } catch (e) {
                          auth.signOut();
                          VxToast.show(context, msg: e.toString());
                        }
                      }
                    }).box.width(context.screenWidth - 50).make(),
                5.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    alreadyHaveAccount.text.color(fontGrey).make(),
                    login.text.color(maganta).make().onTap(() {
                      Get.back();
                    })
                  ],
                )
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
