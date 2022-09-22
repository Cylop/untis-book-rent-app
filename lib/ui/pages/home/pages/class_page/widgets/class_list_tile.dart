import 'package:flutter/material.dart';
import 'package:untis_book_rent_app/api/dto/class/class.dart';

class ClassListTile extends StatelessWidget {
  const ClassListTile({super.key, required this.schoolClass});

  final SchoolClass schoolClass;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /*Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailPage(book)));*/
        //context.router.push(BookDetailRoute(book: book));
      },
      child: Material(
        elevation: 10,
        type: MaterialType.card,
        borderRadius: BorderRadius.circular(6),
        color: Colors.black12,
        surfaceTintColor: Colors.white10,
        child: SizedBox(
          height: 120,
          child: Row(
            children: [
              Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              schoolClass.label!,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          /*Icon(
                            Icons.bookmark,
                            color: Colors.orange[300],
                          )*/
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        schoolClass.name!,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: _buildIconText(Icons.school_outlined,
                                Colors.grey[300]!, '${schoolClass.studentCount}'),
                          ),
                        ],
                      ),
                    ],
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconText(IconData icon, Color color, String text) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          width: 2,
        ),
        Icon(
          icon,
          color: color,
          size: 14,
        ),
      ],
    );
  }
}
