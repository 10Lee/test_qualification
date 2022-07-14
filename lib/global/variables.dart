import 'package:flutter/material.dart';

class Global {
  static String baseurl = 'https://reqres.in/api/users';
}

enum MediaQueryTypes { width, height }

double getMediaQuery(BuildContext context, MediaQueryTypes types) {
  if (types == MediaQueryTypes.width) {
    return MediaQuery.of(context).size.width;
  }
  return MediaQuery.of(context).size.height;
}
