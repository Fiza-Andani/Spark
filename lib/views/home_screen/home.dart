import 'package:spark/consts/consts.dart';
import 'package:spark/controller/home_controller.dart';
import 'package:spark/views/cart_screen/cart_screen.dart';
import 'package:spark/views/category_screen/category_screen.dart';
import 'package:spark/views/home_screen/home_screen.dart';
import 'package:spark/views/profile_screen/profile_screen.dart';
//import 'package:spark/consts/colors.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());

    var navBarItem = [
      BottomNavigationBarItem(
          icon: Image.asset(icHome, width: 26), label: home),
      BottomNavigationBarItem(
          icon: Image.asset(icCategories, width: 26), label: categories),
      BottomNavigationBarItem(
          icon: Image.asset(icCart, width: 26), label: cart),
      BottomNavigationBarItem(
          icon: Image.asset(icProfile, width: 26), label: account),
    ];

    var navBody = [
      HomeScreen(),
      CategoryScreen(),
      CartScreen(),
      ProfileScreen()
    ];

    return Scaffold(
      body: Column(children: [
        Obx(
          () => Expanded(
            child: navBody.elementAt(controller.curruntNavIndex.value),
          ),
        ),
      ]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.curruntNavIndex.value,
          selectedItemColor: maganta,
          selectedLabelStyle: const TextStyle(fontFamily: semibold),
          type: BottomNavigationBarType.fixed,
          backgroundColor: whiteColor,
          items: navBarItem,
          onTap: (Value) {
            controller.curruntNavIndex.value = Value;
          },
        ),
      ),
    );
  }
}
