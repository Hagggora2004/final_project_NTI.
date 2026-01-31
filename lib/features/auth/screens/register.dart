import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_graduation_nti/features/auth/screens/login.dart';
import 'package:flutter_graduation_nti/core/constants/constantcolors.dart';
import 'package:flutter_graduation_nti/core/constants/widgets/custom_textfield.dart';

class Register extends StatelessWidget {
  Register({super.key});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/assets/images/background.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(color: Colors.black.withOpacity(0.3)),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(33.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 64),
                      Mytextfield(
                        controller: usernameController,
                        textInputTypee: TextInputType.text,
                        ispassword: false,
                        hinttttext: t.enterUsername,
                      ),
                      const SizedBox(height: 33),
                      Mytextfield(
                        controller: emailController,
                        textInputTypee: TextInputType.emailAddress,
                        ispassword: false,
                        hinttttext: t.enterEmail,
                      ),
                      const SizedBox(height: 33),
                      Mytextfield(
                        controller: passwordController,
                        textInputTypee: TextInputType.text,
                        ispassword: true,
                        hinttttext: t.enterPassword,
                      ),
                      const SizedBox(height: 33),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(BtN),
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.all(12),
                          ),
                        ),
                        child: Text(
                          t.register,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            t.noAccount,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Login(),
                                ),
                              );
                            },
                            child: Text(
                              t.signIn,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
