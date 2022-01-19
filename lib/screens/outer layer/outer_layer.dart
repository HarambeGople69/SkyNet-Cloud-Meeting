import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/screens/authentication/login_page.dart';
import 'package:myapp/screens/dashboard/dashboard_page.dart';

class OuterLayer extends StatefulWidget {
  const OuterLayer({Key? key}) : super(key: key);

  @override
  _OuterLayerState createState() => _OuterLayerState();
}

class _OuterLayerState extends State<OuterLayer> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return DashBoard();
        } else {
          return LoginPage();
        }
      },
    );
  }
}
