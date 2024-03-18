import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_blue_test/features/blue/blocs/scan_result/scan_result_cubit.dart';
import 'package:flutter_blue_test/features/blue/repositories/blue_repository.dart';

enum ConnectionState { connected, disconnected, connecting }

class ScanResultListItem extends StatelessWidget {
  final ScanResult scanResult;

  const ScanResultListItem({
    required this.scanResult,
    super.key,
  });

  @override
  Widget build(BuildContext ctx) {
    return BlocProvider(
      create: (context) => ScanResultCubit(context.read<BlueRepository>())
        ..init(scanResult.device),
      child: BlocBuilder<ScanResultCubit, ScanResultState>(
        builder: (context, state) {
          return ListTile(
            onTap: () {},
            leading: const Icon(Icons.bluetooth),
            title: Text(
              scanResult.device.platformName.isNotEmpty
                  ? scanResult.device.platformName
                  : 'Unknown',
            ),
            subtitle: Text(
              scanResult.device.remoteId.toString(),
              style: Theme.of(context).textTheme.labelSmall,
            ),
            trailing: scanResult.advertisementData.connectable
                ? ElevatedButton(
                    onPressed: () =>
                        context.read<ScanResultCubit>().toggleConnection(
                      scanResult.device,
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
                  )
                : null,
          );
        },
      ),
    );
  }
}
