import 'package:flutter/cupertino.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Items de ejemplo para el template
    final items = [
      {'name': 'Producto Ejemplo 1', 'price': '\$29.99', 'qty': '2'},
      {'name': 'Producto Ejemplo 2', 'price': '\$15.00', 'qty': '1'},
      {'name': 'Producto Ejemplo 3', 'price': '\$49.99', 'qty': '3'},
    ];

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Carrito'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          child: const Text(
            'Vaciar',
            style: TextStyle(color: CupertinoColors.destructiveRed),
          ),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            // Lista de productos en carrito
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return _CartItem(
                    name: item['name']!,
                    price: item['price']!,
                    qty: item['qty']!,
                  );
                },
              ),
            ),

            // Resumen y botón de pago
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: CupertinoColors.systemBackground,
                border: Border(
                  top: BorderSide(color: CupertinoColors.separator),
                ),
              ),
              child: Column(
                children: [
                  // Subtotal
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Subtotal (6 items)',
                        style: TextStyle(
                          fontSize: 15,
                          color: CupertinoColors.secondaryLabel,
                        ),
                      ),
                      Text(
                        '\$194.94',
                        style: TextStyle(
                          fontSize: 15,
                          color: CupertinoColors.secondaryLabel,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Envío
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Envío',
                        style: TextStyle(
                          fontSize: 15,
                          color: CupertinoColors.secondaryLabel,
                        ),
                      ),
                      Text(
                        'Gratis',
                        style: TextStyle(
                          fontSize: 15,
                          color: CupertinoColors.systemGreen,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const SizedBox(
                    height: 1,
                    child: ColoredBox(color: CupertinoColors.separator),
                  ),
                  const SizedBox(height: 12),
                  // Total
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Total',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: CupertinoColors.label,
                        ),
                      ),
                      Text(
                        '\$194.94',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: CupertinoColors.systemBlue,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: CupertinoButton.filled(
                      onPressed: () {},
                      child: const Text('Proceder al pago'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CartItem extends StatelessWidget {
  final String name;
  final String price;
  final String qty;

  const _CartItem({
    required this.name,
    required this.price,
    required this.qty,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: CupertinoColors.separator),
        ),
      ),
      child: Row(
        children: [
          // Imagen placeholder
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: CupertinoColors.systemGrey6,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              CupertinoIcons.photo,
              color: CupertinoColors.systemGrey2,
              size: 28,
            ),
          ),
          const SizedBox(width: 12),

          // Nombre y precio
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: CupertinoColors.label,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 15,
                    color: CupertinoColors.systemBlue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          // Controles de cantidad
          Row(
            children: [
              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                child: const Icon(
                  CupertinoIcons.minus_circle,
                  color: CupertinoColors.systemGrey,
                  size: 28,
                ),
              ),
              Text(
                qty,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: CupertinoColors.label,
                ),
              ),
              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                child: const Icon(
                  CupertinoIcons.plus_circle_fill,
                  color: CupertinoColors.systemBlue,
                  size: 28,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
