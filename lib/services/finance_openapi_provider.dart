import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:get/get.dart' hide Response, MultipartFile, FormData;
import 'package:intl/intl.dart';
import 'package:sinibank/models/bank_transaction.dart';
import 'package:sinibank/services/auth_service.dart';
import 'package:sinibank/services/firestore_database.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sinibank/services/token_reference.dart';

import '../models/bank_account.dart';

class FinanceOpenApiProvider {
  final apiUrl = "https://developers.kftc.or.kr/proxy";

  final Dio _dio = Get.find<Dio>();
  final FirestoreDatabase _firestoreDatabase = FirestoreDatabase();
  final FlutterSecureStorage _storage = Get.find<FlutterSecureStorage>();

  late String _accessToken;

  getBankTransferUniqueNum() => "M202201789U${_getRandomString(9)}";

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
      _storage.write(key: "sinibank_openapi_userSeqNo", value: tokenResponse.data['user_seq_no']);
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

  loadUserSeqNo() async => (await _storage.read(key: "sinibank_openapi_userSeqNo"))!;

  getAccountList() async {
    try {
      Response response = await _dio.get(
        "$apiUrl/account/list",
        options: Options(contentType: "application/json", headers: {'Authorization': 'Bearer $_accessToken'}),
        queryParameters: {
          "user_seq_no": await loadUserSeqNo(),
          "include_cancel_yn": "Y",
          "sort_order": "D"
        }
      );

      List originalData = response.data['res_list'];
      List formattingData = [];
      originalData.forEach((element) => formattingData.add(BankAccount.fromJson(element)));

      return {
        "success": true,
        "content": formattingData,
      };
    } on DioError catch (e) {
      return {
        "success": false,
        "content": e.response?.data
      };
    }
  }

  getAccountTransactionList(String accountFinNum) async {
    try {
      print(getBankTransferUniqueNum());
      Response response = await _dio.get(
          "$apiUrl/account/transaction_list/fin_num",
          options: Options(
            contentType: "application/json",
            headers: {
              'Authorization': 'Bearer $_accessToken',
              'Cookie': "JSESSIONID=aLLHiV91gbVW611yJ5CScYkKjWNpfINLzillVkNjjB45xIZ3bMaf2Sq6DiWMrN2f.YXBpcHRfZG9tYWluL2RldmVsb3BlcnM="
            },
          ),
          queryParameters: {
            "bank_tran_id": getBankTransferUniqueNum(),
            "fintech_use_num": accountFinNum,
            "inquiry_type": "A",
            "inquiry_base": "D",
            "from_date": "20220601",
            "to_date": "${DateFormat('yyyyMMdd').format(DateTime.now())}",
            "sort_order": "D",
            "tran_dtime": "${DateFormat('yyyyMMddhhmmss').format(DateTime.now())}",
          }
      );
      print(response.data);

      List originalData = response.data['res_list'];
      List formattingData = [];
      originalData.forEach((element) => formattingData.add(BankTransaction.fromJson(element)));

      return {
        "success": true,
        "content": formattingData,
      };
    } on DioError catch (e) {
      return {
        "success": false,
        "content": e.response?.data
      };
    }
  }

  getAccountBalance(String accountFinNum) async {
    try {
      Response response = await _dio.get(
          "$apiUrl/account/balance/fin_num",
          options: Options(
              contentType: "application/json",
              headers: {
                'Authorization': 'Bearer $_accessToken',
                'Cookie': "JSESSIONID=aLLHiV91gbVW611yJ5CScYkKjWNpfINLzillVkNjjB45xIZ3bMaf2Sq6DiWMrN2f.YXBpcHRfZG9tYWluL2RldmVsb3BlcnM="
              },
          ),
          queryParameters: {
            "bank_tran_id": getBankTransferUniqueNum(),
            "fintech_use_num": accountFinNum,
            "tran_dtime": "${DateFormat('yyyyMMddhhmmss').format(DateTime.now())}",
          }
      );

      return {
        "success": true,
        "content": response.data['balance_amt'],
      };
    } on DioError catch (e) {
      return {
        "success": false,
        "content": e.response?.data
      };
    }
  }

  transferWithdraw(String myAccountFinNum, String transferAccountNum, BankAccount receiveAccount, int transMoneyNum) async {
    try {
      Response response = await _dio.post(
          "$apiUrl/transfer/withdraw/fin_num",
          options: Options(
            contentType: "application/json",
            headers: {
              'Authorization': 'Bearer $_accessToken',
              'Cookie': "JSESSIONID=aLLHiV91gbVW611yJ5CScYkKjWNpfINLzillVkNjjB45xIZ3bMaf2Sq6DiWMrN2f.YXBpcHRfZG9tYWluL2RldmVsb3BlcnM="
            },
          ),
          data: {
            "bank_tran_id": getBankTransferUniqueNum(),
            "cntr_account_type": "N",
            "cntr_account_num": "100000000001",
            "dps_print_content": "이체 진행",
            "fintech_use_num": myAccountFinNum,
            "tran_amt": "$transMoneyNum",
            "tran_dtime": "${DateFormat('yyyyMMddhhmmss').format(DateTime.now())}",
            "req_client_name": Get.find<AuthService>().user.name!,
            "req_client_num": "DOHUIRYU1324",
            "req_client_fintech_use_num": "${receiveAccount.fintechUserNum}",
            "transfer_purpose": "TR",
            "recv_client_name": "${receiveAccount.accountHolderName}",
            "recv_client_bank_code": "${receiveAccount.bankCodeStd}",
            "recv_client_account_num": transferAccountNum
          }
      );

      return {
        "success": true,
        "content": response.data,
      };
    } on DioError catch (e) {
      return {
        "success": false,
        "content": e.response?.data
      };
    }
  }



   _launchUrl(Uri url) async {
     if (!await launchUrl(url)) {
       throw 'Could not launch $url';
     }
   }

  static const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String _getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
}