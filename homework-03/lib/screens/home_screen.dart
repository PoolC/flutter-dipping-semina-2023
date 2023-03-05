import 'package:ff/models/openai_model.dart';
import 'package:ff/services/openai_api_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _textEditingController;
  late String movieTitle;
  bool _isEnter = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _textEditingController.dispose();
  }

  void validateEnter() {
    final FormState? formState = _formKey.currentState;
    // null check 하세요.
    if (formState!.validate()) {
      setState(() {
        _isEnter = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Convert Movie to Emoji',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: SizedBox(
                  width: 280,
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: _textEditingController,
                      keyboardType: TextInputType.text,
                      decoration:
                          const InputDecoration(hintText: 'Enter Movie Title'),
                      validator: (val) {
                        if (val!.trim().isEmpty) {
                          return 'Please Enter Movie Title';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ),
              buildOutlinedButton(),
              const SizedBox(height: 20,),
              _isEnter ? buildFutureBuilder() : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }

  FutureBuilder<OpenAIModel> buildFutureBuilder() {
    return FutureBuilder<OpenAIModel>(
        future: OpenAIAPIService.postPrompt(prompt: movieTitle),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Text('${snapshot.data.text}', style: const TextStyle(fontSize: 25),);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const SizedBox(
            child: CircularProgressIndicator(),
            width: 30,
            height: 30,
          );
        });
  }

  OutlinedButton buildOutlinedButton() {
    return OutlinedButton(
        onPressed: () {
          validateEnter();
          movieTitle = _textEditingController.text;
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              'Convert',
              style: TextStyle(
                fontSize: 17,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Icon(
              Icons.arrow_forward_rounded,
              size: 25,
              color: Colors.black,
            )
          ],
        ));
  }
}
