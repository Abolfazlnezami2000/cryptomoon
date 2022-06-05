import 'package:cryptomoon/controller/wallet_controller.dart';
import 'package:cryptomoon/core/constants.dart';
import 'package:cryptomoon/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppImage.metamask),
          const Text('Welcome to CryptoMoon'),
          const Text('Connect your meta mask wallet and start for buy crypto'),
          GestureDetector(
            onTap: ()async{
              bool result = await WalletController().walletConnect();
              if(result) {
                Get.to(const HomePage());
              } else {
                Get.snackbar('Error', 'Error');
              }
            },
            child: Container(
              height: 20,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text('Get Start'),
            ),
          ),
        ],
      ),
    );
  }
}
