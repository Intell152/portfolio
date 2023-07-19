import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

// ignore: use_key_in_widget_constructors
class ContactMeWidget extends StatefulWidget {
  // const ContactMeWidget({Key? key}) : super(key: key);

  @override
  State<ContactMeWidget> createState() => _ContactMeWidgetState();
}

class _ContactMeWidgetState extends State<ContactMeWidget> {
  late List<FocusNode> _focusNodes;
  late String _email;
  late String _comment;
  late bool _isLoading;

  @override
  void initState() {
    _focusNodes = List.generate(2, (index) => FocusNode());
    _isLoading = false;
    _email = '';
    _comment = '';
    super.initState();
  }

  @override
  void dispose() {
    _focusNodes.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: SizedBox(
        height: 350,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Contact Me ->',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            _emailInput(),
            _commentImput(),
            Align(
              alignment: Alignment.bottomRight,
              child: _sendButton(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _emailInput() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 15, bottom: 25),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        cursorColor: Colors.white,
        focusNode: _focusNodes[0],
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
          hintText: 'Email',
          labelText: 'Email',
          focusColor: Colors.white,
          labelStyle: const TextStyle(color: Colors.white),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(5.0),
          ),
          prefixIcon: Icon(
            Icons.alternate_email,
            color: _focusNodes[0].hasFocus ? Colors.white : Colors.white54,
          ),
        ),
        onTapOutside: (event) => setState(() {
          _focusNodes[0].unfocus();
        }),
        onChanged: (valor) => setState(
          () {
            _email = valor;
          },
        ),
      ),
    );
  }

  Widget _commentImput() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: TextField(
          keyboardType: TextInputType.multiline,
          maxLines: null,
          expands: true,
          focusNode: _focusNodes[1],
          cursorColor: Colors.white,
          textAlignVertical: TextAlignVertical.top,
          decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(5.0),
            ),
            focusColor: Colors.white,
            labelStyle: const TextStyle(color: Colors.white),
            prefixIcon: Icon(
              Icons.comment,
              color: _focusNodes[1].hasFocus
                  ? Colors.white
                  : Colors.white54, // Cambia el color del prefixIcon
            ),
            hintText: 'Comments',
            labelText: 'Comment',
            helperText: 'Enter your message here',
          ),
          onTapOutside: (event) => setState(() {
            _focusNodes[1].unfocus();
          }),
          onChanged: (valor) => setState(
            () {
              _comment = valor;
            },
          ),
        ),
      ),
    );
  }

  Widget _sendButton() {
    return FloatingActionButton.extended(
      // label: const Text('Send', style: TextStyle(color: Colors.white)),
      label: _isLoading ? const Text('Sending...') : const Text('Send'),
      backgroundColor: _isLoading ? Colors.white70 : Colors.grey.shade700,
      hoverColor: Colors.white70,
      icon: _isLoading
          ? const CircularProgressIndicator(
              color: Colors.black87,
              strokeWidth: 10.0,
            )
          : const Icon(Icons.arrow_forward_outlined),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      // onPressed: () async => _isLoading ? null : _sendEmail(),
      onPressed: () async =>
          _isLoading ? null : _validateForm(_email, _comment),
    );
  }

  void _sendEmail() async {
    setState(() {
      _isLoading = true;
    });
    const url = 'http://************/send';
    const key = '*********************************';
    dynamic payload = {
      'acount': '*********@hotmail.com',
      'sendTime': DateTime.now().toString(),
    };
    final jwt = JWT(
      payload,
      issuer: 'Mi portfolio URL',
    );
    final token = jwt.sign(SecretKey(key));

    final dio = Dio();
    dynamic response;
    try {
      response = await dio.post(
        url,
        data: {"dir": _email, "content": _comment},
        options: Options(
          headers: {'x-token': token},
        ),
      );
    } catch (e) {
      _showAlertDialog('Oops', 'something went wrong.');

      setState(() {
        _isLoading = false;
      });
    }
    response.statusCode == 200
        ? _showAlertDialog('E-mail sent', 'The e-mail was sent successfully.')
        : _showAlertDialog('Oops2', 'something went wrong.');

    setState(() {
      _isLoading = false;
    });
  }

  void _validateForm(String? email, String? comment) {
    final emailRegex = RegExp(
        r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');
    final commentRegex = RegExp(r'^[a-zA-Z0-9,.?! ]+$');

    if (email == null || email.isEmpty) {
      _showAlertDialog('Obligatory field', 'The e-mail field must be filled');
    } else if (!emailRegex.hasMatch(email)) {
      _showAlertDialog('Wrong e-mail', 'Please enter a valid e-mail');
    } else {
      !commentRegex.hasMatch(comment!)
          ? _showAlertDialog('Wrong text', 'Please avoid special characters.')
          : _sendEmail();
    }
  }

  void _showAlertDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Close',
                style: TextStyle(color: Colors.white70),
              ),
            ),
          ],
        );
      },
    );
  }
}
