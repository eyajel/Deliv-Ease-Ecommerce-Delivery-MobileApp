import 'package:flutter/material.dart';

class DownBar extends StatefulWidget {
  @override
  DownBarState createState() => DownBarState();
}

class DownBarState extends State<DownBar> {
  int quantity = 1;
  double price = 46.000;

  void incrementQuantity() {
    setState(() {
      quantity++;
      price += 46.000; // Increment the price
    });
  }

  void decrementQuantity() {
    setState(() {
      if (quantity > 1) {
        quantity--;
        price -= 46.000; // Decrement the price
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/Rectangle 18.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Image.asset('assets/images/Minus one button.png'), 
                        iconSize: 40,
                        onPressed: decrementQuantity,
                      ),
                      SizedBox(width: 10),
                      Text('$quantity', style: TextStyle(color: Colors.black, fontSize: 27, fontWeight: FontWeight.bold)),
                      SizedBox(width: 10),
                      IconButton(
                        icon: Image.asset('assets/images/Plus one button.png'),
                        iconSize: 40,
                        onPressed: incrementQuantity,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      print('Button pressed!');
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color(0XFF9E090F)),
                      minimumSize: MaterialStateProperty.all<Size>(Size(310, 45)),
                    ),
                    child: Text(
                      'Add to Cart for ${price.toStringAsFixed(3)} Dt',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Josefin Sans',
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}