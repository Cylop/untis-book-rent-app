import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untis_book_rent_app/injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untis_book_rent_app/ui/pages/home/pages/class_page/class_bloc/bloc.dart';
import 'package:untis_book_rent_app/ui/pages/home/pages/class_page/view/class_list.dart';

class ClassPage extends StatefulWidget {
  const ClassPage({Key? key}) : super(key: key);

  @override
  State<ClassPage> createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<ClassBloc>()..add(ClassFetched()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Books'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            /*await showModalBottomSheet<String>(
              context: context,
              builder: (BuildContext builder) {
                return const CreateBookModal();
              },
            );*/
          },
          mini: true,
          child: const Icon(Icons.add),
          //icon: const Icon(Icons.add), label: const Text('Create Book'),
          //label: ,
        ),
        body: const ClassList(),
      ),
    );
  }
}
