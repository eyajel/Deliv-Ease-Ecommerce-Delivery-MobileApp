import 'package:delivery/routes/app_routes.dart';
import 'package:delivery/screens/home/views/welcomepage.dart';
import 'package:delivery/screens/home/views/ChooseDelivery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:delivery/blocs/authentication_bloc/authentication_bloc.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'delivery_app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          background: Color(0xFFF5F5F5),
          onBackground: Colors.black,
          primary: Color.fromRGBO(158, 9, 15, 1.0),
          onPrimary: Color.fromARGB(255, 242, 242, 242),
        ),
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state.status == AuthenticationStatus.authenticated) {
            return const ChooseDelivery();
          } else {
            return WelcomePage(); // Display the WelcomePage first
          }
        },
      ),
      routes: AppRoutes.routes,
    );
  }
}
