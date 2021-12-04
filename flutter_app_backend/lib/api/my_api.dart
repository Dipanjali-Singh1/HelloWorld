import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class CallApi {
  final String _url = 'http://192.168.46.251/api/';
  final String _imgUrl = 'http://192.168.46.251/uploads/';
  // final String _url = 'http://192.168.43.118:3000/api/';
  // final String _imgUrl = 'http://192.168.43.118:3000/uploads/';
  getImage() {
    return _imgUrl;
  }

//postData-> posts data to the server.
  postData(data, apiUrl) async {
    var fullUrl = _url + apiUrl + await _getToken();
    return await http.post(Uri.parse(fullUrl),
        body: jsonEncode(data), headers: _setHeaders());
  }
 postTData(data, apiUrl) async {
   var fullUrl = _url+apiUrl;
   return await http.post(Uri.parse(fullUrl),
   body: jsonEncode(data), 
   headers: _setHeaders(),);
 }  
  //remedialmodule
  /*reading type=11
  writing type 12
  work ready skills type 13
  referencing type 14
   */

  getData(apiUrl) async {
    var fullUrl = _url + apiUrl + await _getToken();
    return await http.get(Uri.parse(fullUrl), headers: _setHeaders());
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    return '?token=$token';
  }

  getArticles(apiUrl) async {}
  getHomes(apiUrl) async {}
  getNews(apiUrl) async {}
  getRemedial(apiUrl) async {}
  getPublicData(apiUrl) async {
    http.Response response = await http.get(Uri.parse(_url + apiUrl));
    try {
      if (response.statusCode == 200) {
        return response;
      } else {
        return 'failed';
      }
    } catch (e) {
      print(e);
      return 'failed';
    }
  }
}
