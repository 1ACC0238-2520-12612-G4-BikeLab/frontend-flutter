import 'package:flutter/material.dart';
import '../theme/colors.dart';
import 'add_vehicle_screen.dart';
import 'my_vehicles_screen.dart';
import 'provider_income_screen.dart';
import 'payment_methods_screen.dart';
import 'notifications_screen.dart';
import 'sign_in_screen.dart';

class ProviderProfileScreen extends StatefulWidget {
  const ProviderProfileScreen({super.key});

  @override
  State<ProviderProfileScreen> createState() => _ProviderProfileScreenState();
}

class _ProviderProfileScreenState extends State<ProviderProfileScreen> {
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
                // Menú hamburguesa
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
                // Icono de usuario (clickeable)
                IconButton(
                  icon: const Icon(
                    Icons.person_outline,
                    color: BikeLabColors.white,
                    size: 28,
                  ),
                  onPressed: () {
                    // Ya estamos en el perfil, no hacer nada
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Título MI PERFIL
          Center(
            child: RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'MI ',
                    style: TextStyle(
                      color: BikeLabColors.limeGreen,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                  TextSpan(
                    text: 'PERFIL',
                    style: TextStyle(
                      color: BikeLabColors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          // Card de información del perfil
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.white,
                    width: 1,
                  ),
                ),
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Logo y nombre
                    Row(
                      children: [
                        // Logo circular
                        Stack(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue[100],
                              ),
                              child: Center(
                                child: RichText(
                                  text: const TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'BIKE',
                                        style: TextStyle(
                                          color: BikeLabColors.limeGreen,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'LAB',
                                        style: TextStyle(
                                          color: BikeLabColors.mutedGreen,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey[800],
                                ),
                                child: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                  size: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'John ',
                                      style: TextStyle(
                                        color: BikeLabColors.black,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Doe',
                                      style: TextStyle(
                                        color: BikeLabColors.limeGreen,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                'doe@gmail.com',
                                style: TextStyle(
                                  color: BikeLabColors.black,
                                  fontSize: 14,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Colors.grey[800],
                            size: 20,
                          ),
                          onPressed: () {
                            // Lógica para editar
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    const Divider(color: Colors.grey),
                    const SizedBox(height: 24),
                    // Nombre
                    _buildInfoRow(
                      label: 'Nombre',
                      value: 'No definido',
                    ),
                    const SizedBox(height: 16),
                    // Número
                    _buildInfoRow(
                      label: 'Número',
                      value: 'No definido',
                    ),
                    const SizedBox(height: 16),
                    // DNI / RUC
                    _buildInfoRow(
                      label: 'DNI / RUC',
                      value: 'XXXXXX',
                    ),
                    const SizedBox(height: 24),
                    const Divider(color: Colors.grey),
                    const SizedBox(height: 24),
                    // Mis Vehiculos
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Mis Vehiculos',
                          style: TextStyle(
                            color: BikeLabColors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AddVehicleScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'Agregar',
                            style: TextStyle(
                              color: BikeLabColors.limeGreen,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Vehiculos Arrendados
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Vehiculos Arrendados',
                          style: TextStyle(
                            color: BikeLabColors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Text(
                          '0',
                          style: TextStyle(
                            color: BikeLabColors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    // Botones
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const PaymentMethodsScreen(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: BikeLabColors.limeGreen,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            child: const Text(
                              'Metodos de Pago',
                              style: TextStyle(
                                color: BikeLabColors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignInScreen(),
                                ),
                                (route) => false,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF1E8449),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side: const BorderSide(
                                  color: Color(0xFF1E8449),
                                  width: 2,
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            child: const Text(
                              'Cerrar Sesión',
                              style: TextStyle(
                                color: BikeLabColors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow({
    required String label,
    required String value,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: BikeLabColors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: BikeLabColors.black,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[100],
      child: SafeArea(
        child: Column(
          children: [
            // Header con logo y perfil
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  // Logo BIKELAB (clickeable)
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushReplacement(
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
                  // Nombre
                  const Text(
                    'John Doe',
                    style: TextStyle(
                      color: BikeLabColors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Email
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
            // Opciones del menú
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  // Mis Vehiculos
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
                  // Agregar Vehiculos
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
                  // Ingresos
                  _buildDrawerItem(
                    icon: Icons.account_balance_wallet_outlined,
                    title: 'Ingresos',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProviderIncomeScreen(),
                        ),
                      );
                    },
                  ),
                  // Notificaciones
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
                  // Ajustes
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
            // Cerrar Sesión
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

