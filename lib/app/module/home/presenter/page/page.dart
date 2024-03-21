import 'package:flutter/material.dart';
import 'package:test_evertec/app/module/home/presenter/widgets/data_container.dart';
import 'package:test_evertec/app/module/home/presenter/widgets/device_info.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/splash.webp',
                      width: MediaQuery.of(context).size.width * 0.22,
                    ),
                    Expanded(
                      flex: 5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Image.asset(
                          'assets/images/home.jpg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.logout)),
                  ],
                ),
                // Ajusta la propiedad top del Positioned
                Positioned(
                  top: MediaQuery.of(context).size.width * 0.52,
                  left: 0,
                  right: 0,
                  child: const DeviceInfoContainer(),
                ),
              ],
            ),
            // Espacio adicional después del Stack si es necesario
            const Expanded(child: DataContainer())
          ],
        ),
      ),
    );
  }
}
