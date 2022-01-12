import 'package:flutter/material.dart';
import 'package:flutter_filter_dialog/flutter_filter_dialog.dart';
import '../choices.dart' as choices;

class FeaturesMultiSheet extends StatefulWidget {
  @override
  _FeaturesMultiSheetState createState() => _FeaturesMultiSheetState();
}

class _FeaturesMultiSheetState extends State<FeaturesMultiSheet> {
  List<String>? _os = ['and', 'tux'];
  List<String>? _os_new = ['win'];
  List<String>? _hero = ['bat', 'spi'];

  @override
  Widget build(BuildContext context) {
    SmartSelect<String> v;
    return Column(
      children: <Widget>[
        const SizedBox(height: 7),
        v = SmartSelect<String>.multiple(
          title: 'OS',
          selectedValue: _os,
          onChange: (selected) => setState(() => _os = selected?.value),
          choiceItems: choices.os,
          modalType: S2ModalType.bottomSheet,
          tileBuilder: (context, state) {
            return S2Tile.fromState(
              state,
              isTwoLine: true,
              leading: const CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://source.unsplash.com/xsGxhtAsfSA/100x100',
                ),
              ),
            );
          },
        ),
        InkWell(onTap: (){
          v.multiOnRefresh!(_os_new!);
          v.multiRefresh(_os_new!);
        },
            child: const Divider(indent: 20)),
        SmartSelect<String>.multiple(
          title: 'Super Hero',
          selectedValue: _hero,
          onChange: (selected) => setState(() => _hero = selected?.value),
          choiceItems: choices.heroes,
          modalType: S2ModalType.bottomSheet,
          tileBuilder: (context, state) {
            return S2Tile.fromState(
              state,
              isTwoLine: true,
              leading: const CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://source.unsplash.com/8I-ht65iRww/100x100',
                ),
              ),
            );
          },
        ),
        Container(height: 7),
      ],
    );
  }
}