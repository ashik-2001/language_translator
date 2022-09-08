import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:language_translator/apiCalls/get_languages.dart';
import 'package:language_translator/logic/logics.dart';
import 'package:provider/provider.dart';

class BottomPopup extends StatefulWidget {
  final current;
  const BottomPopup({this.current});

  @override
  State<BottomPopup> createState() => _BottomPopupState();
}

class _BottomPopupState extends State<BottomPopup> {
  late List lang = [
    {'language': 'loading...'}
  ];

  @override
  initState() {
    super.initState();
    setToLang();
    // Add listeners to this class
  }

  void setToLang() async {
    List languages = await getLanguages();
    setState(() {
      lang = languages;
    });
  }

  @override
  Widget build(BuildContext context) {
    // getLanguages();
    // print(lang);

    return Container(
      height: 400,
      color: Colors.black45,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              '${widget.current}',
              style: TextStyle(color: Colors.grey),
            ),
            const Text(
              'All Languages',
              style: TextStyle(color: Colors.grey),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    
                    if (LocaleNames.of(context)!
                            .nameOf('${lang[index]['language']}')
                            .toString() ==
                        'null') {
                      return _listLanguages('${lang[index]['language']}');
                      // return Text('${lang[index]['language']}');
                    }
                    return _listLanguages(LocaleNames.of(context)!
                        .nameOf('${lang[index]['language']}')
                        .toString());
                    // return Text(LocaleNames.of(context)!.nameOf('${lang[index]['language']}').toString());
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                        height: 10,
                      ),
                  itemCount: lang.length),
            ))
          ],
        ),
      ),
    );
  }

  Widget _listLanguages(value) {
    return ListTile(
      title: Text(value),
      tileColor: Colors.black,
      onTap: () {
        print(widget.current);
        if (widget.current == 'From') {
          Provider.of<ChangeLanguage>(context, listen: false)
              .changeFlanguage(value);
        } else {
          Provider.of<ChangeLanguage>(context, listen: false)
              .changeTlanguage(value);
        }
      },
    );
  }
}
