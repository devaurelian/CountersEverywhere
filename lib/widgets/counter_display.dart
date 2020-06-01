import 'package:counters_everywhere/utils/utils.dart';
import 'package:flutter/material.dart';

/// A widget that displays a centered integer counter value, filled with a specified color.
class CounterDisplay extends StatelessWidget {
  /// Creates a counter display widget.
  const CounterDisplay({
    Key key,
    @required this.value,
    @required this.color,
    this.isPortrait = true,
  })  : assert(value != null),
        assert(color != null),
        assert(isPortrait != null),
        super(key: key);

  /// The color with which to fill the counter container.
  final Color color;

  /// The value of the counter.
  final int value;

  /// Are we in portrait "mode"?
  final bool isPortrait;

  @override
  Widget build(BuildContext context) {
    final TextStyle counterStyle =
        isPortrait ? Theme.of(context).textTheme.headline1 : Theme.of(context).textTheme.headline2;

    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          radius: 0.9,
          colors: [color, Colors.black],
        ),
      ),
      padding: const EdgeInsets.all(16.0),
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Text(
          toDecimalString(context, value),
          overflow: TextOverflow.ellipsis,
          style: counterStyle.copyWith(
            color: color.contrastOf(),
          ),
        ),
      ),
    );
  }
}
