import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Título
              const Text(
                'MENU',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 50),
              
              // Opciones del menú
              Expanded(
                child: Column(
                  children: [
                    // Home
                    _MenuOption(
                      text: 'Home',
                      onTap: () {
                        // Solo navegar, sin lógica
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Navegando a Home')),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    
                    // Profile
                    _MenuOption(
                      text: 'Profile',
                      onTap: () {
                        Navigator.pushNamed(context, '/profile');
                      },
                    ),
                    const SizedBox(height: 20),
                    
                    // Registrar Producto
                    _MenuOption(
                      text: 'Registrar Producto',
                      onTap: () {
                        Navigator.pushNamed(context, '/register-product');
                      },
                    ),
                    const SizedBox(height: 20),
                    
                    // Listado de Productos
                    _MenuOption(
                      text: 'Lista de Productos',
                      onTap: () {
                        Navigator.pushNamed(context, '/product-list');
                      },
                    ),
                    const SizedBox(height: 20),
                    
                    // Settings
                    _MenuOption(
                      text: 'Settings',
                      onTap: () {
                        // Solo navegar, sin lógica
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Navegando a Settings')),
                        );
                      },
                    ),
                    const SizedBox(height: 40),
                    
                    // Logout
                    _MenuOption(
                      text: 'Logout',
                      onTap: () => _logout(context),
                      isLogout: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _logout(BuildContext context) {
    // Función flecha para logout
    Navigator.pushReplacementNamed(context, '/login');
  }
}

class _MenuOption extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isLogout;

  const _MenuOption({
    required this.text,
    required this.onTap,
    this.isLogout = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
          color: isLogout ? Colors.red.shade50 : Colors.grey.shade50,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: isLogout ? Colors.red.shade700 : Colors.black87,
          ),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}