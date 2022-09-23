import 'package:flutter/material.dart';
import 'package:untis_book_rent_app/api/dto/class/class.dart';
import 'package:untis_book_rent_app/injection.dart';
import 'package:untis_book_rent_app/ui/pages/home/pages/class_page/widgets/class_list_tile.dart';
import 'package:untis_book_rent_app/ui/pages/home/widgets/animated_infinite_scrolling_list/list.dart';

class ClassList extends StatelessWidget {
  const ClassList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedInfiniteScrollingBlocList<SchoolClass>(
      entityName: 'Classes',
      bloc: locator(instanceName: 'animatedBookListBloc'),
      builder: (context, entity) => ClassListTile(schoolClass: entity),
    );
  }
}
