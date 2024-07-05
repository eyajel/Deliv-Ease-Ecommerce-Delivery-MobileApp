import 'package:flutter/material.dart';

class RatingStars extends StatefulWidget {
  final int initialRating;
  final ValueChanged<int>? onChanged;

  const RatingStars({Key? key, this.initialRating = 0, this.onChanged}) : super(key: key);

  @override
  _RatingStarsState createState() => _RatingStarsState();
}

class _RatingStarsState extends State<RatingStars> {
  late int _rating;

  @override
  void initState() {
    super.initState();
    _rating = widget.initialRating;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
        (index) => MouseRegion(
          onEnter: (_) {
            if (_rating == 0) {
              setState(() {
                _rating = index + 1;
              });
            }
          },
          onExit: (_) {
            if (_rating == index + 1) {
              setState(() {
                _rating = 0;
              });
            }
          },
          child: GestureDetector(
            onTap: () {
              setState(() {
                _rating = index + 1;
              });
              if (widget.onChanged != null) {
                widget.onChanged!(_rating);
              }
            },
            child: Icon(
              Icons.star,
              size: 20, // Adjust the size of the stars as needed
              color: index < _rating ? const Color.fromARGB(255, 235, 214, 31) : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}