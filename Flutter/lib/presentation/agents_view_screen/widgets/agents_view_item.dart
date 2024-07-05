import 'package:delivery/presentation/agent_crud_screen/agent_crud_screen.dart';
import 'package:delivery/widgets/plus_button.dart';
import 'package:flutter/material.dart';
import 'package:delivery/models/agent.dart';

class AgentsViewItem extends StatelessWidget {
  final Agent agent;

  const AgentsViewItem({Key? key, required this.agent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: 5, vertical: 1), // Reduced padding
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 215, 217, 218),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Center(
              child: CircleAvatar(
                backgroundImage: AssetImage(
                    'assets/images/avatar.png'), // Assuming agent.photoUrl contains the URL of the agent's photo
                radius: 24, // Adjust the radius as needed
              ),
            ),
          ),
          SizedBox(height: 10), // Space between avatar and text
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    agent.name,
                    style: TextStyle(fontSize: 14), // Adjusted font size
                    overflow:
                        TextOverflow.ellipsis, // Ensure text doesn't overflow
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(right: 2, bottom: 4), // Adjusted padding
                  child: PlusButton(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AgentCrudScreen()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
