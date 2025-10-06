import 'package:flutter/material.dart';
import 'package:practice_2/login.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool showPassword = false;
  bool showConfirmPassword = false;

  @override
  void dispose() {
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffefefe),
      body: SafeArea(
        child: SingleChildScrollView(
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
                      "Create Account",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                        fontSize: 20.0,
                        color: Color(0xff092724),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 31.0),
                Text(
                  "Enjoy the various best courses we have,\nchoose the category according to your wishes.",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    fontSize: 14.0,
                    color: Color(0xff697B7A),
                  ),
                ),
                SizedBox(height: 32.0),
                CustomTextField(
                  label: 'Email',
                  controller: emailController,
                  iconPath: 'assets/message.png',
                  hintText: 'Email Address',
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 32),

                CustomTextField(
                  label: 'Phone Number',
                  controller: phoneController,
                  iconPath: 'assets/phone.png',
                  hintText: 'Phone Number',
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: 32),

                CustomTextField(
                  label: 'New Password',
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
                SizedBox(height: 32),
  
                CustomTextField(
                  label: 'Confirm Password',
                  controller: confirmPasswordController,
                  iconPath: 'assets/lock.png',
                  hintText: 'Confirm Password',
                  isPassword: true,
                  showPassword: showConfirmPassword,
                  onTogglePassword: () {
                    setState(() {
                      showConfirmPassword = !showConfirmPassword;
                    });
                  },
                ),
                SizedBox(height: 42),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Login())
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
                        'Create Account',
                        style: TextStyle(
                          fontFamily: "Poppins",
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24),

                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Already have an account? ",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        color: Color(0xff697B7A),
                        fontSize: 14,
                      ),
                      children: [
                        TextSpan(
                          text: 'Sign in',
                          style: TextStyle(
                            color: Color(0xFFF4C430),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final String iconPath;
  final String? hintText;
  final bool isPassword;
  final bool showPassword;
  final VoidCallback? onTogglePassword;
  final TextInputType? keyboardType;

  const CustomTextField({
    Key? key,
    required this.label,
    required this.controller,
    required this.iconPath,
    this.hintText,
    this.isPassword = false,
    this.showPassword = false,
    this.onTogglePassword,
    this.keyboardType,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

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
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xff092724),
          ),
        ),
        SizedBox(height: 8),
        AnimatedContainer(
          duration: Duration(milliseconds: 100),
          decoration: BoxDecoration(
            color: _isFocused ? Colors.white : Colors.white,
            border: Border.all(
              color: _isFocused ? Color(0xFFF2C94C) : Color(0xffF4F4F4),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: TextField(
            controller: widget.controller,
            focusNode: _focusNode,
            obscureText: widget.isPassword && !widget.showPassword,
            keyboardType: widget.keyboardType,
            style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color(0xff092724),
            ),
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: TextStyle(
                fontFamily: "Poppins",
                color: _isFocused ? Colors.blueGrey : Color(0xffCED4D3),
              ),
              prefixIcon: Padding(
                padding: EdgeInsets.all(16.0),
                child: Image.asset(
                  widget.iconPath,
                  width: 24,
                  height: 24,
                  color: _isFocused ? Color(0xFFF4C430) : Color(0xffCED4D3),
                ),
              ),
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Image.asset(
                        widget.showPassword
                            ? 'assets/unhide.png'
                            : 'assets/hide.png',
                        width: widget.showPassword ? 21 : 24,
                        height: widget.showPassword ? 21  : 24,
                        color: Color(0xffCED4D3),
                      ),
                      onPressed: widget.onTogglePassword,
                    )
                  : null,
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}