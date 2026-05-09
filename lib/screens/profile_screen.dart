import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();

  /// Inicialización de datos del usuario
  /// Usuario: Rafael Chucco
  /// Email: rafael@gmail.com
  /// Fecha de nacimiento: 19 de agosto de 2006
  /// Miembro desde: Febrero 2023
  @override
  void initState() {
    super.initState();
    // Datos pre-cargados del usuario Rafael Chucco
    _firstNameController.text = 'Rafael';
    _lastNameController.text = 'Chucco';
    _birthDateController.text = '19/08/2006';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Perfil'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Foto de perfil (placeholder)
            const CircleAvatar(
              radius: 60,
              backgroundColor: Color(0xFF4285F4),
              child: Icon(Icons.person, size: 60, color: Colors.white),
            ),
            const SizedBox(height: 20),

            // Título
            const Text(
              'Mi Perfil',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 40),

            // Nombre
            _buildProfileField(
              'Nombre',
              _firstNameController,
              'Ingrese su nombre',
            ),
            const SizedBox(height: 24),

            // Apellidos
            _buildProfileField(
              'Apellidos',
              _lastNameController,
              'Ingrese sus apellidos',
            ),
            const SizedBox(height: 24),

            // Fecha de nacimiento
            _buildProfileField(
              'Fecha de nacimiento',
              _birthDateController,
              'DD/MM/AAAA',
              readOnly: true,
              onTap: () => _selectBirthDate(context),
            ),
            const SizedBox(height: 40),

            // Botón Guardar
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Solo mostrar mensaje, sin lógica
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Perfil actualizado (sin lógica implementada)',
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4285F4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'GUARDAR CAMBIOS',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Información adicional - Usuario Rafael Chucco
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Información de la cuenta',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Email: rafael@gmail.com (correo del usuario)
                  _buildInfoRow('Email', 'rafael@gmail.com'),
                  const SizedBox(height: 8),
                  // Miembro desde: Febrero 2023
                  _buildInfoRow('Miembro desde', 'Febrero 2023'),
                  const SizedBox(height: 8),
                  _buildInfoRow('Productos registrados', '12'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileField(
    String label,
    TextEditingController controller,
    String hint, {
    bool readOnly = false,
    VoidCallback? onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black54,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey.shade400, width: 1.0),
            ),
          ),
          child: TextField(
            controller: controller,
            readOnly: readOnly,
            onTap: onTap,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey.shade500),
              suffixIcon: readOnly
                  ? const Icon(Icons.calendar_today, size: 20)
                  : null,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  /// Selector de fecha de nacimiento
  /// Fecha inicial: 19 de agosto de 2006 (Cumpleaños de Rafael Chucco)
  Future<void> _selectBirthDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2006, 8, 19),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        _birthDateController.text =
            '${picked.day.toString().padLeft(2, '0')}/'
            '${picked.month.toString().padLeft(2, '0')}/'
            '${picked.year}';
      });
    }
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _birthDateController.dispose();
    super.dispose();
  }
}
