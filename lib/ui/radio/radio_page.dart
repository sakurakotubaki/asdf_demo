import 'package:flutter/material.dart';

enum SingingCharacter { men, women }

class RadioPage extends StatefulWidget {
  const RadioPage({super.key});

  static const menRadioKey = Key('men_radio');
  static const womenRadioKey = Key('women_radio');
  static const selectedTextKey = Key('selected_radio_text');

  @override
  State<RadioPage> createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> {
  SingingCharacter? _character = SingingCharacter.men;

  String get _selectedLabel {
    return switch (_character) {
      SingingCharacter.men => '男性',
      SingingCharacter.women => '女性',
      null => '未選択',
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RadioGroup<SingingCharacter>(
          groupValue: _character,
          onChanged: (SingingCharacter? value) {
            setState(() {
              _character = value;
            });
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                title: Text('男性'),
                leading: Radio<SingingCharacter>(
                  key: RadioPage.menRadioKey,
                  value: SingingCharacter.men,
                ),
              ),
              const ListTile(
                title: Text('女性'),
                leading: Radio<SingingCharacter>(
                  key: RadioPage.womenRadioKey,
                  value: SingingCharacter.women,
                ),
              ),
              Text('選択中: $_selectedLabel', key: RadioPage.selectedTextKey),
            ],
          ),
        ),
      ),
    );
  }
}
