import 'package:flutter/material.dart';
import 'package:cura_tech/dependencies_provider.dart';
import 'package:cura_tech/src/common/bloc/bloc_provider.dart';
import 'package:cura_tech/src/presentation/cart/cart_bloc.dart';
import 'package:cura_tech/src/presentation/home/home_page.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping Cart Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        canvasColor: Colors.grey[50],
      ),
      home: BlocProvider(
        bloc: getIt<CartBloc>(),
        child: HomePage(),
      ),
    );
  }
}
