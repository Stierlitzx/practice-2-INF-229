import 'package:flutter/material.dart';
import 'package:practice_2/Verification.dart';
import 'package:practice_2/registration.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool showPassword = false;
  bool showConfirmPassword = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 32.0),
                Text(
                  "Login",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    fontSize: 20.0,
                    color: Color(0xff092724),
                  ),
                ),
                SizedBox(height: 11.0,),
                Text(
                  "Hello, Welcome back to My Courses",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    fontSize: 14.0,
                    color: Color(0xff697B7A),
                  ),
                ),
                SizedBox(height: 32.0,),
                CustomTextField(
                  label: 'Email',
                  controller: emailController,
                  iconPath: 'assets/message.png',
                  hintText: 'Email Address',
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 32.0,),

                CustomTextField(
                  label: 'Password',
                  controller: passwordController,
                  iconPath: 'assets/lock.png',
                  hintText: 'New Password',
                  isPassword: true,
                  showPassword: showPassword,
                  onTogglePassword: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                ),
                SizedBox(height: 16.0),

                Row(
                  children: [
                    Expanded(child: Container(),),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        foregroundColor: Color(0xff6a7b7a),
                        textStyle: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                          fontSize: 14.0,
                        )
                      ),
                      onPressed: null,
                      child: const Text(
                        "Forgot password?"
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 42.0),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Verification(email: "nursultan1234@gmail.com",))
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFF2C94C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0,),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontFamily: "Poppins",
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ) ,
                ),
                SizedBox(height: 24),

                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Didn’t not have an account? ",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        color: Color(0xff697B7A),
                        fontSize: 14,
                      ),
                      children: [
                        TextSpan(
                          text: 'Register',
                          style: TextStyle(
                            color: Color(0xFFF4C430),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}
