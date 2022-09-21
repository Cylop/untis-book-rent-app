import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:untis_book_rent_app/api/dto/book/book.dart';

class BookListTile extends StatelessWidget {
  const BookListTile({super.key, required this.book});

  final Book book;

  _formatAuthors(List<String> authors) {
    var endIndex = 1;
    var authorsJoined = "";
    var splitted = authors.getRange(0, min(endIndex, authors.length));
    authorsJoined = splitted.join(", ");
    if (splitted.length == authors.length) return authorsJoined;
    var rest = authors.getRange(endIndex, authors.length);

    if (rest.isNotEmpty) {
      authorsJoined += ", +${rest.length} more";
    }
    return authorsJoined;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /*Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailPage(book)));*/
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
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: book.imageUrl!,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              CircularProgressIndicator(
                                  value: downloadProgress.progress),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
              ),
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
                              book.title!,
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
                      Text(
                        _formatAuthors(book.authors!),
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        book.titleLong!,
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
                            child: _buildIconText(Icons.warehouse_outlined,
                                Colors.grey[300]!, '${book.amount}'),
                          ),

                          /*Expanded(
                            flex: 1,
                            child: _buildIconText(
                              Icons.visibility,
                              Colors.white,
                              '7.8M Read',
                            ),
                          ),*/
                        ],
                      ),
                    ],
                  ))
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
