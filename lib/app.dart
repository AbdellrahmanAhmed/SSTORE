import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:s_store/bindings/general_bindings.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/theme/theme.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: GeneralBindings(),
      themeMode: ThemeMode.system,
      theme: SSAppTheme.lightTheme,
      darkTheme: SSAppTheme.darkTheme,
      home: const Scaffold(
        backgroundColor: SSAppColors.primary,
        body: Center(
          child: CircularProgressIndicator(
            color:Colors.black,
          ),
        ),
      ),
    );
  }
}
