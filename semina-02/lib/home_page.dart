import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  String _name = '';
  String _email = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController;
    _emailController;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Flutter Dipping'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ), // Sizedbox 여백을 줄 때도 사용될 수 있음.
                const Text('Profile Image'),
                Text('Name : $_name'),
                Text('Email: $_email'),
                SizedBox(
                    height: size.height * .45,
                    width: size.width * .5,
                    child: Image.network(
                        'https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187_square.jpg')),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text('Change Name: '),
                      SizedBox(width: size.width*.5, child: TextField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder()
                        ),
                        keyboardType: TextInputType.text
                      )),
                      ElevatedButton(onPressed: (){
                        setState(() {
                          _name = _nameController.text;
                        });
                      }, child: const Text('Click'))
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Change Email: '),
                    SizedBox(width: size.width*.5, child: TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder()
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),),
                    ElevatedButton(onPressed: (){
                      setState(() {
                        _email = _emailController.text;
                      });
                    }, child: const Text('Click'))
                  ],
                )
              ],
            ),
          )),
    );
  }
}
