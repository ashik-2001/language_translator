import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class PostLanguage {
  Future createSentLanguage(String translation) async {
    var dio = Dio();
    final response = await dio.request(
      'https://google-translate1.p.rapidapi.com/language/translate/v2',
      data: {
        'source': 'en',
        'target': 'ml',
        'q': 'hello world',
      },
      options: Options(method: 'POST', headers: {
        "content-type": "application/x-www-form-urlencoded",
        "Accept-Encoding": "application/gzip",
        "X-RapidAPI-Key": "04c3c53805mshe5ba099bc8c0107p1da850jsnaacea637bbac",
        "X-RapidAPI-Host": "google-translate1.p.rapidapi.com",
      }),
    );
    print(response);
  }
}





// class PostLanguage {
//   static const Map<String, String> _headers = {
//     "content-type": "application/x-www-form-urlencoded",
//     "Accept-Encoding": "application/gzip",
//     "X-RapidAPI-Key": "04c3c53805mshe5ba099bc8c0107p1da850jsnaacea637bbac",
//     "X-RapidAPI-Host": "google-translate1.p.rapidapi.com",
//   };

//   Future createSentLanguage(String translation) async {
//     final response = await http.post(
//       Uri.parse(
//           'https://google-translate1.p.rapidapi.com/language/translate/v2'),
//        headers: _headers,//{
//       //   'content-type':'application/x-www-form-urlencoded',
//       //   'Accept-Encoding': 'application/gzip',
//       //   'X-RapidAPI-Key': '04c3c53805mshe5ba099bc8c0107p1da850jsnaacea637bbac',
//       //   'X-RapidAPI-Host': 'google-translate1.p.rapidapi.com',
//       // },
//       encoding: Encoding.getByName('utf-8'),
//       body: {
//         'source': 'en',
//         'target': 'ml',
//         'q': 'hello world',
//       },
//     );

//     if (response.statusCode == 200) {
//       // If the server did return a 201 CREATED response,
//       // then parse the JSON.
//       print('response.body');
//       return (jsonDecode(response.body));
//     } else {
//       // If the server did not return a 201 CREATED response,
//       // then throw an exception.
//       print(response.body);
//       throw Exception('Failed to create album.');
//     }
//   }
// }



// class SentLanguage {
//   final String translation;

//   const SentLanguage({required this.translation});

//   factory SentLanguage.fromJson(Map<String, dynamic> json) {
//     return SentLanguage(
//       translation: json['data']['translations'],
//     );
//   }
// }
