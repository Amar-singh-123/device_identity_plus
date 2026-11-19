import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:device_identity_plus/device_identity_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? _deviceId = 'Loading...';
  final _deviceIdentityPlugin = DeviceIdentityPlus();

  @override
  void initState() {
    super.initState();
    _fetchDeviceId();
  }

  Future<void> _fetchDeviceId() async {
    String? deviceId;
    try {
      deviceId = await _deviceIdentityPlugin.getDeviceId();
    } on PlatformException catch (e) {
      deviceId = 'Failed to get device ID: ${e.message}';
    }

    if (!mounted) return;

    setState(() {
      _deviceId = deviceId ?? 'Unknown Device ID';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('device_identity_plus Example'),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: _fetchDeviceId,
            ),
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Persistent Device Unique ID:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                SelectableText(
                  _deviceId ?? '',
                  style: const TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
