import 'package:flutter/material.dart';
import '../theme/colors.dart';
import 'add_vehicle_screen.dart';

class ProviderRegistrationScreen extends StatefulWidget {
  const ProviderRegistrationScreen({super.key});

  @override
  State<ProviderRegistrationScreen> createState() => _ProviderRegistrationScreenState();
}

class _ProviderRegistrationScreenState extends State<ProviderRegistrationScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _dniRucController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneController.dispose();
    _dniRucController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BikeLabColors.black,
      body: Row(
        children: [
          // Sidebar verde lima
          Container(
            width: MediaQuery.of(context).size.width * 0.12,
            color: BikeLabColors.limeGreen,
          ),
          // Contenido principal
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  // Logo BIKELAB centrado
                  Center(
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'BIKE',
                            style: TextStyle(
                              color: BikeLabColors.limeGreen,
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                            ),
                          ),
                          TextSpan(
                            text: 'LAB',
                            style: TextStyle(
                              color: BikeLabColors.mutedGreen,
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Título REGISTRO
                  const Center(
                    child: Text(
                      'REGISTRO',
                      style: TextStyle(
                        color: BikeLabColors.limeGreen,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 60),
                  // Formulario
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Campo Nombre completo
                      _buildInputField(
                        label: 'Nombre completo',
                        controller: _fullNameController,
                        placeholder: 'Nombre, apellido',
                        isPassword: false,
                      ),
                      const SizedBox(height: 24),
                      // Campo Celular
                      _buildInputField(
                        label: 'Celular',
                        controller: _phoneController,
                        placeholder: '',
                        isPassword: false,
                      ),
                      const SizedBox(height: 24),
                      // Campo DNI / RUC
                      _buildInputField(
                        label: 'DNI / RUC',
                        controller: _dniRucController,
                        placeholder: '',
                        isPassword: false,
                      ),
                      const SizedBox(height: 48),
                      // Botón Siguiente
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            _showLocationPermissionDialog(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: BikeLabColors.limeGreen,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Siguiente',
                            style: TextStyle(
                              color: BikeLabColors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showLocationPermissionDialog(BuildContext context) {
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
          title: const Row(
            children: [
              Icon(
                Icons.location_on,
                color: BikeLabColors.limeGreen,
                size: 28,
              ),
              SizedBox(width: 12),
              Text(
                'Permiso de Ubicación',
                style: TextStyle(
                  color: BikeLabColors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          content: const Text(
            'La aplicación necesita acceder a la ubicación de tu dispositivo para proporcionar mejores servicios.',
            style: TextStyle(
              color: BikeLabColors.white,
              fontSize: 16,
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
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddVehicleScreen(),
                  ),
                );
                // Aquí se puede agregar la lógica para solicitar el permiso real
                // Por ejemplo: PermissionHandler.requestLocationPermission()
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: BikeLabColors.limeGreen,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Permitir',
                style: TextStyle(
                  color: BikeLabColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    required String placeholder,
    required bool isPassword,
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
            obscureText: isPassword,
            style: const TextStyle(color: BikeLabColors.white),
            decoration: InputDecoration(
              hintText: placeholder,
              hintStyle: TextStyle(color: BikeLabColors.white.withOpacity(0.5)),
              filled: true,
              fillColor: Colors.transparent,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: BikeLabColors.limeGreen,
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: BikeLabColors.limeGreen,
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

