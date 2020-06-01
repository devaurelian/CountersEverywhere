import 'package:counters_everywhere/common/settings_provider.dart';

/// An integer counter class.
class Counter {
  /// The counter value.
  int _value = 0;

  /// Returns the counter value.
  int get value => _value;

  /// Private setter that sets the counter value.
  void _setValue(int value) {
    _value = value;
    SettingsProvider.saveCounter(value);
  }

  /// Loads the counter from persistent storage.
  Future<void> load() async {
    _value = await SettingsProvider.loadCounter();
  }

  /// Increments the counter value.
  void increment() {
    _setValue(value + 1);
  }

  /// Decrements the counter value.
  void decrement() {
    _setValue(value - 1);
  }

  /// Resets the counter value to zero.
  void reset() {
    _setValue(0);
  }
}
