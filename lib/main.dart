import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<void> _handleSignIn() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();

      if (googleSignInAccount == null) {
        // User canceled the sign-in process
        return;
      }

      GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

      // Now you can use the GoogleSignInAuthentication object
      // to authenticate with your backend server or perform other tasks.

      print(
          'User ID: ${googleSignInAccount.id}\n'
              'User Display Name: ${googleSignInAccount.displayName}\n'
              'User Email: ${googleSignInAccount.email}\n'
              'Auth Token: ${googleSignInAuthentication.accessToken}\n'
              'ID Token: ${googleSignInAuthentication.idToken}\n');
    } catch (error) {
      print('Error signing in with Google: $error');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: _handleSignIn,
          child: Text('Sign In with Google'),
        ),
      ),
    );
  }
}
