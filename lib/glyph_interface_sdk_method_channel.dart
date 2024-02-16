import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'glyph_interface_sdk_platform_interface.dart';

/// An implementation of [GlyphInterfaceSdkPlatform] that uses method channels.
class MethodChannelGlyphInterfaceSdk extends GlyphInterfaceSdkPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('glyph_interface_sdk');

  @override
  Future<String?> getPlatform() async {
    final version = await methodChannel.invokeMethod<String>('getPlatform');
    return version;
  }

  @override
  Future<String> builder() async {
    return await methodChannel.invokeMethod<String>('builder') ?? '';
  }

  @override
  Future<void> channel({
    required String id,
    required int channel,
  }) async {
    await methodChannel.invokeMethod<void>(
      'channel', 
      <String, dynamic>{
        'id': id,
        'channel': channel,
      }
    );
  }

  @override
  Future<void> build({
    required String id
  }) async {
    await methodChannel.invokeMethod<void>(
      'build',
      <String, dynamic>{
        'id': id,
      }
    );
  }

  @override
  Future<void> toggle({
    required String id,
  }) async {
    await methodChannel.invokeMethod<void>(
      'toggle',
      <String, dynamic>{
        'id': id,
      }
    );
  }

  @override
  Future<void> setPeriod({
    required String id,
    required int period,
  }) async {
    await methodChannel.invokeMethod<void>(
      'setPeriod',
      <String, dynamic>{
        'id': id,
        'period': period,
      }
    );
  }

  @override
  Future<void> setCycles({
    required String id,
    required int cycles,
  }) async {
    await methodChannel.invokeMethod<void>(
      'setCycles',
      <String, dynamic>{
        'id': id,
        'cycles': cycles,
      }
    );
  }

  @override
  Future<void> setInterval({
    required String id,
    required int interval,
  }) async {
    await methodChannel.invokeMethod<void>(
      'setInterval',
      <String, dynamic>{
        'id': id,
        'interval': interval,
      }
    );
  }

  @override
  Future<void> animate({
    required String id,
  }) async {
    await methodChannel.invokeMethod<void>(
      'animate',
      <String, dynamic>{
        'id': id,
      }
    );
  }

}
