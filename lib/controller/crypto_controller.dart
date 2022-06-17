import 'package:cryptomoon/model/remote/crypto/crypto_remote_data_source.dart';
import 'package:cryptomoon/model/remote/crypto/model/crypto_model.dart';
import 'package:get/get.dart';


enum PageState{initial,loading , error , loaded}

class CryptoController extends GetxController{
  final CryptoRemoteDataSource _cryptoRemoteDataSource = CryptoRemoteDataSource();
  Rx<PageState> pageSate = PageState.initial.obs;
  List<CryptoAssetsModel> cryptoList = <CryptoAssetsModel>[];
  List<CryptoAssetsSymbolModel> cryptoImageList = <CryptoAssetsSymbolModel>[];

  void getCryptoList()async{
    try{
      pageSate(PageState.loading);
      cryptoList = await _cryptoRemoteDataSource.getCrypto();
      cryptoImageList = await _cryptoRemoteDataSource.getCryptoImage();
      pageSate(PageState.loaded);
    }catch(e){
      pageSate(PageState.error);
    }
  }
}