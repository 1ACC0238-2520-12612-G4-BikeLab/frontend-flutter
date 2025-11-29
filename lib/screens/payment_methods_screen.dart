import 'package:flutter/material.dart';
import '../theme/colors.dart';
import 'provider_profile_screen.dart';
import 'sign_in_screen.dart';
import 'my_vehicles_screen.dart';
import 'provider_income_screen.dart';

class PaymentMethodsScreen extends StatefulWidget {
  const PaymentMethodsScreen({super.key});

  @override
  State<PaymentMethodsScreen> createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
  String? _selectedPaymentMethod; // 'yape_plin' or 'visa'
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expirationController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expirationController.dispose();
    _cvvController.dispose();
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
          // Título METODOS PAGO
          Center(
            child: RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'METODOS ',
                    style: TextStyle(
                      color: BikeLabColors.limeGreen,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                  TextSpan(
                    text: 'PAGO',
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
          const SizedBox(height: 12),
          // Icono de tarjeta
          const Icon(
            Icons.credit_card_outlined,
            color: BikeLabColors.white,
            size: 40,
          ),
          const SizedBox(height: 20),
          // Texto "Elige Un Metodo De Pago"
          const Text(
            'Elige Un Metodo De Pago',
            style: TextStyle(
              color: BikeLabColors.white,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 30),
          // Opciones de método de pago
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  // Opción Yape / Plin
                  _buildPaymentMethodOption(
                    value: 'yape_plin',
                    label: 'Yape / Plin',
                    isSelected: _selectedPaymentMethod == 'yape_plin',
                    onTap: () {
                      setState(() {
                        _selectedPaymentMethod = 'yape_plin';
                      });
                    },
                    showCardNumber: false,
                  ),
                  const SizedBox(height: 16),
                  // Opción Visa
                  _buildPaymentMethodOption(
                    value: 'visa',
                    label: 'VISA',
                    isSelected: _selectedPaymentMethod == 'visa',
                    onTap: () {
                      setState(() {
                        _selectedPaymentMethod = 'visa';
                      });
                    },
                    showCardNumber: true,
                    cardNumber: 'XXXX XXXX XXXX XXXX',
                  ),
                  // Formulario de tarjeta (solo si Visa está seleccionado)
                  if (_selectedPaymentMethod == 'visa') ...[
                    const SizedBox(height: 30),
                    // Campo Número de tarjeta
                    _buildCardInputField(
                      label: 'Numero de tarjeta',
                      controller: _cardNumberController,
                      icon: Icons.credit_card_outlined,
                      placeholder: '',
                    ),
                    const SizedBox(height: 24),
                    // Campo Expiración
                    _buildCardInputField(
                      label: 'Expiracion',
                      controller: _expirationController,
                      icon: Icons.calendar_today_outlined,
                      placeholder: '',
                    ),
                    const SizedBox(height: 24),
                    // Campo CVV
                    _buildCardInputField(
                      label: 'CVV',
                      controller: _cvvController,
                      icon: Icons.lock_outline,
                      placeholder: '',
                      isPassword: true,
                    ),
                  ],
                  const SizedBox(height: 40),
                  // Botón Save
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        // Lógica para guardar método de pago
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: BikeLabColors.limeGreen,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Save',
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

  Widget _buildPaymentMethodOption({
    required String value,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
    required bool showCardNumber,
    String? cardNumber,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: BikeLabColors.limeGreen,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            // Radio button
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected
                    ? BikeLabColors.limeGreen
                    : Colors.transparent,
                border: Border.all(
                  color: BikeLabColors.limeGreen,
                  width: 2,
                ),
              ),
            ),
            const SizedBox(width: 16),
            // Logo o icono (simplificado)
            if (label == 'Yape / Plin')
              Container(
                width: 40,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.purple[300],
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Center(
                  child: Text(
                    'Y',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            else if (label == 'VISA')
              Container(
                width: 50,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.blue[700],
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Center(
                  child: Text(
                    'VISA',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            const SizedBox(width: 16),
            // Texto y número de tarjeta
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      color: BikeLabColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (showCardNumber && cardNumber != null)
                    Text(
                      cardNumber,
                      style: const TextStyle(
                        color: BikeLabColors.white,
                        fontSize: 14,
                      ),
                    ),
                ],
              ),
            ),
            // Icono de chevron
            const Icon(
              Icons.keyboard_arrow_down,
              color: BikeLabColors.white,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardInputField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
    required String placeholder,
    bool isPassword = false,
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
          child: Row(
            children: [
              Icon(
                icon,
                color: BikeLabColors.white,
                size: 24,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextField(
                  controller: controller,
                  obscureText: isPassword,
                  style: const TextStyle(color: BikeLabColors.white),
                  decoration: InputDecoration(
                    hintText: placeholder,
                    hintStyle: TextStyle(
                      color: BikeLabColors.white.withOpacity(0.5),
                    ),
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
                  _buildDrawerItem(
                    icon: Icons.notifications_outlined,
                    title: 'Notificaciones',
                    onTap: () {
                      Navigator.pop(context);
                      // Lógica para navegar a notificaciones
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

