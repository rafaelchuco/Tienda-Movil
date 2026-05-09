import 'package:flutter/material.dart';

class RegisterProductScreen extends StatefulWidget {
  const RegisterProductScreen({super.key});

  @override
  State<RegisterProductScreen> createState() => _RegisterProductScreenState();
}

class _RegisterProductScreenState extends State<RegisterProductScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _stockController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Registro de Productos'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título
            const Text(
              'REGISTRO DE\nPRODUCTOS',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 40),
            
            // Campo 1: Nombre del producto
            _buildInputField(
              'Nombre del producto',
              _nameController,
              'Ingrese el nombre del producto',
            ),
            const SizedBox(height: 24),
            
            // Campo 2: Precio
            _buildInputField(
              'Precio',
              _priceController,
              'Ingrese el precio',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 24),
            
            // Campo 3: Descripción
            _buildInputField(
              'Descripción',
              _descriptionController,
              'Ingrese la descripción del producto',
              maxLines: 3,
            ),
            const SizedBox(height: 24),
            
            // Campo 4: Categoría
            _buildInputField(
              'Categoría',
              _categoryController,
              'Ingrese la categoría',
            ),
            const SizedBox(height: 24),
            
            // Campo 5: Stock
            _buildInputField(
              'Stock',
              _stockController,
              'Ingrese la cantidad en stock',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 40),
            
            // Botón GUARDAR
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Solo mostrar mensaje, sin lógica
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Producto guardado (sin lógica implementada)'),
                    ),
                  );
                  
                  // Limpiar campos
                  _clearFields();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4285F4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'GUARDAR',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(
    String label,
    TextEditingController controller,
    String hint, {
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
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
              bottom: BorderSide(
                color: Colors.grey.shade400,
                width: 1.0,
              ),
            ),
          ),
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            maxLines: maxLines,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey.shade500),
            ),
          ),
        ),
      ],
    );
  }

  void _clearFields() {
    _nameController.clear();
    _priceController.clear();
    _descriptionController.clear();
    _categoryController.clear();
    _stockController.clear();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    _categoryController.dispose();
    _stockController.dispose();
    super.dispose();
  }
}