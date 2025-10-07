import 'package:flutter/material.dart';
import 'dart:async';

class Verification extends StatefulWidget {
  final String email;
  
  const Verification({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  final List<TextEditingController> _controllers = List.generate(
    4,
    (index) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(
    4,
    (index) => FocusNode(),
  );

  int _remainingSeconds = 60;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
    
    for (int i = 0; i < 4; i++) {
      _controllers[i].addListener(() {
        if (_controllers[i].text.length == 1 && i < 3) {
          _focusNodes[i + 1].requestFocus();
        }
      });
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        _timer?.cancel();
      }
    });
  }

  void _resendCode() {
    setState(() {
      _remainingSeconds = 60;
      for (var controller in _controllers) {
        controller.clear();
      }
    });
    _focusNodes[0].requestFocus();
    _startTimer();
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int secs = seconds % 60;
    return '${minutes}:${secs.toString().padLeft(2, '0')}';
  }

  String _maskEmail(String email) {
    if (!email.contains('@')) return email;
    
    final parts = email.split('@');
    final username = parts[0];
    final domain = parts[1];
    
    if (username.length <= 4) {
      return '${username[0]}****@$domain';
    }
    
    final visibleStart = username.substring(0, username.length - 4);
    final visibleEnd = username.substring(username.length);
    return '$visibleStart****$visibleEnd@$domain';
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    "Verification OTP",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      fontSize: 20.0,
                      color: Color(0xff092724),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32.0),
              RichText(
                text: TextSpan(
                  text: "We sent a verification code to\n",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    fontSize: 16.0,
                    color: Color(0xff697B7A),
                    height: 1.5,
                  ),
                  children: [
                    TextSpan(
                      text: _maskEmail(widget.email),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(0xff092724),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.0),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(4, (index) {
                  return OTPInputField(
                    controller: _controllers[index],
                    focusNode: _focusNodes[index],
                    onChanged: (value) {
                      if (value.isEmpty && index > 0) {
                        _focusNodes[index - 1].requestFocus();
                      }
                    },
                  );
                }),
              ),
              SizedBox(height: 20.0),
              
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: _remainingSeconds == 0 ? _resendCode : null,
                  child: RichText(
                    text: TextSpan(
                      text: _formatTime(_remainingSeconds),
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                        fontSize: 14.0,
                        color: Color(0xFFF2C94C),
                      ),
                      children: [
                        TextSpan(
                          text: " Resend code?",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color(0xff092724),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 42.0),
              
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    String otp = _controllers.map((c) => c.text).join();
                    print('OTP: $otp');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFF2C94C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Verification',
                    style: TextStyle(
                      fontFamily: "Poppins",
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OTPInputField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;

  const OTPInputField({
    Key? key,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<OTPInputField> createState() => _OTPInputFieldState();
}

class _OTPInputFieldState extends State<OTPInputField> {
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(() {
      setState(() {
        _isFocused = widget.focusNode.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: _isFocused ? Color(0xFFF2C94C) : Color(0xffF4F4F4),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: TextStyle(
          fontFamily: "Poppins",
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: Color(0xff092724),
        ),
        decoration: InputDecoration(
          counterText: '',
          border: InputBorder.none,
          hintText: '_',
          hintStyle: TextStyle(
            color: Color(0xff092724),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        onChanged: widget.onChanged,
      ),
    );
  }
}