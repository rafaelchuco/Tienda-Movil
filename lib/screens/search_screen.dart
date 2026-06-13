import 'package:flutter/cupertino.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Búsqueda'),
      ),
      child: SafeArea(
        child: Column(
          children: [
            // Barra de búsqueda
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
              child: CupertinoSearchTextField(
                placeholder: 'Buscar productos...',
                onChanged: (_) {},
                onSubmitted: (_) {},
              ),
            ),

            // Filtros rápidos
            SizedBox(
              height: 44,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _FilterChip(label: 'Todos', isSelected: true),
                  _FilterChip(label: 'Electrónicos'),
                  _FilterChip(label: 'Ropa'),
                  _FilterChip(label: 'Alimentos'),
                  _FilterChip(label: 'Hogar'),
                  _FilterChip(label: 'Juguetes'),
                ],
              ),
            ),

            const SizedBox(height: 8),

            // Resultados (estado vacío / placeholder)
            Expanded(
              child: ListView(
                children: [
                  // Sección: Búsquedas recientes
                  CupertinoListSection.insetGrouped(
                    header: const Text('BÚSQUEDAS RECIENTES'),
                    children: [
                      _RecentSearchTile(query: 'iPhone 13'),
                      _RecentSearchTile(query: 'Zapatillas deportivas'),
                      _RecentSearchTile(query: 'Auriculares bluetooth'),
                      _RecentSearchTile(query: 'Laptop gaming'),
                    ],
                  ),

                  // Sección: Categorías populares
                  CupertinoListSection.insetGrouped(
                    header: const Text('CATEGORÍAS POPULARES'),
                    children: const [
                      CupertinoListTile(
                        leading: Icon(
                          CupertinoIcons.device_phone_portrait,
                          color: CupertinoColors.systemBlue,
                        ),
                        title: Text('Electrónicos'),
                        additionalInfo: Text('128 productos'),
                        trailing: CupertinoListTileChevron(),
                      ),
                      CupertinoListTile(
                        leading: Icon(
                          CupertinoIcons.bag_fill,
                          color: CupertinoColors.systemPink,
                        ),
                        title: Text('Ropa y Accesorios'),
                        additionalInfo: Text('94 productos'),
                        trailing: CupertinoListTileChevron(),
                      ),
                      CupertinoListTile(
                        leading: Icon(
                          CupertinoIcons.house_fill,
                          color: CupertinoColors.systemOrange,
                        ),
                        title: Text('Hogar'),
                        additionalInfo: Text('57 productos'),
                        trailing: CupertinoListTileChevron(),
                      ),
                      CupertinoListTile(
                        leading: Icon(
                          CupertinoIcons.game_controller_solid,
                          color: CupertinoColors.systemPurple,
                        ),
                        title: Text('Juguetes'),
                        additionalInfo: Text('33 productos'),
                        trailing: CupertinoListTileChevron(),
                      ),
                    ],
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

class _FilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;

  const _FilterChip({required this.label, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected
              ? CupertinoColors.systemBlue
              : CupertinoColors.systemGrey6,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: isSelected
                ? CupertinoColors.white
                : CupertinoColors.label,
          ),
        ),
      ),
    );
  }
}

class _RecentSearchTile extends StatelessWidget {
  final String query;

  const _RecentSearchTile({required this.query});

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(
      leading: const Icon(
        CupertinoIcons.clock,
        color: CupertinoColors.systemGrey,
      ),
      title: Text(query),
      trailing: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () {},
        child: const Icon(
          CupertinoIcons.xmark_circle_fill,
          color: CupertinoColors.systemGrey3,
          size: 20,
        ),
      ),
      onTap: () {},
    );
  }
}
