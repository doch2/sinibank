import 'package:get/get.dart';
import 'package:sinibank/middleware/LoginMiddleware.dart';
import 'package:sinibank/pages/account_list/page.dart';
import 'package:sinibank/pages/finance_commonsense/page.dart';
import 'package:sinibank/pages/finance_info/page.dart';
import 'package:sinibank/pages/fraud_account/page.dart';
import 'package:sinibank/pages/home/binding.dart';
import 'package:sinibank/pages/home/page.dart';
import 'package:sinibank/pages/landing/page.dart';
import 'package:sinibank/pages/login/binding.dart';
import 'package:sinibank/pages/login/page.dart';
import 'package:sinibank/pages/password_input/binding.dart';
import 'package:sinibank/pages/password_input/page.dart';
import 'package:sinibank/pages/password_theme/page.dart';
import 'package:sinibank/pages/select_account/binding.dart';
import 'package:sinibank/pages/select_account/page.dart';
import 'package:sinibank/pages/transaction_list/page.dart';
import 'package:sinibank/pages/transfer_money/binding.dart';
import 'package:sinibank/pages/transfer_money/page.dart';
import 'package:sinibank/routes/routes.dart';

class SinibankPages {
  static final pages = [
    GetPage(name: PageRoutes.HOME, page: () => const HomePage(), binding: HomePageBinding(), middlewares: [LoginMiddleware()]),
    GetPage(name: PageRoutes.LOGIN, page: () => const LoginPage(), binding: LoginPageBinding()),
    GetPage(name: PageRoutes.FINANCEINFO, page: () => const FinanceInfoPage()),
    GetPage(name: PageRoutes.FINANCECOMMONSENSE, page: () => const FinanceCommonSensePage()),
    GetPage(name: PageRoutes.ACCOUNTLIST, page: () => const AccountListPage()),
    GetPage(name: PageRoutes.FRAUDACCOUNT, page: () => const FraudAccountPage()),
    GetPage(name: PageRoutes.LANDING, page: () => const LandingPage()),
    GetPage(name: PageRoutes.TRANSACTIONLIST, page: () => const TransactionListPage()),
    GetPage(name: PageRoutes.PASSWORDTHEME, page: () => const PasswordThemePage()),
    GetPage(name: PageRoutes.PASSWORDINPUT, page: () => const PasswordInputPage(), binding: PasswordInputPageBinding()),
    GetPage(name: PageRoutes.TRANSFERMONEY, page: () => const TransferMoneyPage(), binding: TransferMoneyPageBinding()),
    GetPage(name: PageRoutes.SELECTACCOUNT, page: () => const SelectAccountPage(), binding: SelectAccountPageBinding()),
  ];
}
