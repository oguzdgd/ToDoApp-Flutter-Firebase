import 'package:flutter/material.dart';
import 'package:todo_app/data/auth_data.dart';

class RegisterScreen extends StatefulWidget {
  final VoidCallback show;

  const RegisterScreen(this.show, {super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  FocusNode _focusNodeEmail = FocusNode();
  FocusNode _focusNodePassword = FocusNode();
  FocusNode _focusNodePasswordConfirm = FocusNode();

  final emailController = TextEditingController();
  final passController = TextEditingController();
  final passConfirmController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNodePassword.addListener(() {
      setState(() {});
    });
    _focusNodeEmail.addListener(() {
      setState(() {});
    });
    _focusNodePasswordConfirm.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              loginimage(),
              const SizedBox(
                height: 20,
              ),
              textField(emailController, _focusNodeEmail, "Email", Icons.email),
              const SizedBox(
                height: 20,
              ),
              textField(passController, _focusNodePassword, "Password",
                  Icons.password),
              const SizedBox(
                height: 20,
              ),
              textField(passConfirmController, _focusNodePasswordConfirm,
                  "Password Confirm", Icons.password),
              const SizedBox(
                height: 5,
              ),
              account(),
              const SizedBox(
                height: 20,
              ),
              register_button()
            ],
          ),
        ),
      ),
    );
  }

  Padding account() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text("Do you have an account?"),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: widget.show,
            child: Text(
              "Login",
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  Widget register_button() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: GestureDetector(
        onTap: () {
          AuthenticationRemote().
          register(emailController.text,passController.text, passConfirmController.text);
        },
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(15),
          ),
          alignment: Alignment.center,
          child: Text(
            "Register",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget textField(TextEditingController _controller, FocusNode _focusNode,
      String hintText, IconData icons) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          controller: _controller,
          focusNode: _focusNode,
          style: TextStyle(fontSize: 18, color: Colors.black),
          decoration: InputDecoration(
              prefixIcon: Icon(
                icons,
                color: _focusNode.hasFocus ? Colors.red : Colors.black,
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              hintText: hintText,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.white, width: 2.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.red, width: 2.0),
              )),
        ),
      ),
    );
  }

  Widget loginimage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        width: double.infinity,
        height: 300,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/login_page.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
