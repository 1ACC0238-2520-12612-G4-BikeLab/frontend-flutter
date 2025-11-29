import 'package:flutter/material.dart';
import '../theme/colors.dart';
import 'my_vehicles_screen.dart';
import 'provider_profile_screen.dart';
import 'notifications_screen.dart';
import 'add_vehicle_screen.dart';
import 'sign_in_screen.dart';

class ProviderIncomeScreen extends StatefulWidget {
  const ProviderIncomeScreen({super.key});

  @override
  State<ProviderIncomeScreen> createState() => _ProviderIncomeScreenState();
}

class _ProviderIncomeScreenState extends State<ProviderIncomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BikeLabColors.black,
      drawer: _buildDrawer(context),
      body: Column(
        children: [
          // Header con menú, logo y usuario
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Builder(
                  builder: (context) => IconButton(
                    icon: const Icon(
                      Icons.menu,
                      color: BikeLabColors.white,
                      size: 28,
                    ),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                ),
                // Logo BIKELAB
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'BIKE',
                        style: TextStyle(
                          color: BikeLabColors.limeGreen,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                      TextSpan(
                        text: 'LAB',
                        style: TextStyle(
                          color: BikeLabColors.mutedGreen,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                // Icono de usuario
                IconButton(
                  icon: const Icon(
                    Icons.person_outline,
                    color: BikeLabColors.white,
                    size: 28,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProviderProfileScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Título
          const Center(
            child: Text(
              'INGRESOS',
              style: TextStyle(
                color: BikeLabColors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Resumen de ingresos
                  const Text(
                    '• Monto Total Mensual:\n  S/ 0',
                    style: TextStyle(
                      color: BikeLabColors.white,
                      fontSize: 18,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    '• Desglose De Ingresos:',
                    style: TextStyle(
                      color: BikeLabColors.white,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildIncomeTable(),
                  const SizedBox(height: 24),
                  const Text(
                    'Ganancia Promedio Por Alquiler: S/ 0\nTotal De Alquileres Este Mes: 0',
                    style: TextStyle(
                      color: BikeLabColors.white,
                      fontSize: 16,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        // Lógica para retirar ganancias
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: BikeLabColors.limeGreen,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Retirar Ganancias',
                        style: TextStyle(
                          color: BikeLabColors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIncomeTable() {
    final headerStyle = const TextStyle(
      color: BikeLabColors.limeGreen,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );

    final cellStyle = const TextStyle(
      color: BikeLabColors.white,
      fontSize: 16,
    );

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: BikeLabColors.limeGreen, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Table(
        columnWidths: const {
          0: FlexColumnWidth(1),
          1: FlexColumnWidth(1),
        },
        border: TableBorder(
          horizontalInside: BorderSide(color: BikeLabColors.limeGreen.withOpacity(0.2), width: 1),
        ),
        children: [
          TableRow(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Fecha', style: headerStyle, textAlign: TextAlign.center),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Ingresos Diarios', style: headerStyle, textAlign: TextAlign.center),
              ),
            ],
          ),
          ...List.generate(3, (index) {
            return TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Text('00/00/0000', style: cellStyle, textAlign: TextAlign.center),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Text('S/ 0', style: cellStyle, textAlign: TextAlign.center),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[100],
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProviderProfileScreen(),
                        ),
                      );
                    },
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'BIKE',
                            style: TextStyle(
                              color: BikeLabColors.limeGreen,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                            ),
                          ),
                          TextSpan(
                            text: 'LAB',
                            style: TextStyle(
                              color: BikeLabColors.mutedGreen,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'John Doe',
                    style: TextStyle(
                      color: BikeLabColors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'doe@gmail.com',
                    style: TextStyle(
                      color: BikeLabColors.black.withOpacity(0.7),
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(color: Colors.grey),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _buildDrawerItem(
                    icon: Icons.directions_bike,
                    title: 'Mis Vehiculos',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyVehiclesScreen(),
                        ),
                      );
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.add_circle_outline,
                    title: 'Agregar Vehiculos',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddVehicleScreen(),
                        ),
                      );
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.account_balance_wallet_outlined,
                    title: 'Ingresos',
                    onTap: () {
                      Navigator.pop(context);
                      // Ya estamos en ingresos
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.notifications_outlined,
                    title: 'Notificaciones',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NotificationsScreen(),
                        ),
                      );
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.settings_outlined,
                    title: 'Ajustes',
                    onTap: () {
                      Navigator.pop(context);
                      // Lógica para navegar a ajustes
                    },
                  ),
                ],
              ),
            ),
            const Divider(color: Colors.grey),
            _buildDrawerItem(
              icon: Icons.logout,
              title: 'Cerrar Sesión',
              onTap: () {
                Navigator.pop(context);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignInScreen(),
                  ),
                  (route) => false,
                );
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: BikeLabColors.black,
        size: 24,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: BikeLabColors.black,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
    );
  }
}
