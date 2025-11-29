import 'package:flutter/material.dart';
import '../theme/colors.dart';
import 'provider_registration_screen.dart';

class UserTypeSelectionScreen extends StatefulWidget {
  const UserTypeSelectionScreen({super.key});

  @override
  State<UserTypeSelectionScreen> createState() => _UserTypeSelectionScreenState();
}

class _UserTypeSelectionScreenState extends State<UserTypeSelectionScreen> {
  bool _isSelectedCyclist = false;
  bool _isSelectedRenter = false;

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
            child: Column(
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
                // Texto "SELECCIONA EL TIPO DE USUARIO"
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'SELECCIONA EL ',
                          style: TextStyle(
                            color: BikeLabColors.limeGreen,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                        TextSpan(
                          text: 'TIPO DE USUARIO',
                          style: TextStyle(
                            color: BikeLabColors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                // Opciones de tipo de usuario
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Opción CICLISTA
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isSelectedCyclist = !_isSelectedCyclist;
                            if (_isSelectedCyclist) {
                              _isSelectedRenter = false;
                            }
                          });
                          // Lógica para seleccionar ciclista
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                          width: 300,
                          padding: const EdgeInsets.symmetric(
                            vertical: 40,
                            horizontal: 20,
                          ),
                          decoration: BoxDecoration(
                            color: _isSelectedCyclist
                                ? BikeLabColors.limeGreen
                                : Colors.grey[700]?.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: _isSelectedCyclist
                                  ? BikeLabColors.limeGreen
                                  : Colors.grey[600]!,
                              width: 2,
                            ),
                          ),
                          child: Column(
                            children: [
                              Text(
                                'CICLISTA',
                                style: TextStyle(
                                  color: _isSelectedCyclist
                                      ? BikeLabColors.black
                                      : Colors.grey[400],
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Icon(
                                Icons.directions_bike,
                                size: 60,
                                color: _isSelectedCyclist
                                    ? BikeLabColors.black
                                    : Colors.grey[400],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      // Opción ARRENDATARIO
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProviderRegistrationScreen(),
                            ),
                          );
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                          width: 300,
                          padding: const EdgeInsets.symmetric(
                            vertical: 40,
                            horizontal: 20,
                          ),
                          decoration: BoxDecoration(
                            color: _isSelectedRenter
                                ? BikeLabColors.limeGreen
                                : Colors.grey[700]?.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: _isSelectedRenter
                                  ? BikeLabColors.limeGreen
                                  : Colors.grey[600]!,
                              width: 2,
                            ),
                          ),
                          child: Column(
                            children: [
                              Text(
                                'ARRENDATARIO',
                                style: TextStyle(
                                  color: _isSelectedRenter
                                      ? BikeLabColors.black
                                      : Colors.grey[400],
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Icon(
                                    Icons.person_outline,
                                    size: 60,
                                    color: _isSelectedRenter
                                        ? BikeLabColors.black
                                        : Colors.grey[400],
                                  ),
                                  Positioned(
                                    bottom: 5,
                                    right: 15,
                                    child: Icon(
                                      Icons.vpn_key,
                                      size: 30,
                                      color: _isSelectedRenter
                                          ? BikeLabColors.black
                                          : Colors.grey[400],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

