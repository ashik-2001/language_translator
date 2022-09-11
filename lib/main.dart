import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:language_translator/bottom_popup.dart';
import 'package:language_translator/logic/logics.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:language_translator/apiCalls/post_languages.dart';

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
        ),
        ChangeNotifierProvider(
          create: (context) => ChangePostLanguage(),
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
  var fromLanguage;
  var toLanguage;
  final fromLanguageController = TextEditingController();
  final toLanguageController = TextEditingController();
  // Future<SentLanguage>? _futureSentLanguage;


  @override
  void initState() {
    super.initState();
    fromLanguageController.addListener(_fromLanguageValue);
  }

  @override
  void dispose() {
    fromLanguageController.dispose();
    super.dispose();
  }

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
                const Text(
                  'Translate From',
                  style: TextStyle(color: Colors.grey),
                ),
                Text('($fromLanguage)'),
              ],
            ),
            TextField(
              controller: fromLanguageController,
            ),
          ],
        ),
      ),
    );
  }

  Future _fromLanguageValue() async {
    // toLanguageController.text = fromLanguageController.text;
    var source = Provider.of<ChangePostLanguage>(context,listen: false).sourceLanguage;
    var target = Provider.of<ChangePostLanguage>(context,listen: false).targetLanguage;
    PostLanguage postLan = PostLanguage();
    toLanguageController.text = await postLan.createSentLanguage(fromLanguageController.text.toString(), source, target);
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
                const Text(
                  'Translate To',
                  style: TextStyle(color: Colors.grey),
                ),
                Text('($toLanguage)'),
              ],
            ),
            TextField(
              controller: toLanguageController,
            ),
          ],
        ),
      ),
    );
  }

  Widget _languageSelectors(context) {
    fromLanguage = Provider.of<ChangeLanguage>(context).fromLanguage;
    toLanguage = Provider.of<ChangeLanguage>(context).toLanguage;
    var temp;

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
        IconButton(
            onPressed: () {
              temp = fromLanguage;
              Provider.of<ChangeLanguage>(context, listen: false)
                  .changeFlanguage(toLanguage);
              Provider.of<ChangeLanguage>(context, listen: false)
                  .changeTlanguage(temp);
            },
            icon: Icon(Icons.compare_arrows)),
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
