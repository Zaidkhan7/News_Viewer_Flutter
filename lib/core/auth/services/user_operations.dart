import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_viewer/core/auth/models/message.dart';
import 'package:news_viewer/utils/constants.dart';
import '../models/user.dart' as UserClass;

class UserOperations {
  // Step-1 Create an Instance of FireBase Auth Service
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // register
  Future<Message> add(UserClass.User user) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: user.userid, password: user.password);
      Message message = Message.takeMessage(
          message: 'Register SuccessFully', code: Constants.SUCCESS);
      return message;
    } catch (err) {
      return Message.takeMessage(
          message: 'Register Fails', code: Constants.FAIL);
    }
  }

  // Login
  Future<Message> read(UserClass.User user) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: user.userid, password: user.password);
      return Message.takeMessage(
          message: 'Login SuccessFully', code: Constants.SUCCESS);
    } catch (err) {
      return Message.takeMessage(message: 'Login Fails', code: Constants.FAIL);
    }
  }
}