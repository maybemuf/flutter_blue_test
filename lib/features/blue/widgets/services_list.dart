import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_blue_test/features/blue/widgets/characteristc_item.dart';

class ServicesList extends StatelessWidget {
  final List<BluetoothService> services;

  const ServicesList(this.services, {super.key});

  @override
  Widget build(BuildContext context) {
    if (services.isEmpty) {
      return const Center(
        child: Text('No services'),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Services: ${services.length}',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        ...services.map(
          (service) => ExpansionTile(
            title: Text('Service: ${service.uuid}'),
            children: [
              ListTile(
                title: Text('Service UUID: ${service.uuid}'),
              ),
              ListTile(
                title: Text('Is primary: ${service.isPrimary}'),
              ),
              ListTile(
                title: Text('Included services: ${service.includedServices}'),
              ),
              ListTile(
                title: ExpansionTile(
                  tilePadding: EdgeInsets.zero,
                  childrenPadding: EdgeInsets.zero,
                  title: Text(
                    'Characteristics: ${service.characteristics.length}',
                  ),
                  children: service.characteristics
                      .map(
                        (characteristic) => CharacteristicItem(
                          characteristic,
                          key: ValueKey(characteristic.uuid),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
