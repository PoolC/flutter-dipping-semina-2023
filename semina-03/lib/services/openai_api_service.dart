import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:movie2emoji/constants.dart';
import 'package:movie2emoji/models/openai_model.dart';

class OpenAIAPIService {
  static Future<OpenAIModel> postPrompt({@required prompt, maxTokens = 60}) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $API_KEY'
    };

    var body = {
      "model": "text-davinci-003",
      "prompt": "Convert movie titles into emoji. \n\nBack to the Future: 👨👴🚗🕒 \nBatman: 🤵🦇 \nTransformers: 🚗🤖 \n $prompt: ",
      "temperature": 0.8,
      "max_tokens": maxTokens,
      "top_p": 1.0,
      "frequency_penalty": 0.0,
      "presence_penalty": 0.0,
      "stop": ["\n"]
    };

    try {
      var response = await http.post(Uri.parse(URI_BASE + '/completions'),
          headers: headers, body: jsonEncode(body));
      var responseBody = jsonDecode(utf8.decode(response.bodyBytes));
      return OpenAIModel.fromJson(responseBody);
    } catch (e) {
      throw Exception(e);
    }
  }
}
