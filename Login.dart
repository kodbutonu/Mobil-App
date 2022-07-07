import 'dart:ui';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sport/HomePage.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController controller = TextEditingController();
  bool _isObscure = true;
  bool success = false;
  String email = '';
  String password = '';
  String dropdownvalue = 'Erkek';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // List of items in our dropdown menu
  var items = [
    'Erkek',
    'Kadın',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: [
          _image(context),
          _textField(context),
          _dropdownbutton(context),
          _buton(context),
          _text1(context),
        ]),
      ),
    );
  }

  Widget _image(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 1,
      width: MediaQuery.of(context).size.width * 1,
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5), BlendMode.dstATop),
          image: AssetImage('assets/engelli.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)),
        ),
      ),
    );
  }

  Widget _textField(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Container(
        margin: EdgeInsets.only(top: 200, left: 50, right: 50),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 2.0),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
                fillColor: Colors.grey,
                focusColor: Colors.grey,
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.blue,
                ),
                labelText: "Isim",
                labelStyle: GoogleFonts.aladin(
                  fontStyle: FontStyle.italic,
                  color: Colors.blue,
                  fontSize: 20,
                ),
                hintText: "Isminizi giriniz.",
                hintStyle: GoogleFonts.aladin(
                  fontStyle: FontStyle.italic,
                  color: Colors.blue,
                  fontSize: 20,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue, width: 2.0),
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
              validator: (value) {
                if (value != null && value.length < 7) {
                  return 'Lütfen en az 7 karakter giriniz.';
                } else
                  null;
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.blue,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.white, width: 2.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  labelText: "Email",
                  labelStyle: GoogleFonts.aladin(
                    fontStyle: FontStyle.italic,
                    color: Colors.blue,
                    fontSize: 20,
                  ),
                  fillColor: Colors.white,
                  hintText: "Mail adresini giriniz.",
                  hintStyle: GoogleFonts.aladin(
                    fontStyle: FontStyle.italic,
                    color: Colors.blue,
                    fontSize: 20,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.blue, width: 2.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue))),
              validator: (email) =>
                  email != null && !EmailValidator.validate(email)
                      ? 'E mail giriniz.'
                      : null,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              obscureText: _isObscure,
              decoration: InputDecoration(
                  hintStyle: GoogleFonts.aladin(
                    fontStyle: FontStyle.italic,
                    color: Colors.blue,
                    fontSize: 20,
                  ),
                  labelStyle: GoogleFonts.aladin(
                    fontStyle: FontStyle.italic,
                    color: Colors.blue,
                    fontSize: 20,
                  ),
                  labelText: 'Password',
                  suffixIcon: IconButton(
                      icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      })),
              validator: (value) {
                if (value != null && value.length < 7) {
                  return 'Lütfen en az 7 karakter giriniz.';
                } else
                  null;
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _dropdownbutton(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 450, left: 50, right: 50),
      child: Column(children: [
        DropdownButton(
          // Initial Value
          value: dropdownvalue,
          iconEnabledColor: Colors.blue,
          isExpanded: true,
          // Down Arrow Icon
          icon: const Icon(Icons.keyboard_arrow_down),
          style: GoogleFonts.aladin(
            fontStyle: FontStyle.italic,
            color: Colors.blue,
            fontSize: 20,
          ),
          // Array list of items
          items: items.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items),
            );
          }).toList(),
          // After selecting the desired option,it will
          // change button value to selected value
          onChanged: (String? newValue) {
            setState(() {
              dropdownvalue = newValue!;
            });
          },
        ),
        DropdownButton(
          value: dropdownvalue,
          iconEnabledColor: Colors.blue,
          isExpanded: true,
          // Down Arrow Icon
          icon: const Icon(Icons.keyboard_arrow_down),
          style: GoogleFonts.aladin(
            fontStyle: FontStyle.italic,
            color: Colors.blue,
            fontSize: 20,
          ),
          // Array list of items
          items: items.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items),
            );
          }).toList(),
          // After selecting the desired option,it will
          // change button value to selected value
          onChanged: (String? newValue) {
            setState(() {
              dropdownvalue = newValue!;
            });
          },
        )
      ]),
    );
  }

  Widget _text1(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 550, right: 140, left: 140),
      child: ElevatedButton(
        onPressed: (() => Navigator.push(
            context, MaterialPageRoute(builder: (context) => Anasayfa()))),
        child: Text(
          'Hesabı oluştur',
          style: TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(primary: Colors.blue),
      ),
    );
  }

  Widget _buton(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 600, right: 50, left: 50),
      child: Row(children: [
        ElevatedButton(
          onPressed: (() => Navigator.push(
              context, MaterialPageRoute(builder: (context) => Anasayfa()))),
          child: Text(
            'Giriş Yap',
            style: TextStyle(color: Colors.blue),
          ),
          style: ElevatedButton.styleFrom(primary: Colors.white),
        ),
        SizedBox(
          width: 120,
        ),
        TextButton(
            onPressed: (() => Navigator.push(
                context, MaterialPageRoute(builder: (context) => Anasayfa()))),
            child: Text(
              'Hesabım var',
              style: GoogleFonts.aladin(
                fontStyle: FontStyle.italic,
                color: Colors.blue,
                fontSize: 20,
                decoration: TextDecoration.underline,
              ),
            )),
      ]),
    );
  }
}
