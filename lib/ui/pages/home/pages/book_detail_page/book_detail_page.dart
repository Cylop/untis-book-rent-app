import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:untis_book_rent_app/api/dto/book/book.dart';

class BookDetailPage extends StatelessWidget {
  final Book book;
  const BookDetailPage(this.book, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 550,
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(30)),
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
                Positioned(
                    top: 56,
                    left: 20,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.grey[900], shape: BoxShape.circle),
                        child: const Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ))
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Column(
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 250),
                child: Text(
                  book.title!,
                  maxLines: 4,
                  overflow: TextOverflow.fade,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 24, height: 1.2),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  _formatAuthors(book.authors!),
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildIconText(Icons.warehouse_outlined, Colors.grey[300]!,
                      '${book.amount} in warehouse'),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: ['Fachlektüre', 'Deutsch', 'IT-Technik']
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Chip(
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary,
                            label: Text(
                              e,
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ),
                        ),
                      )
                      .toList()),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Text(book.titleLong!),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildButton(
                        Icons.add, Colors.grey[800]!, 'Add To Library'),
                    const SizedBox(
                      width: 15,
                    ),
                    _buildButton(
                        Icons.menu_book, const Color(0xFF6741FF), 'Read Now')
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildButton(IconData icon, Color color, String text) {
    return SizedBox(
      height: 40,
      width: 150,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 20,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            )
          ],
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

  _formatAuthors(List<String> authors) {
    var endIndex = 3;
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
}
