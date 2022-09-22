import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:untis_book_rent_app/ui/pages/home/pages/book_page/widgets/bottom_loader.dart';
import 'package:untis_book_rent_app/ui/pages/home/pages/class_page/class_bloc/bloc.dart';
import 'package:untis_book_rent_app/ui/pages/home/pages/class_page/widgets/class_list_tile.dart';
import 'package:untis_book_rent_app/ui/pages/home/widgets/reached_list_end.dart';

class ClassList extends StatefulWidget {
  const ClassList({Key? key}) : super(key: key);

  @override
  State<ClassList> createState() => _ClassListState();
}

class _ClassListState extends State<ClassList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClassBloc, ClassState>(builder: (context, state) {
      switch (state.status) {
        case ClassStatus.failure:
          return const Center(child: Text('Klassen konnten nicht geladen werden'));
        case ClassStatus.success:
          if (state.classes.isEmpty) {
            return const Center(child: Text('Keine Klassen vorhanden'));
          }
          return AnimationLimiter(
            child: ListView.separated(
              padding: const EdgeInsets.all(10),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return index >= state.classes.length
                    ? state.hasReachedMax
                        ? const ReachedEnd(
                            message: 'Alle Klassen geladen',
                          )
                        : const BottomLoader()
                    : AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 500),
                        child: SlideAnimation(
                          verticalOffset: 50.0,
                          child: FadeInAnimation(
                            child: ClassListTile(schoolClass: state.classes[index]),
                          ),
                        ),
                      );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                height: 10,
              ),
              itemCount: state.classes.length + 1,
              controller: _scrollController,
            ),
          );
        case ClassStatus.initial:
          return const Center(child: CircularProgressIndicator());
      }
    });
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<ClassBloc>().add(ClassFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
