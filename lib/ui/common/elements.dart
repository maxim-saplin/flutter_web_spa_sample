import 'package:flutter/material.dart';

class SimpleButton extends StatelessWidget {
  const SimpleButton({
    Key? key,
    required String title,
    void Function()? onPressed,
  })  : _onPressed = onPressed,
        _title = title,
        super(key: key);

  final void Function()? _onPressed;
  final String _title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 85,
        child: OutlinedButton(
            onPressed: _onPressed,
            child: Text(
              _title,
              style: TextStyle(color: Colors.white),
            )));
  }
}

class TextInput extends StatelessWidget {
  const TextInput({Key? key, this.value = '', this.controller, this.onChanged})
      : super(key: key);

  final String value;
  final TextEditingController? controller;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller ??
            TextEditingController.fromValue(TextEditingValue(
              text: value,
            )),
        onChanged: onChanged,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(5),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.zero,
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.zero,
            ),
            fillColor: Theme.of(context).backgroundColor,
            filled: true,
            hoverColor: Colors.grey[300],
            hintStyle: TextStyle(color: Colors.white)));
  }
}

class SquareButton extends StatelessWidget {
  const SquareButton({
    Key? key,
    required this.icon,
    required this.flagged,
    required this.onPressed,
  }) : super(key: key);

  final Icon icon;
  final bool flagged;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: flagged ? Colors.grey[200]! : Colors.grey[350]!,
        height: 30,
        width: 30,
        child:
            IconButton(iconSize: 15, icon: icon, onPressed: () => onPressed()));
  }
}

class AssetIconButton extends StatelessWidget {
  const AssetIconButton(
    this.icon,
    this.title, {
    this.padded = true,
    this.narrow = false,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final bool padded;
  final bool narrow;
  final void Function()? onTap;

  Widget makeNarrow(Widget w) {
    return SizedBox(child: w, width: 40);
  }

  @override
  Widget build(BuildContext context) {
    var w = Padding(
      child: TextButton(
          onPressed: onTap,
          child: Row(children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            Padding(
              child: Text(
                title,
                style: TextStyle(color: Colors.white),
              ),
              padding: padded ? EdgeInsets.only(left: 10) : EdgeInsets.all(0),
            )
          ])),
      padding: padded ? EdgeInsets.only(right: 30) : EdgeInsets.all(0),
    );

    return !narrow ? w : makeNarrow(w);
  }
}
