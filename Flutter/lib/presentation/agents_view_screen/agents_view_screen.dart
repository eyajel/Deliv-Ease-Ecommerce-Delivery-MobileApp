import 'package:delivery/models/agent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'widgets/agents_view_item.dart';
import 'package:delivery/core/app_export.dart';
import 'package:delivery/services/AgentApiService.dart';

class AgentsViewScreen extends StatefulWidget {
  const AgentsViewScreen({super.key});

  @override
  State<AgentsViewScreen> createState() => _AgentsViewScreenState();
}

class _AgentsViewScreenState extends State<AgentsViewScreen> {
   late Future<List<Agent>> futureAgents;

  @override
  void initState() {
    super.initState();
    futureAgents = AgentService().fetchAllAgents(); // Initialize the future with your fetch function
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildAppBar(context),
                SizedBox(height: 35),
                _buildDeliveryView(futureAgents),
              ],
            ),
          ),
        ),
      ),
    );
  }
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
                      onTap: (){
                        //functionality for button press
                        print("Home button pressed");
                      },
                    ),

                  ),
                  
                  Container(
                    height: 90,
                    width: 120,
                    margin: EdgeInsets.only(bottom: 34),
                    alignment: Alignment.topCenter,
                    child: IconButton(
                          icon: Image.asset(
                          ImageConstant.imgBasket,
                          height: 90,
                          width: 120,
                          alignment: Alignment.topCenter,
                          ),
                          onPressed: () => print("Your cart"),
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
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(
                left: 22,
                bottom: 41,
              ),
              child: Text(
                "First Delivery",
                style: theme.textTheme.headlineSmall,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: 75,
              width: 75,
              margin: EdgeInsets.only(
                right: 61,
                bottom: 16,
              ),
              decoration: BoxDecoration(
                color: appTheme.whiteA700,
                borderRadius: BorderRadius.circular(
                  37,
                ),
                boxShadow: [
                  BoxShadow(
                    color: appTheme.black900.withOpacity(0.25),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(
                      0,
                      4,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              width: 126,
              margin: EdgeInsets.only(left: 57),
              child: Text(
                "Slogan : Lorem ipsum Dolor sit amet",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildDeliveryView(Future<List<Agent>> futureAgents) {
    return Padding(
      padding: EdgeInsets.only(
        left: 37,
        right: 33,
      ),
      child: FutureBuilder<List<Agent>>(
        future: futureAgents,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // Show loading indicator
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}')); // Error handling
          } else {
            return GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 122,
                crossAxisCount: 2,
                mainAxisSpacing: 30,
                crossAxisSpacing: 30,
              ),
              physics: NeverScrollableScrollPhysics(),
              itemCount: snapshot.data?.length?? 0, // Use length of fetched data
              itemBuilder: (context, index) {
                final agent = snapshot.data![index]; // Access individual agent
                return AgentsViewItem(agent: agent); // Pass the agent to AgentsViewItem
              },
            );
          }
        },
      ),
    );
  }
}