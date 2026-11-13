import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../navigation/app_routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.surface,
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: AppColors.background),
            child: Center(
              child: Text('Flutter Lab Calculator', style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.calculate, color: AppColors.accent),
            title: const Text('Standard Mode', style: TextStyle(color: Colors.white)),
            onTap: () => Navigator.pushReplacementNamed(context, AppRoutes.home),
          ),
          ListTile(
            leading: const Icon(Icons.science, color: AppColors.accent),
            title: const Text('Scientific Mode', style: TextStyle(color: Colors.white)),
            onTap: () => Navigator.pushNamed(context, AppRoutes.scientific),
          ),
          ListTile(
            leading: const Icon(Icons.history, color: AppColors.accent),
            title: const Text('History', style: TextStyle(color: Colors.white)),
            onTap: () => Navigator.pushNamed(context, AppRoutes.history),
          ),
          ListTile(
            leading: const Icon(Icons.currency_exchange, color: AppColors.accent),
            title: const Text('Currency Converter', style: TextStyle(color: Colors.white)),
            onTap: () => Navigator.pushNamed(context, AppRoutes.currency),
          ),
        ],
      ),
    );
  }
}
