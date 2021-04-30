import 'package:WorkEasy/model/works.dart';
import 'package:flutter/material.dart';

class WorkDetailScreen extends StatefulWidget {
  final WorkResponse workResponse;
  WorkDetailScreen(this.workResponse);

  @override
  _WorkDetailScreenState createState() => _WorkDetailScreenState();
}

class _WorkDetailScreenState extends State<WorkDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
    );
  }
}
