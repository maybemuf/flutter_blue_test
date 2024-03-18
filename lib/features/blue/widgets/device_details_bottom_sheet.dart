import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_blue_test/features/blue/blocs/scan_result/scan_result_cubit.dart';
import 'package:flutter_blue_test/features/blue/widgets/services_list.dart';

class DeviceDetailsBottomSheet extends StatelessWidget {
  final ScanResult scanResult;

  const DeviceDetailsBottomSheet(this.scanResult, {super.key});

  @override
  Widget build(BuildContext context) {
    final device = scanResult.device;
    final deviceName =
        device.platformName.isNotEmpty ? device.platformName : 'Unknown';
    return BlocBuilder<ScanResultCubit, ScanResultState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              Center(
                child: Container(
                  width: 60,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 32),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'State: ${state.deviceState.name}',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          if (scanResult.advertisementData.connectable) ...[
                            ElevatedButton(
                              onPressed: () => context
                                  .read<ScanResultCubit>()
                                  .toggleConnection(
                                device,
                                onTimeout: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Connection timeout'),
                                    ),
                                  );
                                },
                              ),
                              child: state.isConnecting
                                  ? const CircularProgressIndicator()
                                  : state.deviceState ==
                                          BluetoothConnectionState.connected
                                      ? const Text('Disconnect')
                                      : const Text('Connect'),
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Divider(),
                      const SizedBox(height: 16),
                      Text(
                        'Device name: $deviceName',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Device ID: ${device.remoteId}',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 16),
                      const Divider(),
                      const SizedBox(height: 16),
                      ServicesList(state.services),
                      SizedBox(
                        height: MediaQuery.paddingOf(context).bottom,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
