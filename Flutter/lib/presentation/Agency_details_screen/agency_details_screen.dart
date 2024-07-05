import "package:delivery/core/app_export.dart";
import "package:delivery/presentation/product_details_screen/widgets/rating_stars.dart";
import "package:delivery/presentation/product_details_screen/widgets/down_bar.dart";
import "package:delivery/services/ApiService.dart";
import "package:flutter/material.dart";

class AgencyDetailsScreen extends StatefulWidget {
  final int agencyId; 
  AgencyDetailsScreen({Key? key ,required this.agencyId}) : super(key: key);

  @override
  _AgencyDetailsScreenState createState() => _AgencyDetailsScreenState();
}

class _AgencyDetailsScreenState extends State<AgencyDetailsScreen> {
  String agencyName = '';
 String agencyDescription = '';
 String agencyAddress = '';

 @override
 void initState() {
    super.initState();
    _fetchAgencyDetails();
 }

 Future<void> _fetchAgencyDetails() async {
    try {
      final agencyDetails = await ApiService().getSingleAddress(widget.agencyId);
      setState(() {
        agencyName = agencyDetails['name'];
        agencyDescription = agencyDetails['description'];
        agencyAddress = agencyDetails['adresse'];
      });
    } catch (e) {
      print('Error fetching agency details: $e');
    }
 }
  String selectedSize = 'S'; // Initially selected size

  final List<String> sizes = ['XS', 'S', 'M', 'L', 'XL', 'XXL'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(100), // Define the height of the app bar
          child: _buildAppBar(context),
        ),
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 19),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      20), // Adjust the border radius as needed
                  child: Container(
                    width: 220, // Adjust the width as needed
                    height: 280, // Adjust the height as needed
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          10), // Border radius to match the ClipRRect
                    ),
                    child: Image.asset(
                      'assets/images/avatar.jpg', // Path to your image placeholder asset
                      fit: BoxFit.cover, // Adjust the fit as needed
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      agencyName,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    RatingStars(
                      initialRating: 0,
                      onChanged: (rating) {
                        print('New rating :$rating');
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      agencyDescription,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: Colors.black),
                    ),
                    DropdownButton<String>(
                      value: selectedSize, // Initially selected size (optional)
                      onChanged: (String? newSize) {
                        setState(() {
                          selectedSize = newSize!;
                        });
                      },
                      style: TextStyle(color: Colors.grey[600]),
                      dropdownColor: Colors.white,
                      items:
                          sizes.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      agencyAddress,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              DownBar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Container(
      height: 140,
      width: double.infinity,
      color: Colors.grey[100], // Background color of the app bar
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 13),
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.grey[600],
              onPressed: () {
                Navigator.pop(context); // Navigates back to the previous page
              },
            ),
          ),
          GestureDetector(
            onTap: () {
              print('basket clicked');
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Image.asset(
                'assets/images/basket.png', // Replace with your image path
                height: 100,
                width: 100,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10, top: 21),
            child: CustomIconButton(
              backgroundColor: appTheme.whiteA700,
              height: 40,
              width: 40,
              padding: EdgeInsets.all(5),
              alignment: Alignment.topRight,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
              child: Image.asset(
                ImageConstant.imgUserIcon,
                height: 40,
                width: 40,
              ),
              onTap: () => print("Your User Account"),
            ),
          ),
        ],
      ),
    );
  }
}
