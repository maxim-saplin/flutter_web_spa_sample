import 'package:flutter_web_spa_sample/misc/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var auth = Provider.of<Auth>(context);
    return ColoredBox(
        color: Colors.white,
        child: Center(
            child: IntrinsicWidth(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
              ElevatedButton(
                  onPressed: () => auth.login('cnemo', 'water'),
                  child: Text('Login as Capitan Nemo')),
              SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () => auth.login('mx', 'darkness'),
                  child: Text('Login as Mister X')),
              SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () => auth.login('mx', 'arkness'),
                  child: Text(
                    'Login as Mister X (wrong pass)',
                    style: TextStyle(color: Colors.red),
                  )),
              SizedBox(height: 10),
              auth.error.isNotEmpty
                  ? Text(
                      'Error occured',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(color: Colors.red),
                    )
                  : Text(
                      auth.message,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(color: Colors.red),
                    )
            ]))));
  }
}
