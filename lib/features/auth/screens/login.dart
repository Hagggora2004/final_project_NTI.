import 'package:flutter/material.dart';
import 'package:flutter_graduation_nti/features/home/screens/main_layout.dart';
import 'package:flutter_graduation_nti/features/auth/screens/register.dart';
import 'package:flutter_graduation_nti/core/constants/constantcolors.dart';
import 'package:flutter_graduation_nti/core/constants/widgets/custom_textfield.dart';
import 'package:flutter_graduation_nti/features/auth/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

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
            Container(
              color: Colors.black.withOpacity(0.3),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(33.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 33),

                      Mytextfield(
                        controller: emailController,
                        textInputTypee: TextInputType.emailAddress,
                        ispassword: false,
                        hinttttext: l10n.enterEmail,
                      ),

                      const SizedBox(height: 33),

                      Mytextfield(
                        controller: passwordController,
                        textInputTypee: TextInputType.text,
                        ispassword: true,
                        hinttttext: l10n.enterPassword,
                      ),

                      const SizedBox(height: 33),

                      /// Sign in
                      ElevatedButton(
                        onPressed: () async {
                          try {
                            final auth = context.read<AuthProvider>();
                            await auth.login(
                              emailController.text.trim(),
                              passwordController.text.trim(),
                            );

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => MainLayout(),
                              ),
                            );
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(l10n.error),
                              ),
                            );
                          }
                        },
                        child: Text(
                          l10n.signIn,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(BtN),
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.all(12),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            l10n.noAccount,
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
                                  builder: (_) => Register(),
                                ),
                              );
                            },
                            child: Text(
                              l10n.register,
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
