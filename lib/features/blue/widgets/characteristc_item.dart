import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class CharacteristicItem extends StatelessWidget {
  final BluetoothCharacteristic characteristic;

  const CharacteristicItem(this.characteristic, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Characteristic: ${characteristic.uuid}'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Properties: ${characteristic.properties}'),
          StreamBuilder(
            stream: characteristic.lastValueStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text('Last value: ${snapshot.data}');
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
