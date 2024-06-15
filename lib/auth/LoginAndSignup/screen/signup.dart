import 'package:doctor_chat/auth/LoginAndSignup/services/authentication.dart';
import 'package:doctor_chat/auth/LoginAndSignup/widget/button.dart';
import 'package:doctor_chat/auth/LoginAndSignup/widget/snackbar.dart';
import 'package:doctor_chat/auth/LoginAndSignup/widget/text_field.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
  }

  bool isPasswordStrong(String password) {
    // Add your own password strength criteria here
    // Example: at least 8 characters, contains letters, numbers, and special characters
    if (password.length < 8) return false;
    bool hasLetter = password.contains(RegExp(r'[a-zA-Z]'));
    bool hasDigit = password.contains(RegExp(r'[0-9]'));
    bool hasSpecialCharacter = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    return hasLetter & hasDigit & hasSpecialCharacter;
  }

  void signupUser() async {
    // Check password strength
    if (!isPasswordStrong(passwordController.text)) {
      showSnackBar(context, "كلمة المرور ضعيفة جدا. يجب ألا يقل طوله عن 8 أحرف ويحتوي على أحرف وأرقام وأحرف خاصة.");
      return;
    }

    // set isLoading to true.
    setState(() {
      isLoading = true;
    });

    // signup user using our auth method
    String res = await AuthMethod().signupUser(
      email: emailController.text,
      password: passwordController.text,
      name: nameController.text,
    );

    // if string return is success, user has been created and navigate to login screen, otherwise show error.
    if (res == "success") {
      setState(() {
        isLoading = false;
      });
      // show success dialog
      showSuccessDialog();
    } else {
      setState(() {
        isLoading = false;
      });
      // show error
      showSnackBar(context, res);
    }
  }

  void showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("تم"),
          content: Text("لقد تم إنشاء حسابك بنجاح."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // navigate to login screen
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
              child: Text("موافق"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: height / 2.8,
                  child: Image.asset('assets/images/signup.jpeg'),
                ),
                TextFieldInput(
                  icon: Icons.person,
                  textEditingController: nameController,
                  hintText: 'الاسم',
                  textInputType: TextInputType.text,
                ),
                TextFieldInput(
                  icon: Icons.email,
                  textEditingController: emailController,
                  hintText: 'البريد الالكتروني',
                  textInputType: TextInputType.text,
                ),
                TextFieldInput(
                  icon: Icons.lock,
                  textEditingController: passwordController,
                  hintText: 'كلمه المرور',
                  textInputType: TextInputType.text,
                  isPass: true,
                ),
                MyButtons(onTap: signupUser, text: "انشاء"),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("هل لديك حساب بالفعل"),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "العوده لتسجبل الدخول",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
