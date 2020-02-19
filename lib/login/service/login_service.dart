import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginService {
  Future login(String email, String name, String password) async {
    final HttpsCallable callable = CloudFunctions.instance.getHttpsCallable(
      functionName: 'registerUser',
    );

    try {
      final a = await callable.call(<String, dynamic>{
        'email': email,
        'displayName': name,
        'password': password,
      });

      print("DATA " + a.data.toString());

      final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      print(user.user.providerId);
    } catch (e) {
      print(e);
    }
  }
}
