import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tab_app_upskill/app_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: AppWidget()));
}
