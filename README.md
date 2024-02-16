# Flutter Glyph Kit

Flutter implementation of the [Glyph-Developer-Kit](https://github.com/Nothing-Developer-Programme/Glyph-Developer-Kit) developed by 
Nothing Technology <span>&copy;</span>.

## Getting Started

> [!IMPORTANT]
> This plugin can be only used on Nothing Phone (1) and Nothing Phone (2).

## Installation

Add the following to your `pubspec.yaml` file:

```yaml
flutter pub add flutter_glyph_kit
```

Add the following to your `AndroidManifest.xml` file:

```xml
<!-- For debug you can use the following line -->
<meta-data android:name="NothingKey" android:value="test"/>

<!-- For release you can use the following line -->
<meta-data android:name="NothingKey" android:value="YOUR_KEY"/>
```

> [!NOTE]
> On debug mode you can use the `test` key, but on release mode you need to use the key provided by Nothing.

> [!NOTE]
> To use the plugin on debug mode you also need to execute the following command on your terminal:
> ```bash
> adb shell settings put global nt_glyph_interface_debug_enable 1
> ```

## Usage

The usage of this plugin is very simple, the plugin provides two classes `Phone1Glyph` and `Phone2Glyph`.

It also provides two enums `Phone1Led` and `Phone2Led` to help you to use the plugin.

If you want to develop your own implementation you can use the `GlyphInterfaceSdk` class that contains all the methods used in the other two classes.

### Phone1Glyph

```dart
import 'package:flutter/material.dart';

import 'package:flutter_glyph_kit/flutter_glyph_kit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
	return MaterialApp(
	  home: Scaffold(
		appBar: AppBar(
		  title: const Text('Phone 1 Glyph Example'),
		),
		body: Center(
		  child: ElevatedButton(
			onPressed: () async {
			  final glyph = Phone1Glyph();
			  await glyph.toggle(
				channels: [
					Phone1Led.a1,
					Phone1Led.a2,
				]
			  );
			  // This will turn on the A1 and A2 LEDs
			},
			child: const Text('Toggle'),
		  )
		),
	  ),
	);
  }
}
```

### Phone2Glyph

```dart
import 'package:flutter/material.dart';

import 'package:flutter_glyph_kit/flutter_glyph_kit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
	return MaterialApp(
	  home: Scaffold(
		appBar: AppBar(
		  title: const Text('Phone 2 Glyph Example'),
		),
		body: Center(
		  child: ElevatedButton(
			onPressed: () async {
			  final glyph = Phone2Glyph();
			  await glyph.toggle(
				channels: [
					Phone2Led.a1,
					Phone2Led.a2,
				]
			  );
			  // This will turn on the A1 and A2 LEDs
			},
			child: const Text('Toggle'),
		  )
		),
	  ),
	);
  }
}
```

### More information

For more information about the sdk you can check the official repository of the [Glyph-Developer-Kit](https://github.com/Nothing-Developer-Programme/Glyph-Developer-Kit)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
