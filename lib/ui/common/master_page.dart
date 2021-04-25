import 'package:flutter_web_spa_sample/misc/auth.dart';
import 'package:flutter_web_spa_sample/model/presentation/preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_web_spa_sample/misc/i18n.dart';
import 'icons.dart';

class MasterPage extends StatelessWidget {
  MasterPage(this.blueStripe, this.body);

  final Widget body;
  final Widget blueStripe;

  @override
  Widget build(BuildContext context) {
    var t = Theme.of(context);
    return Scaffold(
        body: Column(children: [
      _Stripe(_TopmostStripe(), Colors.white, 80),
      _Stripe(this.blueStripe, t.primaryColor, 46),
      Expanded(child: body),
      _Stripe(_FooterText(), t.accentColor, 80)
    ]));
  }
}

class _FooterText extends StatelessWidget {
  const _FooterText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('CV Databank',
            style: TextStyle(fontSize: 23, color: Color(0xFF9d9d9d))),
        Text('by ACME Corporation', style: TextStyle(color: Color(0xFF9d9d9d)))
      ]),
      Text(
          '© ${DateTime.now().year} CV Databank by ACME Corporation'
          '\nAll rights reserved.'
          '\nRevision 7.7.7',
          textAlign: TextAlign.end,
          style: TextStyle(fontSize: 14, color: Color(0xFF9d9d9d)))
    ]);
  }
}

class _Stripe extends StatelessWidget {
  final Widget child;
  final Color color;
  final double height;
  const _Stripe(
    this.child,
    this.color,
    this.height, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: this.color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
              fit: FlexFit.loose,
              child: ColoredBox(
                color: this.color,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: ConstrainedBox(
                        constraints: BoxConstraints(
                            minHeight: this.height,
                            maxHeight: this.height,
                            maxWidth: 1180,
                            minWidth: 600),
                        child: child)),
              )),
        ],
      ),
    );
  }
}

class _TopmostStripe extends StatelessWidget {
  const _TopmostStripe({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(children: [
        _BigMenuButton('CVs'.i18n, '/cvs', true),
        _BigMenuButton('Snapshots'.i18n, '/snapshots'),
        _BigMenuButton('Glossary'.i18n, '/glossary'),
        _BigMenuButton('Analytics'.i18n, '/analytics'),
      ]),
      Row(children: [
        Padding(
            padding: EdgeInsets.only(right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('Captain Nemo'),
                TextButton(
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      alignment: Alignment.centerRight),
                  child: Text('Logout'.i18n),
                  onPressed: () =>
                      Provider.of<Auth>(context, listen: false).logout(),
                ),
                _LanguageSwitcher()
              ],
            )),
        SizedBox(
            width: 60,
            height: 60,
            child: CircleAvatar(backgroundImage: AssetImage('assets/nemo.jpg')))
      ])
    ]);
  }
}

class _LanguageSwitcher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var preferences = Provider.of<Preferences>(context);
    return SizedBox(
        height: 18,
        child: TextButton(
          style: TextButton.styleFrom(
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              alignment: Alignment.centerRight),
          child: Text(preferences.locale.languageCode == 'en' ? 'ENG' : 'РУС'),
          onPressed: () => preferences.switchLocale(),
        ));
  }
}

class _BigMenuButton extends StatelessWidget {
  final String title;
  final String route;
  final bool isDefault;
  const _BigMenuButton(this.title, this.route, [this.isDefault = false]);

  @override
  Widget build(BuildContext context) {
    var currentRoute = ModalRoute.of(context)?.settings.name ?? '';
    var selected = currentRoute == route || (isDefault && currentRoute == '/');

    return Container(
      padding: EdgeInsets.zero,
      height: 80,
      decoration: !selected
          ? null
          : BoxDecoration(
              color: selected ? Color(0x100000FF) : Colors.transparent,
              border: Border(
                  top: BorderSide(width: 5, color: Colors.transparent),
                  bottom: BorderSide(
                      width: 5, color: Color.fromARGB(255, 0, 94, 183)))),
      child: TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 32),
          ),
          child: Text(title,
              style: TextStyle(
                  color: selected
                      ? Color.fromARGB(255, 0, 94, 183)
                      : Colors.grey[700],
                  fontSize: 18,
                  fontWeight: selected ? FontWeight.w900 : FontWeight.bold)),
          onPressed: () => Navigator.of(context).pushNamed(route)),
    );
  }
}
