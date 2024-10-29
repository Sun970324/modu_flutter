import 'package:final_proj_flutter/providers/chat_provider.dart';
import 'package:final_proj_flutter/screens/menu_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'providers/cart_provider.dart';

void main() {
  runApp(const ModuApp());
}

class ModuApp extends StatelessWidget {
  const ModuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            // ChangeNotifierProvider(create: (context) => CartProvider()),
            ChangeNotifierProvider(create: (context) => ChatProvider()),
          ],
          child: const MaterialApp(
            title: 'Modu App',
            debugShowCheckedModeBanner: false,
            home: SafeArea(
              child: MenuPage(),
            ),
          ),
        );
      },
    );
  }
}

// CartPage, MenuPage, MenuFullPage
