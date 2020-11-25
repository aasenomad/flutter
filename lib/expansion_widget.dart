import 'package:flutter/material.dart';

class ExpansionWidget extends StatefulWidget {
  final Key key;
  final Widget Function(BuildContext context, bool isExpanded) headerBuilder;
  final bool initialExpanded;
  final Widget body;

  ExpansionWidget({
    this.key,
    @required this.headerBuilder,
    @required this.body,
    this.initialExpanded = false,
  }) : super(key: key);

  @override
  _ExpansionWidgetState createState() => _ExpansionWidgetState();
}

class _ExpansionWidgetState extends State<ExpansionWidget> {
  bool _expanded;

  @override
  void initState() {
    _expanded = widget.initialExpanded;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _expanded = !_expanded;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          widget.headerBuilder(context, _expanded),
          AnimatedCrossFade(
            duration: new Duration(milliseconds: 200),
            firstChild: Container(),
            secondChild: widget.body,
            crossFadeState: _expanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
          ),
        ],
      ),
    );
  }
}
