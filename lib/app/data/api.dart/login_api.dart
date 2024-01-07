import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:mac_task/app/common_views/show_toast.dart';

Future<bool?> loginAPI(
    {required String username, required String password}) async {
  Uri url = Uri.parse('https://apiv2stg.promilo.com/user/oauth/token');

  Map<String, String> body = <String, String>{
    'username': username,
    'password': password,
    'grant_type': 'password'
  };
  print('login api ~ url ~ $url');

  var clients = http.Client();

  print('login api ~ body ~ $body');

  try {
    var requestBody = {
      'username': username,
      'password': password,
      'grant_type': 'password',
    };

    http.Response response = await http.post(url,
        body: requestBody,
        headers: {'Authorization': 'Basic UHJvbWlsbzpxNCE1NkBaeSN4MiRHQg=='});

    print('login api ~ status code ~ ${response.statusCode}');
    print('login api ~ response body ~ ${response.request}');

    final decodedRes = jsonDecode(response.body);

    print(response.body);

    if (response.statusCode == 200) {
      showToast(message: 'Login successfully');
      return true;
    }
    showToast(message: 'Invalid Login Id or Password');

    return null;
  } on PlatformException catch (e) {
    print('login api ~ platform exception ~ $e');

    return null;
  } on SocketException {
    showToast(message: 'Check Your Internet Connection');
    return null;
  } on http.ClientException catch (e) {
    print('login api ~ client exception ~ $e');
    return null;
  } catch (e) {
    return null;
  } finally {
    clients.close();
  }
}
