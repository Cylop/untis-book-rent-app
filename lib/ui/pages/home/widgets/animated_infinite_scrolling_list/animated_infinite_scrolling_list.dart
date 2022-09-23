part of 'list.dart';

typedef ListTileBuilder<E> = Widget Function(BuildContext context, E entity);

class AnimatedInfiniteScrollingBlocList <B extends Bloc<AnimatedInfiniteScrollingBlocListEvent, AnimatedInfiniteScrollingBlocListState<E>>, E> extends StatefulWidget {
  const AnimatedInfiniteScrollingBlocList({Key? key, required this.entityName, required this.builder}) : super(key: key);

  final String entityName;
  final ListTileBuilder<E> builder;

  @override
  State<AnimatedInfiniteScrollingBlocList> createState() => _AnimatedInfiniteScrollingBlocListState();
}

class _AnimatedInfiniteScrollingBlocListState<B extends Bloc<AnimatedInfiniteScrollingBlocListEvent, AnimatedInfiniteScrollingBlocListState<E>>, E>
extends State<AnimatedInfiniteScrollingBlocList<B, E>>{

  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<B, AnimatedInfiniteScrollingBlocListState<E>>(builder: (context, state) {
      switch (state.status) {
        case LoadingStatus.failure:
          return Center(child: Text("${widget.entityName} couldn't be loaded"));
        case LoadingStatus.success:
          if (state.entities.isEmpty) {
            return Center(child: Text("No ${widget.entityName} exists"));
          }
          return AnimationLimiter(
            child: ListView.separated(
              padding: const EdgeInsets.all(10),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return  AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 500),
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: index >= state.entities.length
                          ? state.hasReachedMax
                          ? Center(
                        child: Text(
                          'All ${widget.entityName} loaded',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      )
                          : const BottomLoader()
                          : widget.builder(context, state.entities[index]),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
              const SizedBox(
                height: 10,
              ),
              itemCount: state.entities.length + 1,
              controller: _scrollController,
            ),
          );
        case LoadingStatus.initial:
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
    if (_isBottom) context.read<B>().add(EntitiesFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
