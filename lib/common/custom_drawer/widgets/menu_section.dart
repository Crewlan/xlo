import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xlo/blocs/drawer_bloc.dart';
import 'package:xlo/common/custom_drawer/widgets/menu_tile.dart';

class MenuSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DrawerBloc _drawerBloc = Provider.of<DrawerBloc>(context);

    void _setMenu(int page) {
      Navigator.of(context).pop();
      _drawerBloc.setPage(page);
    }

    return StreamBuilder(
      stream: _drawerBloc.outPage,
      builder: (context, snapshot) {
        return Column(
          children: [
            MenuTile(
              label: 'Anuncios',
              iconData: Icons.list,
              onTap: () {
                _setMenu(0);
              },
              highlighted: snapshot.data == 0,
            ),
            MenuTile(
              label: 'Inserir Anuncio',
              iconData: Icons.edit,
              onTap: () {
                _setMenu(1);
              },
              highlighted: snapshot.data == 1,
            ),
            MenuTile(
              label: 'Chat',
              iconData: Icons.chat,
              onTap: () {
                _setMenu(2);
              },
              highlighted: snapshot.data == 2,
            ),
            MenuTile(
              label: 'Favoritos',
              iconData: Icons.favorite,
              onTap: () {
                _setMenu(3);
              },
              highlighted: snapshot.data == 3,
            ),
            MenuTile(
              label: 'Minha Conta',
              iconData: Icons.person,
              onTap: () {
                _setMenu(4);
              },
              highlighted: snapshot.data == 4,
            ),
          ],
        );
      },
    );
  }
}
