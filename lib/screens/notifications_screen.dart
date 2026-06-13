import 'package:flutter/cupertino.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Notificaciones'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          child: const Text('Leer todo'),
        ),
      ),
      child: SafeArea(
        child: ListView(
          children: [
            // Grupo: Hoy
            CupertinoListSection.insetGrouped(
              header: const Text('HOY'),
              children: const [
                _NotificationTile(
                  icon: CupertinoIcons.cart_fill,
                  iconColor: CupertinoColors.systemGreen,
                  title: 'Pedido confirmado',
                  subtitle: 'Tu pedido #1042 ha sido confirmado.',
                  time: 'Hace 10 min',
                  isUnread: true,
                ),
                _NotificationTile(
                  icon: CupertinoIcons.cube_box_fill,
                  iconColor: CupertinoColors.systemBlue,
                  title: 'Stock bajo',
                  subtitle: 'Producto Ejemplo 2 tiene solo 3 unidades.',
                  time: 'Hace 1 hora',
                  isUnread: true,
                ),
                _NotificationTile(
                  icon: CupertinoIcons.star_fill,
                  iconColor: CupertinoColors.systemOrange,
                  title: 'Nueva valoración',
                  subtitle: 'Un cliente calificó con 5 estrellas.',
                  time: 'Hace 3 horas',
                  isUnread: false,
                ),
              ],
            ),

            // Grupo: Ayer
            CupertinoListSection.insetGrouped(
              header: const Text('AYER'),
              children: const [
                _NotificationTile(
                  icon: CupertinoIcons.tag_fill,
                  iconColor: CupertinoColors.systemPurple,
                  title: 'Promoción activa',
                  subtitle: 'Tu descuento del 10% está activo hasta mañana.',
                  time: 'Ayer 14:30',
                  isUnread: false,
                ),
                _NotificationTile(
                  icon: CupertinoIcons.person_badge_plus,
                  iconColor: CupertinoColors.systemTeal,
                  title: 'Nuevo cliente',
                  subtitle: 'María López se registró en tu tienda.',
                  time: 'Ayer 09:15',
                  isUnread: false,
                ),
              ],
            ),

            // Grupo: Esta semana
            CupertinoListSection.insetGrouped(
              header: const Text('ESTA SEMANA'),
              children: const [
                _NotificationTile(
                  icon: CupertinoIcons.chart_bar_fill,
                  iconColor: CupertinoColors.systemIndigo,
                  title: 'Reporte semanal',
                  subtitle: 'Tus ventas subieron un 12% esta semana.',
                  time: 'Lun 08:00',
                  isUnread: false,
                ),
                _NotificationTile(
                  icon: CupertinoIcons.exclamationmark_triangle_fill,
                  iconColor: CupertinoColors.systemRed,
                  title: 'Producto sin stock',
                  subtitle: 'Producto Ejemplo 5 se agotó.',
                  time: 'Dom 16:42',
                  isUnread: false,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _NotificationTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final String time;
  final bool isUnread;

  const _NotificationTile({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.isUnread,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(
      leading: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          color: iconColor.withAlpha(38),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: iconColor, size: 20),
      ),
      title: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontWeight:
                    isUnread ? FontWeight.bold : FontWeight.normal,
                color: CupertinoColors.label,
              ),
            ),
          ),
          if (isUnread)
            Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: CupertinoColors.systemBlue,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 13,
              color: CupertinoColors.secondaryLabel,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            time,
            style: const TextStyle(
              fontSize: 12,
              color: CupertinoColors.tertiaryLabel,
            ),
          ),
        ],
      ),
      onTap: () {},
    );
  }
}
