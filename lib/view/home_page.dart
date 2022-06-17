import 'package:cryptomoon/controller/crypto_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CryptoController _cryptoController = CryptoController();

  @override
  void initState() {
    _cryptoController.getCryptoList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CryptoMoon'),
        centerTitle: true,
      ),
      body: Obx(
        () {
          if (_cryptoController.pageSate.value == PageState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (_cryptoController.pageSate.value == PageState.loaded) {
            return Expanded(
              child: ListView.builder(
                itemCount: _cryptoController.cryptoList.length,
                itemBuilder: (BuildContext context, int index) {
                  final data = _cryptoController.cryptoList[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1 , color: Colors.blueAccent),
                    ),
                    child: Row(
                      children: [
                        Text(data.name),
                        Text(data.priceUsd.toString()),
                      ],
                    ),
                  );
                },
              ),
            );
          } else if (_cryptoController.pageSate.value == PageState.error) {
            return const Center(
              child: Text(
                'Please check your network',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
