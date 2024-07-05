import 'package:delivery/theme/custom_text_style.dart';
import 'package:delivery/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:delivery/core/app_export.dart';

class AgentCrudScreen extends StatefulWidget {
  const AgentCrudScreen({Key? key}) : super(key: key);

  @override
  _AgentCrudScreenState createState() => _AgentCrudScreenState();
}

class _AgentCrudScreenState extends State<AgentCrudScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 13),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildAppBar(context),
                      SizedBox(height: 8),
                      Container(
                        height: 124,
                        width: 129,
                        decoration: BoxDecoration(
                          color: appTheme.whiteA700,
                          borderRadius: BorderRadius.circular(
                            64,
                          ),
                        ),
                      ),
                      SizedBox(height: 59),
                      _buildEleven(context),
                      SizedBox(height: 29),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: 292,
                          margin: EdgeInsets.only(
                            left: 20,
                            right: 47,
                          ),
                          child: Text(
                            "Description : HalaDhaouadi@gmail.com +216 58 411 700 ",
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                            style: CustomTextStyles.headlineSmallGray600,
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                      _buildFour(context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAppBar(BuildContext context) {
    return SizedBox(
      height: 161,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: double.maxFinite,
              margin: EdgeInsets.only(bottom: 44),
              padding: EdgeInsets.symmetric(horizontal: 17),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    ImageConstant.imgEllipseLarge,
                  ),
                  fit: BoxFit.none,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 13,
                      bottom: 64,
                    ),
                    child: CustomIconButton(
                      height: 40,
                      width: 40,
                      padding: EdgeInsets.all(9),
                      child: Image.asset(
                        ImageConstant.imgHomeIcon,
                        height: 40,
                        width: 40,
                      ),
                      onTap: () {
                        //functionality for button press
                        print("Home button pressed");
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 13,
                      bottom: 64,
                    ),
                    child: CustomIconButton(
                      height: 40,
                      width: 40,
                      padding: EdgeInsets.all(9),
                      alignment: Alignment.topRight,
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
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildEleven(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 19),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 12),
            child: Text(
              "Hala Dhaouadi",
              style: CustomTextStyles.bodyLargeBlack900,
            ),
          ),
          Container(
            height: 28,
            width: 51,
            margin: EdgeInsets.only(bottom: 2),
            padding: EdgeInsets.symmetric(
              horizontal: 17,
              vertical: 7,
            ),
            decoration: AppDecoration.fillGray700.copyWith(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.star,
              size: 14,
              color: Colors.yellow,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFour(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      color: appTheme.blueGray100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(48),
      ),
      child: Container(
        height: 110,
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(vertical: 20),
        decoration: AppDecoration.fillBlueGray.copyWith(
          borderRadius: BorderRadius.circular(48),
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 38,
                width: 187,
                margin: EdgeInsets.only(top: 9),
                decoration: BoxDecoration(
                  color: appTheme.blueGray100,
                ),
              ),
            ),
            Container(
              width: 200,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: appTheme.red900,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: const Text(
                'delete',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
