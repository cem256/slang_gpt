import 'package:example/l10n/strings.g.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          Translations.of(context).app_title,
        ),
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _LocaleSelector(),
            const SizedBox(
              height: 24,
            ),
            Text(
              Translations.of(context).intro_title,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              Translations.of(context).intro_description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              Translations.of(context).highlight_title,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              Translations.of(context).highlight_description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}

class _LocaleSelector extends StatelessWidget {
  const _LocaleSelector();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: AppLocale.values
                  .map(
                    (locale) => Padding(
                      padding: const EdgeInsetsDirectional.only(end: 4),
                      child: ChoiceChip(
                        padding: const EdgeInsetsDirectional.all(4),
                        label: Text(Translations.of(context).locales[locale.languageCode]!),
                        selected: LocaleSettings.currentLocale == locale,
                        onSelected: (selected) => selected ? LocaleSettings.setLocale(locale) : null,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
