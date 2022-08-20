import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

Future getLanguages() async {
  final response = await http
      .get(Uri.parse('https://google-translate1.p.rapidapi.com/language/translate/v2/languages'),
      headers: {
      'Accept-Encoding': 'application/gzip',
      'X-RapidAPI-Key': '04c3c53805mshe5ba099bc8c0107p1da850jsnaacea637bbac',
      'X-RapidAPI-Host': 'google-translate1.p.rapidapi.com',
  },
      );

  if (response.statusCode == 200) {
    // print(jsonDecode(response.body)['data']['languages'][0]);
    return (jsonDecode(response.body)['data']['languages']);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load data');
  }
}