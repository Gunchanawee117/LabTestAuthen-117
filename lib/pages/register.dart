import 'package:flutter/material.dart';
import 'package:authentest_117/pages/index.dart';
import 'package:authentest_117/pages/login.dart';
import 'package:authentest_117/service/auth_service.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

TextEditingController _emailcontroller = TextEditingController();
TextEditingController _passwordcontroll = TextEditingController();
TextEditingController _usernamecontroll = TextEditingController();
TextEditingController _phonecontroll = TextEditingController();

class _RegisterpageState extends State<Registerpage> {
  final GlobalKey<FormState> _formkey = GlobalKey();

  int _value = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register form')),
      body: SafeArea(
          child: Form(
        key: _formkey,
        child: ListView(children: [
          email(),
          password(),
          username(),
          telephone(),
          RadioListTile(
            value: 1,
            groupValue: _value,
            onChanged: (val) {
              setState(() {
                _value = val!;
              });
            },
            title: Text("นักศึกษา"),
            activeColor: Colors.amberAccent,
          ),
          RadioListTile(
            value: 2,
            groupValue: _value,
            onChanged: (val) {
              setState(() {
                _value = val!;
              });
            },
            title: Text("อาจารย์"),
            activeColor: Colors.amberAccent,
          ),
          RadioListTile(
            value: 3,
            groupValue: _value,
            onChanged: (val) {
              setState(() {
                _value = val!;
              });
            },
            title: Text("บุคคลทั่วไป"),
            activeColor: Colors.amberAccent,
          ),
          register(),
        ]),
      )),
    );
  }

  ElevatedButton register() => ElevatedButton(
      onPressed: () {
        if (_formkey.currentState!.validate()) {
          print("ok");
          print(_emailcontroller.text);
          AuthService.registerUser(
            _emailcontroller.text,
            _passwordcontroll.text,
          ).then((value) {
            if (value == 1) {
              Navigator.pop(context);
            }
          });

          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => Pagelogin()));
        } else {
          print("try again");
        }
      },
      child: const Text('confirm Register'));

  TextFormField password() {
    return TextFormField(
      controller: _passwordcontroll,
      validator: (value) {
        if (value!.isEmpty) {
          return "กรุณากรอกรหัสผ่าน";
        }
        {
          return null;
        }
      },
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.password),
        labelText: 'Input password',
      ),
    );
  }

  TextFormField email() {
    return TextFormField(
      controller: _emailcontroller,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email),
        labelText: 'Input email',
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return "กรุณากรอกใหม่";
        }
        {
          return null;
        }
      },
    );
  }

  TextFormField username() {
    return TextFormField(
      controller: _usernamecontroll,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person),
        labelText: 'Input username',
      ),
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return "กรุณากรอกใหม่";
        }
        {
          return null;
        }
      },
    );
  }

  TextFormField telephone() {
    return TextFormField(
      controller: _phonecontroll,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.phone),
        labelText: 'Input telephone number',
      ),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) {
          return "กรุณากรอกใหม่";
        }
        {
          return null;
        }
      },
    );
  }
}
