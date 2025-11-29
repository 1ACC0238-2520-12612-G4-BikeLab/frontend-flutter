import 'package:flutter/material.dart';
import '../theme/colors.dart';
import 'my_vehicles_screen.dart';
import 'provider_profile_screen.dart';
import 'provider_income_screen.dart';
import 'notifications_screen.dart';
import 'sign_in_screen.dart';

class AddVehicleScreen extends StatefulWidget {
  const AddVehicleScreen({super.key});

  @override
  State<AddVehicleScreen> createState() => _AddVehicleScreenState();
}

class _AddVehicleScreenState extends State<AddVehicleScreen> {
  String? _selectedVehicleType; // 'scooter' or 'bicycle'
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _brandModelController = TextEditingController();
  final TextEditingController _pricePerHourController = TextEditingController();
  final TextEditingController _currentLocationController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _brandModelController.dispose();
    _pricePerHourController.dispose();
    _currentLocationController.dispose();
    super.dispose();
  }

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
                // Título AGREGAR VEHÍCULO
                const Center(
                  child: Text(
                    'AGREGAR VEHÍCULO',
                    style: TextStyle(
                      color: BikeLabColors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                // Selección de tipo de vehículo
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Botón Scooter
                      Expanded(
                        child: _buildVehicleTypeButton(
                          type: 'scooter',
                          icon: Icons.two_wheeler,
                          label: 'Scooter',
                          isSelected: _selectedVehicleType == 'scooter',
                          onTap: () {
                            setState(() {
                              _selectedVehicleType = 'scooter';
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Botón Bicicleta
                      Expanded(
                        child: _buildVehicleTypeButton(
                          type: 'bicycle',
                          icon: Icons.directions_bike,
                          label: 'Bicicleta',
                          isSelected: _selectedVehicleType == 'bicycle',
                          onTap: () {
                            setState(() {
                              _selectedVehicleType = 'bicycle';
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Botón "Otro" para más opciones
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            _showOtherVehicleTypesDialog(context);
                          },
                          child: Container(
                            height: 120,
                            decoration: BoxDecoration(
                              color: Colors.grey[800]?.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: Colors.grey[600]!,
                                width: 2,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add_circle_outline,
                                  size: 50,
                                  color: Colors.grey[400],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Otro',
                                  style: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                // Línea divisoria
                Container(
                  height: 1,
                  color: Colors.grey[700],
                  margin: const EdgeInsets.symmetric(horizontal: 32.0),
                ),
                const SizedBox(height: 20),
                // Título DETALLES
                const Center(
                  child: Text(
                    'DETALLES',
                    style: TextStyle(
                      color: BikeLabColors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                // Formulario
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Column(
                      children: [
                        // Campo Título
                        _buildInputField(
                          label: 'Titulo',
                          controller: _titleController,
                          placeholder: '',
                        ),
                        const SizedBox(height: 24),
                        // Campo Marca / Modelo
                        _buildInputField(
                          label: 'Marca / Modelo',
                          controller: _brandModelController,
                          placeholder: '',
                        ),
                        const SizedBox(height: 24),
                        // Campo Precio por hora
                        _buildInputField(
                          label: 'Precio por hora',
                          controller: _pricePerHourController,
                          placeholder: '',
                        ),
                        const SizedBox(height: 24),
                        // Campo Ubicación actual
                        _buildInputField(
                          label: 'Ubicación actual',
                          controller: _currentLocationController,
                          placeholder: '',
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
                // Botón Guardar
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        // Lógica para guardar vehículo
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: BikeLabColors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'GUARDAR',
                        style: TextStyle(
                          color: BikeLabColors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
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
            // Header con logo y perfil
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  // Logo BIKELAB (clickeable para ir al perfil)
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
                      // Ya estamos en Agregar Vehiculos, no hacer nada
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

  void _showOtherVehicleTypesDialog(BuildContext context) {
    final otherTypes = [
      {'type': 'motorcycle', 'icon': Icons.motorcycle, 'label': 'Motocicleta'},
      {'type': 'skateboard', 'icon': Icons.skateboarding, 'label': 'Skateboard'},
      {'type': 'electric_bike', 'icon': Icons.electric_bike, 'label': 'Bici Eléctrica'},
      // Puedes agregar más tipos aquí fácilmente
    ];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey[900],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(
              color: BikeLabColors.limeGreen,
              width: 2,
            ),
          ),
          title: const Text(
            'Otros Tipos de Vehículos',
            style: TextStyle(
              color: BikeLabColors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: otherTypes.length,
              itemBuilder: (context, index) {
                final vehicle = otherTypes[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedVehicleType = vehicle['type'] as String;
                      });
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey[800]?.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.grey[600]!,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            vehicle['icon'] as IconData,
                            color: BikeLabColors.limeGreen,
                            size: 32,
                          ),
                          const SizedBox(width: 16),
                          Text(
                            vehicle['label'] as String,
                            style: const TextStyle(
                              color: BikeLabColors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancelar',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildVehicleTypeButton({
    required String type,
    required IconData icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: isSelected
              ? BikeLabColors.limeGreen
              : Colors.grey[800]?.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? BikeLabColors.limeGreen
                : Colors.grey[600]!,
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50,
              color: isSelected
                  ? BikeLabColors.black
                  : Colors.grey[400],
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                color: isSelected
                    ? BikeLabColors.black
                    : Colors.grey[400],
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    required String placeholder,
  }) {
    return Row(
      children: [
        SizedBox(
          width: 150,
          child: Text(
            label,
            style: const TextStyle(
              color: BikeLabColors.white,
              fontSize: 16,
            ),
          ),
        ),
        Expanded(
          child: TextField(
            controller: controller,
            style: const TextStyle(color: BikeLabColors.white),
            decoration: InputDecoration(
              hintText: placeholder,
              hintStyle: TextStyle(color: BikeLabColors.white.withOpacity(0.5)),
              filled: true,
              fillColor: Colors.transparent,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: BikeLabColors.white,
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: BikeLabColors.white,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: BikeLabColors.limeGreen,
                  width: 2,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

