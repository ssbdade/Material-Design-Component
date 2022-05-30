import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({Key? key}) : super(key: key);

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  final TextEditingController _controller5 = TextEditingController();
  final TextEditingController _controller6 = TextEditingController();






  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("OTP PAGE"),),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _otpTextField(true, false, _controller),
                _otpTextField(false, false, _controller2),
                _otpTextField(false, false, _controller3),
                _otpTextField(false, false, _controller4),
                _otpTextField(false, false, _controller5),
                _otpTextField(false, true, _controller6),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                String result = _controller.text + _controller2.text + _controller3.text + _controller4.text + _controller5.text + _controller6.text;
                if (result.length < 6) {
                  _showSnackBar("Error");
                }
                else {_showSnackBar(result);}
              },
              child: const Text("VERIFY OTP!"),
            ),
          ],
        ),
      ),
    );
  }



  void _showSnackBar(String pin) {
    final snackBar = SnackBar(
      duration: const Duration(seconds: 4),
      content: SizedBox(
        height: 60.0,
        child: Center(
          child: Text(
            'OTP Submitted: $pin',
            style: const TextStyle(fontSize: 25.0),
          ),
        ),
      ),
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
  Widget _otpTextField(bool first, bool last, TextEditingController controller) {
    return SizedBox(
      height: 58,
      width: 54,
      child: TextField(
        controller: controller,
        autofocus: true,
        onChanged: (value) {
          if (value.length == 1 && last == false) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty && first == false) {
            FocusScope.of(context).previousFocus();
          }
        },
        decoration: const InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Color(0xFF442B2D)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Color(0xFFEAA4A4)),
            )),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}






