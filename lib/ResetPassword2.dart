import 'package:flutter/material.dart';
import 'package:practice_2/Registration.dart';

class ResetPassword2 extends StatefulWidget {
  const ResetPassword2({super.key});

  @override
  State<ResetPassword2> createState() => _ResetPassword2State();
}

class _ResetPassword2State extends State<ResetPassword2> {
  final TextEditingController newPasswordControlled = TextEditingController();
  final TextEditingController confirmPasswordControlled = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;
  bool showPassword = false;
  bool showConfirmPassword = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    newPasswordControlled.dispose();
    confirmPasswordControlled.dispose();
    _focusNode.dispose();
    super.dispose();
  }
  

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Color(0xffffffff),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.0),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Image.asset(
                        "assets/arrow_back.png",
                        width: 42,  
                        height: 42,
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Text(
                      "Reset Password",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                        fontSize: 20.0,
                        color: Color(0xff092724),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.0),

                Text(
                  "Please fill in the field below to reset your \ncurrent password.",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    fontSize: 14.0,
                    color: Color(0xff697B7A),
                  ),
                ),
                SizedBox(height: 32.0,),
                
                CustomTextField(
                  label: "New Password", 
                  controller: newPasswordControlled, 
                  iconPath: "assets/lock.png", 
                  hintText: "New Password",
                  isPassword: true,
                  showPassword: showPassword,
                  onTogglePassword: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                ),
                SizedBox(height: 32.0),

                CustomTextField(
                  label: "Confirm Password", 
                  controller: confirmPasswordControlled, 
                  iconPath: "assets/lock.png",
                  hintText: "Confirm Password",
                  isPassword: true,
                  showPassword: showPassword,
                  onTogglePassword: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                ),
                SizedBox(height: 42.0,),

                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      print("Comfirm Reset Password Button pressed");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFF2C94C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'Confirm Reset Password',
                      style: TextStyle(
                        fontFamily: "Poppins",
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}