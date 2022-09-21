import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untis_book_rent_app/ui/pages/home/pages/book_page/books_bloc/bloc.dart';
import 'package:untis_book_rent_app/ui/pages/home/pages/book_page/widgets/book_list_tile.dart';
import 'package:untis_book_rent_app/ui/pages/home/pages/book_page/widgets/bottom_loader.dart';

class BookList extends StatefulWidget {
  const BookList({Key? key}) : super(key: key);

  @override
  _BookListState createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookBloc, BookState>(builder: (context, state) {
      switch (state.status) {
        case BookStatus.failure:
          return const Center(child: Text('failed to fetch posts'));
        case BookStatus.success:
          if (state.books.isEmpty) {
            return const Center(child: Text('no posts'));
          }
          return ListView.separated(
            padding: const EdgeInsets.all(10),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return index >= state.books.length
                  ? state.hasReachedMax
                      ? Center(
                          child: Text(
                            'Alle Bücher geladen',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        )
                      : const BottomLoader()
                  : BookListTile(book: state.books[index]);
            },
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
              height: 10,
            ),
            itemCount: state.books.length + 1,
            controller: _scrollController,
          );
        case BookStatus.initial:
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
    if (_isBottom) context.read<BookBloc>().add(BookFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
