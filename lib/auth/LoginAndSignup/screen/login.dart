import 'package:doctor_chat/auth/LoginAndSignup/Widget/button.dart';
import 'package:doctor_chat/auth/LoginAndSignup/screen/signup.dart';
import 'package:doctor_chat/auth/LoginAndSignup/services/authentication.dart';
import 'package:doctor_chat/auth/LoginAndSignup/widget/snackbar.dart';
import 'package:doctor_chat/auth/LoginAndSignup/widget/text_field.dart';
import 'package:doctor_chat/auth/LoginWithGoogle/google_auth.dart';
import 'package:doctor_chat/auth/forget_password/forgot_password.dart';
import 'package:doctor_chat/view/screens/home_screen.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

// email and passowrd auth part
  void loginUser() async {
    setState(() {
      isLoading = true;
    });
    // signup user using our authmethod
    String res = await AuthMethod().loginUser(
        email: emailController.text, password: passwordController.text);

    if (res == "success") {
      setState(() {
        isLoading = false;
      });
      //navigate to the home screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) =>  HomePage(),
        ),
      );
    } else {
      setState(() {
        isLoading = false;
      });
      // show error
      showSnackBar(context, res);
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height / 2.7,
                    child: Image.asset('assets/images/login.jpg'),
                  ),
                  TextFieldInput(
                      icon: Icons.person,
                      textEditingController: emailController,
                      hintText: 'البريد الالكتروني',
                      textInputType: TextInputType.text),
                  TextFieldInput(
                    icon: Icons.lock,
                    textEditingController: passwordController,
                    hintText: 'كلمه المرور',
                    textInputType: TextInputType.text,
                    isPass: true,
                  ),
                  //  we call our forgot password below the login in button
                  const ForgotPassword(),
                  MyButtons(onTap: loginUser, text: "تسجيل الدخول"),
        
                  Row(
                    children: [
                      Expanded(
                        child: Container(height: 1, color: Colors.black26),
                      ),
                      const Text("  او  "),
                      Expanded(
                        child: Container(height: 1, color: Colors.black26),
                      )
                    ],
                  ),
                  // for google login
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    child: ElevatedButton(
                      style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.white),
                      onPressed: () async {
                        await FirebaseServices().signInWithGoogle();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  HomePage(),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Image.network(
                              "https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png",
                              height: 40,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            "         المتابعه بحساب جوجل",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.blue,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  // for phone authentication
                  // const PhoneAuthentication(),
                  // Don't have an account? got to signup screen
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("ليس لديك حساب؟"),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const SignupScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            "قم بانشاء حساب الان",
                            style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  Container socialIcon(image) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFedf0f8),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.black45,
          width: 2,
        ),
      ),
      child: Image.network(
        image,
        height: 40,
      ),
    );
  }
}