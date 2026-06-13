import 'package:flutter/cupertino.dart';
import '../utils/cupertino_dialogs.dart';
import 'register_product_screen.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
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
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Productos'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          minimumSize: Size.zero,
          onPressed: () {
            Navigator.of(context).push(
              CupertinoPageRoute<void>(
                builder: (_) => const RegisterProductScreen(),
                title: 'Nuevo producto',
              ),
            );
          },
          child: const Icon(CupertinoIcons.add, size: 28),
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 16, 20, 8),
              child: Text(
                'Items',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.label,
                ),
              ),
            ),
            Expanded(
              child: _products.isEmpty
                  ? const Center(
                      child: Text(
                        'No hay productos registrados',
                        style: TextStyle(
                          fontSize: 17,
                          color: CupertinoColors.secondaryLabel,
                        ),
                      ),
                    )
                  : ListView.builder(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 20.0),
                      itemCount: _products.length,
                      itemBuilder: (context, index) {
                        final product = _products[index];
                        return _ProductItem(
                          name: product['name']!,
                          price: product['price']!,
                          description: product['description']!,
                          category: product['category']!,
                          onTap: () {
                            showInfoDialog(
                              context,
                              'Seleccionado: ${product['name']}',
                            );
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: CupertinoColors.systemGrey6,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      name,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: CupertinoColors.label,
                      ),
                    ),
                  ),
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.systemBlue,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 14,
                  color: CupertinoColors.secondaryLabel,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Categoría: $category',
                style: const TextStyle(
                  fontSize: 12,
                  color: CupertinoColors.tertiaryLabel,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
