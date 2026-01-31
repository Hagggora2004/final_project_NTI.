import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_graduation_nti/core/constants/widgets/providers/theme_provider.dart';
import 'package:flutter_graduation_nti/core/constants/constantcolors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_graduation_nti/core/constants/widgets/providers/locale_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: BtN,
        title: Text(
          t.settings,
          style: const TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            //  Dark Mode .
            SwitchListTile(
              title: Text(
                t.darkMode,
                style:
                    const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              value: context.watch<ThemeProvider>().isDark,
              onChanged: (value) {
                context.read<ThemeProvider>().SwitchTheme(value);
              },
            ),

            const SizedBox(height: 20),

            // Language Dropdown.
            ListTile(
              title: Text(
                t.language,
                style:
                    const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              trailing: DropdownButton<Locale>(
                value: context.watch<LocaleProvider>().locale,
                items: const [
                  DropdownMenuItem(
                    value: Locale('en'),
                    child: Text('English'),
                  ),
                  DropdownMenuItem(
                    value: Locale('ar'),
                    child: Text('العربية'),
                  ),
                ],
                onChanged: (newLocale) {
                  if (newLocale != null) {
                    context.read<LocaleProvider>().setLocale(newLocale);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
