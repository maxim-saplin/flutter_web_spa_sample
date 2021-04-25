import 'package:flutter_web_spa_sample/ui/common/master_page.dart';
import 'package:flutter/material.dart';

class Analytics extends StatelessWidget {
  Analytics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MasterPage(Center(child: Text('Your ads here, call 1-800-CVTOOL')),
        Center(child: Text('Analytics')));
  }
}
