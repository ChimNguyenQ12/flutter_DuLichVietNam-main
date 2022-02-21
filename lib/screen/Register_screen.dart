import 'package:flutter/material.dart';
import 'package:giaodien/constant.dart';
import 'package:giaodien/screen/Login_screen.dart';
import 'package:giaodien/screen/home_screen.dart';
import 'package:giaodien/models/api_response.dart';
import 'package:giaodien/models/user.dart';
import 'package:giaodien/services/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home_pagebottomappbar.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController passwordConfirmController = new TextEditingController();
  bool loading = false;

  void _registerUser() async {
    ApiResponse response = await register(
        nameController.text, emailController.text, passwordController.text);
    if (response.error == null) {
      _saveAndRedirectToHome(response.data as User);
    } else {
      setState(() {
        loading = !loading;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
    }
  }

  void _saveAndRedirectToHome(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('token', user.token ?? '');
    await pref.setInt('userID', user.id ?? 0);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
  }

  void _showPassClick() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  void _showPassConfirmClick() {
    setState(() {
      _showPassConfirm = !_showPassConfirm;
    });
  }

  bool _showPassConfirm = false;
  bool _showPass = false;
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

  // bool confirm = true;
  // Widget _checkboxConfirm() {
  //   return CheckboxListTile(
  //     title: Text(
  //       'I agree to the Terms of Service and Privacy Policy',
  //       style: TextStyle(color: Colors.black, fontSize: 16),
  //     ),
  //     checkColor: Colors.white,
  //     activeColor: Color(0xff43BFC7),
  //     value: confirm,
  //     onChanged: (bool? b) {
  //       setState(() {
  //         confirm = b!;
  //       });
  //     },
  //     controlAffinity: ListTileControlAffinity.leading,
  //   );
  // }

  // Widget _imageSection() {
  //   return CircleAvatar(
  //     radius: 150,
  //     child: ClipOval(
  //       child: Image.asset(
  //         'img/Logo.png',
  //         width: 600.0,
  //         height: 600.0,
  //         fit: BoxFit.cover,
  //       ),
  //     ),
  //   );
  // }

  // Widget _title() {
  //   return RichText(
  //     textAlign: TextAlign.center,
  //     text: TextSpan(
  //         text: 'Sugar Back Home',
  //         style: TextStyle(
  //           fontSize: 30,
  //           fontWeight: FontWeight.w700,
  //           color: Color(0xffEEEEEE),
  //         ),
  //         children: [
  //           TextSpan(
  //             text: 'New',
  //             style: TextStyle(color: Colors.black, fontSize: 30),
  //           ),
  //           TextSpan(
  //             text: 's',
  //             style: TextStyle(color: Color(0xffEEEEEE), fontSize: 30),
  //           ),
  //         ]),
  //   );
  // }

  // Widget _submitButton() {
  //   return InkWell(
  //     onTap: () {
  //       _signUpClick();
  //       if (!_nameInvalid &&
  //           !_passInvalid &&
  //           !_mailInvalid &&
  //           !_phoneInvalid &&
  //           confirm == true) {
  //         Navigator.push(context,
  //             MaterialPageRoute(builder: (context) => home_pagebottomappbar()));
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
  //               colors: [Color(0xFFD9D2E9), Color(0xffFFFFF0)])),
  //       child: Text(
  //         'Sign Up',
  //         style: TextStyle(
  //             fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),
  //       ),
  //     ),
  //   );
  // }

  // Widget _informationField() {
  //   return Column(
  //     children: [
  //       Padding(
  //         padding: const EdgeInsets.all(10),
  //         child: TextField(
  //           controller: _nameController,
  //           style: TextStyle(fontSize: 18, color: Colors.black),
  //           decoration: InputDecoration(
  //             labelText: 'Name',
  //             errorText: _nameInvalid ? _nameErr : null,
  //             labelStyle: TextStyle(
  //               fontSize: 16,
  //               fontWeight: FontWeight.w700,
  //               color: Color(0xff111111),
  //             ),
  //           ),
  //         ),
  //       ),
  //       Padding(
  //         padding: const EdgeInsets.all(10),
  //         child: TextField(
  //           controller: _mailController,
  //           style: TextStyle(fontSize: 18, color: Colors.black),
  //           decoration: InputDecoration(
  //               labelText: 'Email',
  //               errorText: _mailInvalid ? _mailErr : null,
  //               labelStyle: TextStyle(
  //                   fontSize: 16,
  //                   fontWeight: FontWeight.w700,
  //                   color: Color(0xff111111))),
  //         ),
  //       ),
  //       Padding(
  //         padding: const EdgeInsets.all(10),
  //         child: Stack(
  //           alignment: AlignmentDirectional.centerEnd,
  //           children: <Widget>[
  //             TextField(
  //               controller: _passController,
  //               obscureText: !_showPass,
  //               style: TextStyle(fontSize: 18, color: Colors.black),
  //               decoration: InputDecoration(
  //                   suffixIcon: Padding(
  //                     padding: EdgeInsets.all(0.0),
  //                     child: IconButton(
  //                       onPressed: _showPassClick,
  //                       icon: Icon(
  //                         _showPass ? Icons.visibility : Icons.visibility_off,
  //                         color: Colors.black,
  //                       ),
  //                     ),
  //                   ),
  //                   labelText: 'Password',
  //                   errorText: _passInvalid ? _passErr : null,
  //                   labelStyle: TextStyle(
  //                       fontSize: 16,
  //                       fontWeight: FontWeight.w700,
  //                       color: Color(0xff111111))),
  //             ),
  //           ],
  //         ),
  //       ),
  //       Padding(
  //         padding: const EdgeInsets.all(10),
  //         child: TextField(
  //           controller: _phoneController,
  //           keyboardType: TextInputType.number,
  //           style: TextStyle(fontSize: 18, color: Colors.black),
  //           decoration: InputDecoration(
  //               labelText: 'Phone number',
  //               errorText: _phoneInvalid ? _phoneErr : null,
  //               labelStyle: TextStyle(
  //                   fontSize: 16,
  //                   fontWeight: FontWeight.w700,
  //                   color: Color(0xff111111))),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // void _showPassClick() {
  //   setState(() {
  //     _showPass = !_showPass;
  //   });
  // }

  // var _nameInvalid = false;
  // var _passInvalid = false;
  // var _phoneInvalid = false;
  // var _mailInvalid = false;
  // var _nameErr = 'Invalid name. Try again';
  // var _passErr = 'Invalid pasword. Password must be more than 6 characters';
  // var _phoneErr = 'Invalid phone number. Phone numbers with 10 or more numbers';
  // var _mailErr = 'Invalid email. Try again';
  // void _signUpClick() {
  //   setState(() {
  //     if (_nameController.text.isEmpty) {
  //       _nameInvalid = true;
  //     } else {
  //       _nameInvalid = false;
  //     }

  //     if (_passController.text.length < 6 || _passController.text.isEmpty) {
  //       _passInvalid = true;
  //     } else {
  //       _passInvalid = false;
  //     }

  //     if (_phoneController.text.length < 10 || _phoneController.text.isEmpty) {
  //       _phoneInvalid = true;
  //     } else {
  //       _phoneInvalid = false;
  //     }

  //     if (_mailController.text.isEmpty || !_mailController.text.contains("@")) {
  //       _mailInvalid = true;
  //     } else {
  //       _mailInvalid = false;
  //     }
  //   });
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
              controller: nameController,
              decoration: kInputDecoration('Name'),
            ),
            SizedBox(height: 10),
            TextFormField(
              validator: (val) => val!.isEmpty ? 'Invalid Email' : null,
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              decoration: kInputDecoration('Email'),
            ),
            SizedBox(height: 10),
            TextFormField(
              obscureText: !_showPass,
              validator: (val) =>
                  val!.length < 6 ? 'Required at least 6 chars' : null,
              keyboardType: TextInputType.emailAddress,
              controller: passwordController,
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
            TextFormField(
              obscureText: !_showPassConfirm,
              validator: (val) => val != passwordController.text
                  ? 'Confirm password does not match'
                  : null,
              keyboardType: TextInputType.emailAddress,
              controller: passwordConfirmController,
              decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: EdgeInsets.all(0.0),
                  child: IconButton(
                    onPressed: _showPassConfirmClick,
                    icon: Icon(
                      _showPassConfirm
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                  ),
                ),
                labelText: 'Password Confirmation',
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
                : kTextButton('Register', () {
                    if (formkey.currentState!.validate()) {
                      setState(() {
                        loading = !loading;
                        _registerUser();
                      });
                    }
                  }),
            SizedBox(
              height: 10,
            ),
            kLoginRegisterHint('Have an account?', 'Log in', () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  (route) => false);
            }),
          ],
        ),
      ),
    );
  }
}
