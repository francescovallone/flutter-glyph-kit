import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'glyph_interface_sdk_platform_interface.dart';

/// An implementation of [GlyphInterfaceSdkPlatform] that uses method channels.
class MethodChannelGlyphInterfaceSdk extends GlyphInterfaceSdkPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('glyph_interface_sdk');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
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

}
