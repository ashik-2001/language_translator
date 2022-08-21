import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/widgets.dart';
import 'package:language_translator/apiCalls/get_languages.dart';
import 'package:language_translator/bottom_popup.dart';
import 'package:language_translator/logic/logics.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ChangeLanguage(),
        )
      ],
      child: MaterialApp(
        title: 'Adaptive Music App',
        theme: ThemeData(
          // Use the green theme for Material widgets.
          primarySwatch: Colors.green,
        ),
        darkTheme: ThemeData.dark(),
        localizationsDelegates: [
          LocaleNamesLocalizationsDelegate(),
          // ... more localization delegates
        ],
        home: const HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String fromLang = 'Select Lang';
  String toLang = 'Select Lang';


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Text(
                  'Text Translation',
                  style: GoogleFonts.roboto(fontSize: 20),
                ),
              ),
              const Divider(
                color: Colors.grey,
              ),
              _languageSelectors(context),
              _translateFrom(),
              _translateTo(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _translateTo() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Translate To',
                  style: TextStyle(color: Colors.grey),
                ),
                Text('(German)'),
              ],
            ),
            TextField(),
          ],
        ),
      ),
    );
  }

  Widget _translateFrom() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Translate From',
                  style: TextStyle(color: Colors.grey),
                ),
                Text('(German)'),
              ],
            ),
            TextField(),
          ],
        ),
      ),
    );
  }

  Widget _languageSelectors(context) {
    var fromLanguage = Provider.of<ChangeLanguage>(context).fromLanguage;
    var toLanguage = Provider.of<ChangeLanguage>(context).toLanguage;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(fromLanguage),
            ),
          ),
          onTap: () {
            showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return BottomPopup(current: 'From');
                });
          },
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.compare_arrows)),
        InkWell(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [Text(toLanguage)],
              ),
            ),
          ),
          onTap: () {
            // print(LocaleNames.of(context)!.nameOf('zh').toString());
            // var lang = getLanguages();

            showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return BottomPopup(current: 'To');
                });
          },
        ),
      ],
    );
  }
}
