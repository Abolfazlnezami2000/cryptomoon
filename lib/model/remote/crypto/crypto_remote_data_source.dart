import 'dart:convert';

import 'package:cryptomoon/core/constants.dart';
import 'package:cryptomoon/model/remote/crypto/model/crypto_model.dart';
import 'package:http/http.dart' as http;



class CryptoRemoteDataSource{
  Future<List<CryptoAssetsModel>> getCrypto() async {
    try{
      var url = Uri.parse(Url.getAssets);
      var response = await http.get(
        url,
      );
      if (response.statusCode == 200) {
        List<dynamic> test1 = json.decode(response.body);
        List<CryptoAssetsModel> jvab = [];
        test1.forEach((element) {
          CryptoAssetsModel test2 = CryptoAssetsModel.fromJson(element);
          jvab.add(test2);
        });
        List<CryptoAssetsModel> test = json.decode(response.body).map((x) => CryptoAssetsModel.fromJson(x));
        final data = List<CryptoAssetsModel>.from(json.decode(response.body).map((x) => CryptoAssetsModel.fromJson(x)));
        return jvab;
      } else {
        throw FormatException((jsonDecode(response.body))["message"].toString());
      }
    }catch(e){
      throw Exception();
    }
  }

  Future<List<CryptoAssetsSymbolModel>> getCryptoImage() async {
    var url = Uri.parse(Url.getAssetsSymbol);
    var response = await http.get(
      url,
    );
    if (response.statusCode == 200) {
      final data = List<CryptoAssetsSymbolModel>.from(json.decode(response.body).map((x) => CryptoAssetsSymbolModel.fromJson(x)));
      return data;
    } else {
      throw FormatException((jsonDecode(response.body))["message"].toString());
    }
  }
}