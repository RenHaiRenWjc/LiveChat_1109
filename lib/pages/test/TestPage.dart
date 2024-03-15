import 'package:flutter/cupertino.dart';

class TestPage extends StatefulWidget {
  String text = "1";
  @override
  State<StatefulWidget> createState() {
    return _TestPageState(text);
  }
}

class _TestPageState extends State<TestPage> {
  var _text = "11";

  _TestPageState(String text) {
    _text = text;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Text(_text);
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  void didUpdateWidget(covariant TestPage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
