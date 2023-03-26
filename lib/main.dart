import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_dependencias/pages/bindings/bindings_controller.dart';
import 'package:get_dependencias/pages/bindings/bindings_example.dart';
import 'package:get_dependencias/pages/bindings/home_bindings.dart';
import 'package:get_dependencias/pages/metodos/lazyPut/lazy_put_page.dart';
import 'package:get_dependencias/pages/metodos/put/put_page.dart';
import 'package:get_dependencias/pages/basico/basico_home_page.dart';
import 'package:get_dependencias/pages/home_page.dart';

import 'pages/metodos/metodos_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(
          name: '/',
          page: () => const HomePage(),
        ),
        GetPage(
          name: '/basico',
          page: () => BasicoHomePage(),
        ),
        GetPage(
          name: '/metodos',
          page: () => const MetodosHomePage(),
          children: [
            GetPage(
              name: '/put',
              page: () => const PutPage(),
            ),
            GetPage(
              name: '/lazyPut',
              page: () => LazyPutPage(),
            ),
          ],
        ),
        GetPage(
          name: '/bindings',
          page: () => const HomeBindings(),
          binding: BindingsExample(),
        ),
        GetPage(
          name: '/bindings_builder',
          page: () => const HomeBindings(),
          binding: BindingsBuilder(() {
            Get.put(
              BindingsController(nome: 'Inicializando com bindings'),
            );
          }),
        ),
      ],
    );
  }
}
