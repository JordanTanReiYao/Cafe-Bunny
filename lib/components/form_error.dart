import 'package:flutter/material.dart';
import 'package:Cafe_Bunny/size_config.dart';

class FormError extends StatelessWidget {
  const FormError({
    Key key,
    @required this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          List.generate(errors.length, (index) => formErrorText(errors[index])),
    );
  }

  Row formErrorText(String error) {
    return Row(
      children: [
        Icon(
          Icons.error,
          color: Colors.red,
          size: 24,
        ),
        SizedBox(
          width: getProportionateScreenWidth(10),
        ),
        Text(error),
      ],
    );
  }
}
