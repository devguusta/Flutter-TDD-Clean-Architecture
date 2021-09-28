import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String label;
  final Function onTap;
  const RoundButton({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 220,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Colors.black26,
        ),
        child: Text(label,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.button),
      ),
      onTap: onTap as Function(),
    );
  }
}
