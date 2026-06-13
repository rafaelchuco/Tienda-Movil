import 'package:flutter/cupertino.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Detalle del Producto'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          child: const Icon(CupertinoIcons.heart),
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Imagen placeholder
              Container(
                width: double.infinity,
                height: 280,
                color: CupertinoColors.systemGrey5,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      CupertinoIcons.photo,
                      size: 64,
                      color: CupertinoColors.systemGrey2,
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Imagen del producto',
                      style: TextStyle(
                        color: CupertinoColors.systemGrey2,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Categoría
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: CupertinoColors.systemBlue.withAlpha(26),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'Electrónicos',
                        style: TextStyle(
                          fontSize: 13,
                          color: CupertinoColors.systemBlue,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Nombre
                    const Text(
                      'Nombre del Producto',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: CupertinoColors.label,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Precio y stock
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '\$99.99',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: CupertinoColors.systemBlue,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: CupertinoColors.systemGreen.withAlpha(26),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'En stock: 25',
                            style: TextStyle(
                              fontSize: 13,
                              color: CupertinoColors.systemGreen,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Descripción
                    const Text(
                      'Descripción',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: CupertinoColors.label,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Descripción detallada del producto. Aquí irá toda la información relevante sobre el producto, sus características, materiales, dimensiones y cualquier otro detalle importante para el cliente.',
                      style: TextStyle(
                        fontSize: 15,
                        color: CupertinoColors.secondaryLabel,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Info adicional
                    CupertinoListSection.insetGrouped(
                      header: const Text('Información'),
                      children: const [
                        CupertinoListTile(
                          title: Text('Categoría'),
                          additionalInfo: Text('Electrónicos'),
                          trailing: CupertinoListTileChevron(),
                        ),
                        CupertinoListTile(
                          title: Text('Stock disponible'),
                          additionalInfo: Text('25 unidades'),
                        ),
                        CupertinoListTile(
                          title: Text('Código de producto'),
                          additionalInfo: Text('SKU-001'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Botón agregar al carrito
                    SizedBox(
                      width: double.infinity,
                      child: CupertinoButton.filled(
                        onPressed: () {},
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(CupertinoIcons.cart_badge_plus),
                            SizedBox(width: 8),
                            Text('Agregar al carrito'),
                          ],
                        ),
                      ),
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
}
