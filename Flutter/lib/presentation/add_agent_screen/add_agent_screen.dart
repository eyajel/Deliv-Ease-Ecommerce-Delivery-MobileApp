import 'dart:io';
import 'dart:core';
import 'package:delivery/presentation/agents_view_screen/agents_view_screen.dart';
import 'package:delivery/services/AgentApiService.dart';
import 'package:flutter/material.dart';
import 'package:delivery/core/app_export.dart';
import 'package:image_picker/image_picker.dart';
import 'package:delivery/models/agent.dart';

class AddAgentScreen extends StatefulWidget {
  const AddAgentScreen({super.key});

  @override
  State<AddAgentScreen> createState() => _AddAgentScreenState();
}

class _AddAgentScreenState extends State<AddAgentScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  String? selectedRegion;
  File? _imageFile;
  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      try {
        AgentService agentService = AgentService();
        Agent agent = Agent(
          name: nameController.text,
          email: emailController.text,
          phoneNumber: phoneController.text,
          region: selectedRegion ?? '',
        );
        Map<String, dynamic> response =
            (await agentService.saveAgent(agent)) as Map<String, dynamic>;

        if (response.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to submit')),
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => AgentsViewScreen()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Form submitted successfully')),
          );
        }
      } catch (e) {
        print('Error submitting form: $e');
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to submit form')),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildNine(context),
                SizedBox(height: 35),
                Container(
                  height: 130,
                  width: 130,
                  margin: EdgeInsets.only(left: 106),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: CircleAvatar(
                          radius: 62,
                          backgroundColor: Colors.white,
                          backgroundImage: _imageFile != null
                              ? FileImage(_imageFile!)
                              : AssetImage('assets/images/avatar.jpg')
                                  as ImageProvider<Object>,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10, right: 8),
                        child: PlusButton(onTap: _selectImage),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 43),
                  child: Text(
                    "Name",
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 43),
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: "Flen Fouleni",
                      contentPadding: EdgeInsets.only(top: 15),
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[500],
                        fontWeight: FontWeight.w400,
                        fontFamily: 'josefin sans',
                      ),
                    ),
                    validator: _validateName,
                  ),
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Divider(
                    indent: 43,
                    endIndent: 43,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 43, vertical: 5),
                  child: Text(
                    _validateName(nameController.text) ?? '',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                SizedBox(height: 28),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 43),
                  child: Text(
                    "Email",
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 43),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: "flenfouleni@gmail.com",
                      contentPadding: EdgeInsets.only(top: 15),
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[500],
                        fontWeight: FontWeight.w400,
                        fontFamily: 'josefin sans',
                      ),
                    ),
                    validator: _validateEmail,
                  ),
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Divider(
                    indent: 43,
                    endIndent: 43,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 43, vertical: 5),
                  child: Text(
                    _validateEmail(emailController.text) ?? '',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                SizedBox(height: 28),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 43),
                  child: Text(
                    "Phone Number",
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 43),
                  child: TextFormField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      hintText: "+216 12 345 678",
                      contentPadding: EdgeInsets.only(top: 15),
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[500],
                        fontWeight: FontWeight.w400,
                        fontFamily: 'josefin sans',
                      ),
                    ),
                    validator: _validatePhoneNumber,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Divider(
                    indent: 43,
                    endIndent: 43,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 43, vertical: 5),
                  child: Text(
                    _validatePhoneNumber(phoneController.text) ?? '',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                SizedBox(height: 28),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 43),
                  child: Text(
                    "Region",
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 43),
                  child: DropdownButtonFormField<String>(
                    value: selectedRegion,
                    items: RegionList.governorates.map((region) {
                      return DropdownMenuItem<String>(
                        value: region,
                        child: Text(
                          region,
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      hintText: "Select a region",
                      contentPadding: EdgeInsets.only(top: 15),
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[500],
                        fontWeight: FontWeight.w400,
                        fontFamily: 'josefin sans',
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        selectedRegion = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Region is required';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                  child: Text(
                    _validateRegion(selectedRegion) ?? '',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 1, left: 5),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AgentsViewScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF9E090F),
                          padding: EdgeInsets.symmetric(
                              horizontal: 35, vertical: 20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        child: Text(
                          'See agents',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Josefin Sans',
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 1, right: 5),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Collecting data from the form
                            String name = nameController.text;
                            String email = emailController.text;
                            String phoneNumber = phoneController.text;
                            String region = selectedRegion ?? '';

                            // Creating an Agent object
                            Agent agent = Agent(
                              name: name,
                              email: email,
                              phoneNumber: phoneNumber,
                              region: region,
                            );

                            // Submitting the agent to the backend
                            AgentService().saveAgent(agent).then((savedAgent) {
                              // Handle success case, e.g., show a snackbar or navigate to another page
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          Text('Failed to save the Agent')));
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AgentsViewScreen()), // Navigate to the view screen after saving
                              );
                            }).catchError((error) {
                              // Handle error case, e.g., show an error message
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          Text('Agent saved successfully')));
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF9E090F),
                          padding: EdgeInsets.symmetric(
                              horizontal: 35, vertical: 20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        child: Text(
                          'Save',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Josefin Sans',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _selectImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        // Update the image file
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Widget _buildNine(BuildContext context) {
    return SizedBox(
      height: 67,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            height: 64,
            width: 360,
            alignment: Alignment.topCenter,
            child: Image.asset(
              ImageConstant.imgEllipse,
              fit: BoxFit.fitWidth,
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 23),
              child: Text(
                "Add Agent",
                style: theme.textTheme.headlineSmall,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

String? _validateName(String? value) {
  if (value == null) {
    return 'Name is required';
  }
  return null;
}

String? _validateEmail(String? value) {
  if (value == null) {
    return 'Email is required';
  }

  // Regular expression for email format validation
  final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  if (!emailRegExp.hasMatch(value)) {
    return 'Enter a valid email address';
  }

  return null;
}

String? _validatePhoneNumber(String? value) {
  if (value == null) {
    return 'Phone number is required';
  }

  // Regular expression for phone number format validation
  final phoneRegExp = RegExp(r'^\+216 \d{2} \d{3} \d{3}$');

  if (!phoneRegExp.hasMatch(value)) {
    return 'Please enter a valid Tunisian phone number\nFormat: +216 xx xxx xxx';
  }

  return null;
}

String? _validateRegion(String? value) {
  if (value == null) {
    return 'Region is required';
  }
  return null;
}
