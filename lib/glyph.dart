import 'glyph_interface_enum.dart';
import 'glyph_interface_sdk.dart';

/// The abstract class that represent the Glyph Interface.

abstract class Glyph<T> {
  final sdkInterface = GlyphInterfaceSdk();

  Future<void> toggle({
    required List<T> channels,
  }) {
    throw UnimplementedError('toggle() has not been implemented.');
  }

  Future<void> animate(
      {required List<T> channels,
      Duration? duration,
      int? intervalDuration,
      int? cycles}) {
    throw UnimplementedError('animated() has not been implemented.');
  }
}

/// The class that represent the Phone1 Glyph.
/// Contains a basic implementation of the [toggle] and [animate] methods.
class Phone1Glyph extends Glyph<Phone1Led> {
  @override
  Future<void> toggle({
    required List<Phone1Led> channels,
  }) async {
    final builderId = await super.sdkInterface.builder();
    for (final channel in channels) {
      await super.sdkInterface.channel(id: builderId, channel: channel.value);
    }
    await super.sdkInterface.build(id: builderId);
    await super.sdkInterface.toggle(id: builderId);
  }

  @override
  Future<void> animate(
      {required List<Phone1Led> channels,
      Duration? duration,
      int? intervalDuration,
      int? cycles,
      bool splitBuild = false}) async {
    final builderId = await super.sdkInterface.builder();
    for (final channel in channels) {
      await super.sdkInterface.channel(id: builderId, channel: channel.value);
    }
    if (duration != null) {
      await super
          .sdkInterface
          .setPeriod(id: builderId, period: duration.inMilliseconds);
    }
    if (intervalDuration != null) {
      await super
          .sdkInterface
          .setInterval(id: builderId, interval: intervalDuration);
    }
    if (cycles != null) {
      await super.sdkInterface.setCycles(id: builderId, cycles: cycles);
    }
    await super.sdkInterface.build(id: builderId);
    if (duration == null && intervalDuration == null && cycles == null) {
      await super.sdkInterface.toggle(id: builderId);
    } else {
      await super.sdkInterface.animate(id: builderId);
    }
  }
}

/// The class that represent the Phone2 Glyph.
/// Contains a basic implementation of the [toggle] and [animate] methods.
class Phone2Glyph extends Glyph<Phone2Led> {
  @override
  Future<void> toggle({
    required List<Phone2Led> channels,
  }) async {
    final builderId = await super.sdkInterface.builder();
    for (final channel in channels) {
      await super.sdkInterface.channel(id: builderId, channel: channel.value);
    }
    await super.sdkInterface.build(id: builderId);
    await super.sdkInterface.toggle(id: builderId);
  }

  @override
  Future<void> animate({
    required List<Phone2Led> channels,
    Duration? duration,
    int? intervalDuration,
    int? cycles,
  }) async {
    final builderId = await super.sdkInterface.builder();
    for (final channel in channels) {
      await super.sdkInterface.channel(id: builderId, channel: channel.value);
    }
    if (duration != null) {
      await super
          .sdkInterface
          .setPeriod(id: builderId, period: duration.inMilliseconds);
    }
    if (intervalDuration != null) {
      await super
          .sdkInterface
          .setInterval(id: builderId, interval: intervalDuration);
    }
    if (cycles != null) {
      await super.sdkInterface.setCycles(id: builderId, cycles: cycles);
    }
    await super.sdkInterface.build(id: builderId);
    if (duration == null && intervalDuration == null && cycles == null) {
      await super.sdkInterface.toggle(id: builderId);
    } else {
      await super.sdkInterface.animate(id: builderId);
    }
  }
}

class Phone2aGlyph extends Glyph<Phone2aLed> {
  @override
  Future<void> toggle({
    required List<Phone2aLed> channels,
  }) async {
    final builderId = await super.sdkInterface.builder();
    for (final channel in channels) {
      await super.sdkInterface.channel(id: builderId, channel: channel.value);
    }
    await super.sdkInterface.build(id: builderId);
    await super.sdkInterface.toggle(id: builderId);
  }

  @override
  Future<void> animate({
    required List<Phone2aLed> channels,
    Duration? duration,
    int? intervalDuration,
    int? cycles,
  }) async {
    final builderId = await super.sdkInterface.builder();
    for (final channel in channels) {
      await super.sdkInterface.channel(id: builderId, channel: channel.value);
    }
    if (duration != null) {
      await super
          .sdkInterface
          .setPeriod(id: builderId, period: duration.inMilliseconds);
    }
    if (intervalDuration != null) {
      await super
          .sdkInterface
          .setInterval(id: builderId, interval: intervalDuration);
    }
    if (cycles != null) {
      await super.sdkInterface.setCycles(id: builderId, cycles: cycles);
    }
    await super.sdkInterface.build(id: builderId);
    if (duration == null && intervalDuration == null && cycles == null) {
      await super.sdkInterface.toggle(id: builderId);
    } else {
      await super.sdkInterface.animate(id: builderId);
    }
  }
}
