class OpenAIModel {
  final String text;

  OpenAIModel({required this.text});

  factory OpenAIModel.fromJson(Map<String, dynamic> json){
    return OpenAIModel(text: json['choices'][0]['text']);
  }
}