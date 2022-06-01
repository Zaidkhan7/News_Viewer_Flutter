import 'package:flutter/material.dart';
import 'package:news_viewer/core/auth/models/message.dart';
import 'package:news_viewer/core/auth/models/user.dart';
import 'package:news_viewer/core/auth/services/user_operations.dart';
import 'package:news_viewer/utils/constants.dart';
import 'package:news_viewer/utils/toast.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  _moveToLogin() {
    //Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => Register()));
    Navigator.pushNamed(
      context,
      RouteConstants.LOGIN,
    );
    
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    usernamectl = TextEditingController();
    passctl = TextEditingController();
    confpassctl = TextEditingController();
  }

  late TextEditingController usernamectl;
  late TextEditingController passctl;
  late TextEditingController confpassctl;

  _register() async {
    String message = "";
    String userid = usernamectl.text;
    String password = passctl.text;
    User userObject = User.takeInput(userid: userid, password: password);
    UserOperations opr = UserOperations();
    Message messageObject = await opr.add(userObject);
    print("Register.....");
    createToast(messageObject.message, context);
  }

  @override
  Widget build(BuildContext context) {
    Size devicesize = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://as2.ftcdn.net/v2/jpg/04/28/71/21/1000_F_428712120_pLwhz6srpWcmWL3tcqy97PMwlJK53jGi.jpg"),
              fit: BoxFit.cover)),
      child: Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            "NEWS VIEWER",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          )),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.fromLTRB(15, 70, 15, 0),
          child: Container(
            height: 350,
            width: devicesize.width - 30,
            decoration: BoxDecoration(
                color: Colors.white70, borderRadius: BorderRadius.circular(40)),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  "REGISTER",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: TextField(
                  controller: usernamectl,
                  decoration: InputDecoration(
                    hintText: "Enter Username",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: TextField(
                  controller: passctl,
                  obscureText: true,
                  decoration: InputDecoration(hintText: "Enter Password"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                    onPressed: () {
                      _register();
                    },
                    child: Text("Register"),
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)
                                    )
                                    ),
                                    

                                    )
                                    ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
