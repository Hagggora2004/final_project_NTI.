import 'package:flutter/material.dart';
import 'package:flutter_graduation_nti/core/constants/constantcolors.dart';
import 'package:flutter_graduation_nti/core/constants/widgets/custom_textfield.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController nameController =
      TextEditingController(text: "Mai Goda");
  final TextEditingController emailController =
      TextEditingController(text: "mai@gmail.com");
  final TextEditingController phoneController =
      TextEditingController(text: "01000000000");

  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Dark overlay
          Container(
            color: Colors.black.withOpacity(0.25),
          ),

          // Content
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 10),

                  // Edit Button
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(
                        isEditing ? Icons.close : Icons.edit,
                        color: Colors.white,
                        size: 28,
                      ),
                      onPressed: () {
                        setState(() {
                          isEditing = !isEditing;
                        });
                      },
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Profile Image
                  const CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 52,
                      backgroundImage: NetworkImage(
                        "https://i.pinimg.com/736x/58/e2/61/58e2613e9ae08e4b5a5d3791418464c1.jpg",
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Name
                  Mytextfield(
                    controller: nameController,
                    hinttttext: AppLocalizations.of(context)!.name,
                    ispassword: false,
                    textInputTypee: TextInputType.name,
                    enabled: isEditing,
                  ),

                  const SizedBox(height: 16),

                  // Email
                  Mytextfield(
                    controller: emailController,
                    hinttttext: AppLocalizations.of(context)!.email,
                    ispassword: false,
                    textInputTypee: TextInputType.emailAddress,
                    enabled: isEditing,
                  ),

                  const SizedBox(height: 16),

                  // Phone
                  Mytextfield(
                    controller: phoneController,
                    hinttttext: AppLocalizations.of(context)!.phone,
                    ispassword: false,
                    textInputTypee: TextInputType.phone,
                    enabled: isEditing,
                  ),

                  const SizedBox(height: 30),

                  // Save Button (يظهر بس وقت التعديل)
                  if (isEditing)
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: BtN,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            isEditing = false;
                          });

                          // مؤقتًا
                          print(nameController.text);
                          print(emailController.text);
                          print(phoneController.text);
                        },
                        child: Text(
                          AppLocalizations.of(context)!.save,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
}
