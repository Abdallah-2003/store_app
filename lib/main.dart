import 'package:flutter/material.dart';
import 'package:schooler_chat/core/networking/dio_helper.dart';
import 'package:schooler_chat/core/routing/app_router.dart';
import 'package:schooler_chat/core/routing/routes.dart';
import 'package:schooler_chat/core/services/cash_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CashHelper.init();
  await DioHelper.init();
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StoreApp',
      initialRoute: Routes.loginView,
      onGenerateRoute: AppRouter().generateRoute,
      );
  }
}
// CashHelper.getData('accessToken') == null ? Routes.loginView : Routes.homeView