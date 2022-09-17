import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:get/get.dart' hide Response, MultipartFile, FormData;
import 'package:sinibank/services/auth_service.dart';
import 'package:sinibank/services/firestore_database.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sinibank/services/token_reference.dart';

class FinanceOpenApiProvider {
  final apiUrl = "https://developers.kftc.or.kr/proxy";
  final Dio _dio = Get.find<Dio>();
  final FirestoreDatabase _firestoreDatabase = FirestoreDatabase();
  final FlutterSecureStorage _storage = Get.find<FlutterSecureStorage>();

  late String _accessToken;


  removeAlert(String id) async {
    try {
      Response response = await _dio.delete(
        "$apiUrl/oauth/2.0/token",
        options: Options(contentType: "application/json", headers: {'Authorization': 'Bearer $_accessToken'}),
      );

      return {
        "success": true,
        "content": response.data['data'],
      };
    } on DioError catch (e) {
      return {
        "success": false,
        "content": e.response?.data['data']["message"]
      };
    }
  }

  authorizeOpenAPI() async {
    try {
      String redirectURL = "https://dohui.me/sinibank-redirect.html";

      Response response = await _dio.get(
        "$apiUrl/oauth/2.0/authorize",
        options: Options(contentType: "application/json"),
        queryParameters: {
          'response_type': 'code',
          'client_id': TokenReference.FINANCE_OPENAPI_CLINETID,
          'redirect_uri': "$redirectURL",
          'scope': 'login inquiry transfer',
          'state': TokenReference.FINANCE_OPENAPI_STATECODE,
          'auth_type': "0",
        }
      );

      final result = await FlutterWebAuth.authenticate(url: response.headers['location']![0], callbackUrlScheme: "sinibank-finance-openapi");
      String code = Uri.parse(result).queryParameters['code']!;

      await _firestoreDatabase.setOpenApiCode(code);

      Response tokenResponse = await _dio.post(
          "$apiUrl/oauth/2.0/token",
          options: Options(contentType: "application/x-www-form-urlencoded"),
          data: {
            "code": Get.find<AuthService>().user.apiCode,
            "client_id": TokenReference.FINANCE_OPENAPI_CLINETID,
            "client_secret": TokenReference.FINANCE_OPENAPI_CLINETSECRET,
            "redirect_uri": redirectURL,
            "grant_type": "authorization_code"
          }
      );

      _storage.write(key: "sinibank_openapi_accessToken", value: tokenResponse.data['access_token']);
      _accessToken = (await _storage.read(key: "sinibank_openapi_accessToken"))!;

      return {
        "success": true,
        "content": tokenResponse.data
      };
    } on DioError catch (e) {
      return {
        "success": false,
        "content": e.response?.data
      };
    }
  }

  loadAccessToken() async => _accessToken = (await _storage.read(key: "sinibank_openapi_accessToken"))!;

   _launchUrl(Uri url) async {
     if (!await launchUrl(url)) {
       throw 'Could not launch $url';
     }
   }
}