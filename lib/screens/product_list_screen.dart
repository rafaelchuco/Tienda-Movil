import 'package:flutter/material.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  // Lista de productos de ejemplo (sin lógica real)
  final List<Map<String, String>> _products = [
    {
      'name': 'Producto 1',
      'price': '\$25.99',
      'description': 'Descripción del producto 1',
      'category': 'Categoría A',
    },
    {
      'name': 'Producto 2', 
      'price': '\$45.50',
      'description': 'Descripción del producto 2',
      'category': 'Categoría B',
    },
    {
      'name': 'Producto 3',
      'price': '\$12.99',
      'description': 'Descripción del producto 3',
      'category': 'Categoría A',
    },
    {
      'name': 'Producto 4',
      'price': '\$89.99',
      'description': 'Descripción del producto 4',
      'category': 'Categoría C',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Lista de Productos'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Encabezado
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Items',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          
          // Lista de productos
          Expanded(
            child: _products.isEmpty
                ? const Center(
                    child: Text(
                      'No hay productos registrados',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    itemCount: _products.length,
                    itemBuilder: (context, index) {
                      final product = _products[index];
                      return _ProductItem(
                        name: product['name']!,
                        price: product['price']!,
                        description: product['description']!,
                        category: product['category']!,
                        onTap: () {
                          // Sin lógica, solo mostrar mensaje
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Seleccionado: ${product['name']}'),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
      
      // Botón flotante para agregar producto
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/register-product');
        },
        backgroundColor: const Color(0xFF4285F4),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

class _ProductItem extends StatelessWidget {
  final String name;
  final String price;
  final String description;
  final String category;
  final VoidCallback onTap;

  const _ProductItem({
    required this.name,
    required this.price,
    required this.description,
    required this.category,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey.shade50,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      price,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF4285F4),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Categoría: $category',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade500,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}