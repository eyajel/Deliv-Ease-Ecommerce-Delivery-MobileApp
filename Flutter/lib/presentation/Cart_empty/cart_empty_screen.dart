import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:delivery/presentation/cart_empty/widgets/custom_app_bar.dart';

class CartEmptyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(130), // Define the height of the app bar
          child: buildAppBar(context),
        ),
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 19),
          child: Column(
            children: [
              //buildAppBar(context),
              const SizedBox(height: 110),
              Padding(
                padding: const EdgeInsets.only(right: 40),
                child: Image.asset(
                  'assets/images/emptycart.png',
                  height: 148,
                  width: 197,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Cart Empty',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: const Center(
                  child: Text(
                    "Go ahead ! Pick your fav category and get your cart full,we are here to bring your order !",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ),
              const SizedBox(height: 100)
            ],
          ),
        ),
      ),
    );
  }
}
