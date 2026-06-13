import 'package:flutter/cupertino.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Ajustes'),
      ),
      child: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 20),
            CupertinoListSection.insetGrouped(
              header: const Text('Preferencias'),
              children: const [
                CupertinoListTile(
                  leading: Icon(
                    CupertinoIcons.bell_fill,
                    color: CupertinoColors.systemRed,
                  ),
                  title: Text('Notificaciones'),
                  trailing: CupertinoListTileChevron(),
                ),
                CupertinoListTile(
                  leading: Icon(
                    CupertinoIcons.globe,
                    color: CupertinoColors.systemBlue,
                  ),
                  title: Text('Idioma'),
                  additionalInfo: Text('Español'),
                  trailing: CupertinoListTileChevron(),
                ),
                CupertinoListTile(
                  leading: Icon(
                    CupertinoIcons.moon_fill,
                    color: CupertinoColors.systemIndigo,
                  ),
                  title: Text('Apariencia'),
                  additionalInfo: Text('Automática'),
                  trailing: CupertinoListTileChevron(),
                ),
              ],
            ),
            CupertinoListSection.insetGrouped(
              header: const Text('Cuenta'),
              children: [
                const CupertinoListTile(
                  leading: Icon(
                    CupertinoIcons.lock_fill,
                    color: CupertinoColors.systemGrey,
                  ),
                  title: Text('Privacidad'),
                  trailing: CupertinoListTileChevron(),
                ),
                CupertinoListTile(
                  leading: const Icon(
                    CupertinoIcons.square_arrow_right,
                    color: CupertinoColors.destructiveRed,
                  ),
                  title: const Text(
                    'Cerrar sesión',
                    style: TextStyle(color: CupertinoColors.destructiveRed),
                  ),
                  onTap: () => _confirmLogout(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _confirmLogout(BuildContext context) {
    showCupertinoDialog<void>(
      context: context,
      builder: (ctx) => CupertinoAlertDialog(
        title: const Text('Cerrar sesión'),
        content: const Text('¿Estás seguro de que quieres cerrar sesión?'),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancelar'),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(ctx);
              Navigator.of(context, rootNavigator: true)
                  .pushReplacementNamed('/login');
            },
            child: const Text('Cerrar sesión'),
          ),
        ],
      ),
    );
  }
}
