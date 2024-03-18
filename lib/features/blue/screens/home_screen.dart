import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_test/features/blue/blocs/blue/blue_cubit.dart';
import 'package:flutter_blue_test/features/blue/widgets/scan_result_list_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlueCubit, BlueState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            bottom: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...[
                  const SizedBox(height: 16),
                  Text('Bluetooth adapter state: ${state.state.name}'),
                  const SizedBox(height: 16),
                  Text('Scanning: ${state.isScanning}'),
                  const SizedBox(height: 16),
                  Text('Devices found: ${state.scanResults.length}'),
                ].map((e) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: e,
                ),),
                const Divider(),
                Expanded(
                  child: ListView.builder(
                    key: const PageStorageKey('scanResults'),
                    itemCount: state.scanResults.length,
                    itemBuilder: (context, index) {
                      final result = state.scanResults[index];
                      return ScanResultListItem(
                        scanResult: result,
                        key: ValueKey(result.device.remoteId),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: context.read<BlueCubit>().toggleScanning,
            child: state.isScanning
                ? const Icon(Icons.search_off_outlined)
                : const Icon(Icons.search),
          ),
        );
      },
    );
  }
}
