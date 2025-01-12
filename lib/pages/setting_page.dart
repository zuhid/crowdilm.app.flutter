import 'dart:async';
import 'package:crowdilm/controls/my_button.dart';
import 'package:crowdilm/controls/my_dropdown.dart';
import 'package:crowdilm/controls/my_dropdown_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../main.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  Map<String, String> settings = {
    'quran1': 'en.sahih',
    'quran2': 'simple',
  };

  static Future<List<MyDropdownItem>> get qurans async {
    return (await crowdilmController.getQurans())
        .map<MyDropdownItem>((quran) => MyDropdownItem(quran.id, '${quran.language} - ${quran.name}'))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Setting")),
      body: ListView(children: [
        MyDropdown(
          label: 'Quran 1',
          futureData: qurans,
          onChanged: (value) => settings["quran1"] = value,
        ),
        MyDropdown(
          label: 'Quran 2',
          futureData: qurans,
          onChanged: (value) => settings["quran2"] = value,
        ),
        MyButton('Save', () async {
          crowdilmController.saveSettings(settings);
          var quran = settings["quran1"];
          await crowdilmController.getQuranLines(quran!);
          quran = settings["quran2"];
          await crowdilmController.getQuranLines(quran!);
          if (context.mounted) {
            context.go('/quran');
          }
        }),
      ]),
    );
  }
}
