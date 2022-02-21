import 'package:flutter/material.dart';
import 'package:giaodien/constant.dart';
import 'package:giaodien/models/api_response.dart';
import 'package:giaodien/models/user.dart';
import 'package:giaodien/screen/Register_screen.dart';
import 'package:giaodien/home_pagebottomappbar.dart';
import 'package:giaodien/screen/home_screen.dart';
import 'package:giaodien/screen/user_information_screen.dart';
import 'package:giaodien/services/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController txtmail = new TextEditingController();
  TextEditingController txtpass = new TextEditingController();

  bool loading = false;
  void _loginUser() async {
    ApiResponse response = await login(txtmail.text, txtpass.text);
    if (response.error == null) {
      _saveAndRedirectToHome(response.data as User);
    } else {
      setState(() {
        loading = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
    }
  }

  void _saveAndRedirectToHome(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('token', user.token ?? '');
    await pref.setInt('userId', user.id ?? 0);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
  }

  void _showPassClick() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  // Widget _backButton() {
  //   return InkWell(
  //     onTap: () {
  //       Navigator.pop(context);
  //     },
  //     child: Container(
  //       padding: EdgeInsets.symmetric(horizontal: 10),
  //       child: Row(
  //         children: <Widget>[
  //           Container(
  //             padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
  //             child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
  //           ),
  //           Text('Back',
  //               style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // Widget _entryFieldEmail() {
  //   return Container(
  //     margin: EdgeInsets.symmetric(vertical: 10),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: <Widget>[
  //         Text(
  //           'Email',
  //           style: TextStyle(
  //               color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
  //         ),
  //         SizedBox(
  //           height: 10,
  //         ),
  //         TextField(
  //             controller: txtmail,
  //             style: TextStyle(color: Colors.black),
  //             decoration: InputDecoration(
  //                 errorText: _mailInvalid ? _mailErr : null,
  //                 border: InputBorder.none,
  //                 fillColor: Color(0xfff3f3f4),
  //                 filled: true))
  //       ],
  //     ),
  //   );
  // }

  // Widget _entryFieldPassword() {
  //   return Container(
  //     margin: EdgeInsets.symmetric(vertical: 10),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.stretch,
  //       children: <Widget>[
  //         Text(
  //           'Password',
  //           style: TextStyle(
  //               color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
  //         ),
  //         SizedBox(
  //           height: 10,
  //         ),
  //         TextField(
  //             controller: txtpass,
  //             style: TextStyle(color: Colors.black),
  //             obscureText: !_showPass,
  //             decoration: InputDecoration(
  //                 errorText: _passInvalid ? _passErr : null,
  //                 suffixIcon: Padding(
  //                   padding: EdgeInsets.all(0.0),
  //                   child: IconButton(
  //                     onPressed: _showPassClick,
  //                     icon: Icon(
  //                       _showPass ? Icons.visibility : Icons.visibility_off,
  //                       color: Colors.grey,
  //                     ),
  //                   ),
  //                 ),
  //                 border: InputBorder.none,
  //                 fillColor: Color(0xfff3f3f4),
  //                 filled: true)),
  //       ],
  //     ),
  //   );
  // }

  // var _passInvalid = false;
  // var _mailInvalid = false;
  // var _passErr = 'Invalid pasword. Password must be more than 6 characters';
  // var _mailErr = 'Invalid email. Try again';

  // void _signUpClick() {
  //   setState(() {
  //     if (txtpass.text.length < 6 || txtpass.text.isEmpty) {
  //       _passInvalid = true;
  //     } else {
  //       _passInvalid = false;
  //     }

  //     if (txtmail.text.isEmpty || !txtmail.text.contains("@")) {
  //       _mailInvalid = true;
  //     } else {
  //       _mailInvalid = false;
  //     }
  //   });
  // }

  // Widget _submitButton() {
  //   return InkWell(
  //     onTap: () {
  //       _signUpClick();
  //       if (!_passInvalid && !_mailInvalid) {
  //         _loginUser();
  //       }
  //     },
  //     child: Container(
  //       width: MediaQuery.of(context).size.width,
  //       padding: EdgeInsets.symmetric(vertical: 15),
  //       alignment: Alignment.center,
  //       decoration: BoxDecoration(
  //           borderRadius: BorderRadius.all(Radius.circular(5)),
  //           boxShadow: <BoxShadow>[
  //             BoxShadow(color: Colors.grey.shade200, spreadRadius: 1)
  //           ],
  //           gradient: LinearGradient(
  //               begin: Alignment.centerLeft,
  //               end: Alignment.centerRight,
  //               colors: [Color(0xFFD9D2E9), Color(0xff8E7CC3)])),
  //       child: Text(
  //         'Login',
  //         style: TextStyle(
  //             fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),
  //       ),
  //     ),
  //   );
  // }

  // Widget _divider() {
  //   return Container(
  //     margin: EdgeInsets.symmetric(vertical: 10),
  //     child: Row(
  //       children: <Widget>[
  //         SizedBox(
  //           width: 20,
  //         ),
  //         Expanded(
  //           child: Padding(
  //             padding: EdgeInsets.symmetric(horizontal: 10),
  //             child: Divider(
  //               thickness: 1,
  //             ),
  //           ),
  //         ),
  //         Text('or',
  //             style: TextStyle(
  //                 color: Colors.white,
  //                 fontSize: 15,
  //                 fontWeight: FontWeight.w400)),
  //         Expanded(
  //           child: Padding(
  //             padding: EdgeInsets.symmetric(horizontal: 10),
  //             child: Divider(
  //               thickness: 1,
  //             ),
  //           ),
  //         ),
  //         SizedBox(
  //           width: 20,
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget _facebookButton() {
  //   return Container(
  //     height: 50,
  //     margin: EdgeInsets.symmetric(vertical: 20),
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.all(Radius.circular(10)),
  //     ),
  //     child: Row(
  //       children: <Widget>[
  //         Expanded(
  //           flex: 1,
  //           child: Container(
  //             decoration: BoxDecoration(
  //               color: Color(0xff1959a9),
  //               borderRadius: BorderRadius.only(
  //                   bottomLeft: Radius.circular(5),
  //                   topLeft: Radius.circular(5)),
  //             ),
  //             alignment: Alignment.center,
  //             child: Text('f',
  //                 style: TextStyle(
  //                     color: Colors.white,
  //                     fontSize: 25,
  //                     fontWeight: FontWeight.w400)),
  //           ),
  //         ),
  //         Expanded(
  //           flex: 5,
  //           child: Container(
  //             decoration: BoxDecoration(
  //               color: Color(0xff2872ba),
  //               borderRadius: BorderRadius.only(
  //                   bottomRight: Radius.circular(5),
  //                   topRight: Radius.circular(5)),
  //             ),
  //             alignment: Alignment.center,
  //             child: Text('Log in with Facebook',
  //                 style: TextStyle(
  //                     color: Colors.white,
  //                     fontSize: 18,
  //                     fontWeight: FontWeight.w400)),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget _createAccountLabel() {
  //   return InkWell(
  //     onTap: () {
  //       Navigator.of(context).pushAndRemoveUntil(
  //           MaterialPageRoute(builder: (context) => RegisterPage()),
  //           (route) => false);
  //     },
  //     child: Container(
  //       margin: EdgeInsets.symmetric(vertical: 20),
  //       padding: EdgeInsets.all(15),
  //       alignment: Alignment.bottomCenter,
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: <Widget>[
  //           Text(
  //             'Don\'t have an account ?',
  //             style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
  //           ),
  //           SizedBox(
  //             width: 10,
  //           ),
  //           Text(
  //             'Register',
  //             style: TextStyle(
  //                 color: Color(0xfff79c4f),
  //                 fontSize: 13,
  //                 fontWeight: FontWeight.w600),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget _imageSection() {
    return CircleAvatar(
      radius: 150,
      child: ClipOval(
        child: Image.asset(
          'img/Logo.png',
          width: 600.0,
          height: 600.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Sugar Back Home',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Colors.blue.shade400),
          children: [
            TextSpan(
              text: 'New',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
              text: 's',
              style: TextStyle(color: Colors.blue.shade400, fontSize: 30),
            ),
          ]),
    );
  }

  bool _showPass = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Form(
        key: formkey,
        child: ListView(
          padding: EdgeInsets.all(32),
          children: [
            _imageSection(),
            SizedBox(height: 20),
            _title(),
            SizedBox(height: 20),
            TextFormField(
              validator: (val) => val!.isEmpty ? 'Invalid Email' : null,
              keyboardType: TextInputType.emailAddress,
              controller: txtmail,
              decoration: kInputDecoration('Email'),
            ),
            SizedBox(height: 10),
            TextFormField(
              obscureText: !_showPass,
              validator: (val) =>
                  val!.length < 6 ? 'Required at least 6 chars' : null,
              keyboardType: TextInputType.emailAddress,
              controller: txtpass,
              decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: EdgeInsets.all(0.0),
                  child: IconButton(
                    onPressed: _showPassClick,
                    icon: Icon(
                      _showPass ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                  ),
                ),
                labelText: 'Password',
                contentPadding: EdgeInsets.all(10),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : kTextButton('Login', () {
                    if (formkey.currentState!.validate()) {
                      setState(() {
                        loading = true;
                        _loginUser();
                      });
                    }
                  }),
            SizedBox(
              height: 10,
            ),
            kLoginRegisterHint('Dont have an account?', 'Register', () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                  (route) => false);
            }),
          ],
        ),
      ),
    );
  }
}
