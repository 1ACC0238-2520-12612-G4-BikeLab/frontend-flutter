import 'package:flutter/material.dart';
import '../theme/colors.dart';
import 'provider_profile_screen.dart';
import 'my_vehicles_screen.dart';
import 'provider_income_screen.dart';
import 'add_vehicle_screen.dart';
import 'sign_in_screen.dart';

class NotificationItem {
  final String id;
  final String sender;
  final String message;
  final String timestamp;
  final bool isFromBikeLab;

  NotificationItem({
    required this.id,
    required this.sender,
    required this.message,
    required this.timestamp,
    this.isFromBikeLab = false,
  });
}

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  List<NotificationItem> _notifications = [
    NotificationItem(
      id: '1',
      sender: 'BIKELAB - CORP',
      message: 'Te agradecemos el preferirnos como tu plataforma de confianza para el alquiler de vehículos. Esperamos seguir brindándote el mejor servicio.',
      timestamp: '9:41 AM',
      isFromBikeLab: true,
    ),
    NotificationItem(
      id: '2',
      sender: 'BIKELAB - CORP',
      message: 'Mejora tu seguridad utilizando métodos de pago verificados y mantén tus datos actualizados en tu perfil.',
      timestamp: '9:41 AM',
      isFromBikeLab: true,
    ),
  ];

  void _deleteNotification(String id) {
    setState(() {
      _notifications.removeWhere((notification) => notification.id == id);
    });
  }

  void _showNotificationDetail(NotificationItem notification) {
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
          title: Row(
            children: [
              // Logo BIKELAB pequeño
              Container(
                width: 40,
                height: 40,
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
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                        TextSpan(
                          text: 'LAB',
                          style: TextStyle(
                            color: BikeLabColors.mutedGreen,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notification.sender,
                      style: const TextStyle(
                        color: BikeLabColors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      notification.timestamp,
                      style: TextStyle(
                        color: BikeLabColors.white.withOpacity(0.7),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          content: Text(
            notification.message,
            style: const TextStyle(
              color: BikeLabColors.white,
              fontSize: 16,
              height: 1.5,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cerrar',
                style: TextStyle(
                  color: BikeLabColors.limeGreen,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        );
      },
    );
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
          // Título NOTIFICACIONES
          const Center(
            child: Text(
              'NOTIFICACIONES',
              style: TextStyle(
                color: BikeLabColors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Línea divisoria
          Container(
            height: 1,
            color: BikeLabColors.limeGreen,
            margin: const EdgeInsets.symmetric(horizontal: 24.0),
          ),
          const SizedBox(height: 20),
          // Lista de notificaciones
          Expanded(
            child: _notifications.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.notifications_none,
                          size: 80,
                          color: Colors.grey[600],
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'No tienes notificaciones',
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    itemCount: _notifications.length,
                    itemBuilder: (context, index) {
                      final notification = _notifications[index];
                      return _buildNotificationCard(notification);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationCard(NotificationItem notification) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[800]?.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey[700]!,
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar (Logo BIKELAB)
          Container(
            width: 50,
            height: 50,
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
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                    TextSpan(
                      text: 'LAB',
                      style: TextStyle(
                        color: BikeLabColors.mutedGreen,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          // Contenido de la notificación (clickeable)
          Expanded(
            child: GestureDetector(
              onTap: () {
                _showNotificationDetail(notification);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notification.sender,
                    style: const TextStyle(
                      color: BikeLabColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    notification.message,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: BikeLabColors.white.withOpacity(0.8),
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    notification.timestamp,
                    style: TextStyle(
                      color: BikeLabColors.white.withOpacity(0.6),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Icono de eliminar
          IconButton(
            icon: const Icon(
              Icons.delete_outline,
              color: BikeLabColors.white,
              size: 24,
            ),
            onPressed: () {
              _deleteNotification(notification.id);
            },
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
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
                      // Ya estamos en notificaciones
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

