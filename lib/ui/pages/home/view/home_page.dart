import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untis_book_rent_app/injection.dart';
import 'package:untis_book_rent_app/ui/state/auth_bloc/bloc.dart';
import 'package:untis_book_rent_app/ui/state/auth_bloc/event.dart';
import 'package:untis_book_rent_app/ui/state/auth_bloc/state.dart';
import 'package:untis_book_rent_app/ui/state/repositories/auth_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            BlocBuilder<AuthenticationBloc, AuthenticationState>(
              buildWhen: ((previous, current) =>
                  previous != current &&
                  current.status == AuthenticationStatus.authenticated),
              builder: (BuildContext context, AuthenticationState state) {
                if (state is! AuthAuthenticatedState) return const Text('');

                final userId = state.user.id;
                final email = state.user.email;
                return Text('UserID: $userId with email $email');
              },
            ),
            ElevatedButton(
              child: const Text('Logout'),
              onPressed: () {
                context
                    .read<AuthenticationBloc>()
                    .add(AuthenticationLogoutRequested());
              },
            ),
          ],
        ),
      ),
    );
  }
}
