class Book {
  String id;
  String title;
  String subtitle;
  String authors;
  String description;
  String publisher;
  String publishedDate;
  int pages;
  String imgUrl;

  Book(this.id, this.title, this.subtitle, this.authors, this.description, this.publisher, this.publishedDate, this.pages
  , this.imgUrl);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'authors': authors,
      'description': description,
      'publisher': publisher,
      'publishedDate': publishedDate,
      'pages': pages,
      'imgUrl': imgUrl
    };
  }

  factory Book.fromJson(Map<String, dynamic> parsedJson) {
    final String id = parsedJson['id'];
    final String title = parsedJson['volumeInfo']['title'];
    final String subtitle = (parsedJson['volumeInfo']['subtitle'] == null) ? '' : parsedJson['volumeInfo']['subtitle'];
    String authors = (parsedJson['volumeInfo']['authors'] == null)
        ? ''
        : parsedJson['volumeInfo']['authors'].toString();
    authors = authors.replaceAll('[', '');
    authors = authors.replaceAll(']', '');
    final String description = (parsedJson['volumeInfo']['description'] == null)
        ? ''
        : parsedJson['volumeInfo']['description'];
    final String publisher = (parsedJson['volumeInfo']['publisher'] == null)
        ? ''
        : parsedJson['volumeInfo']['publisher'];
    final String publishedDate = (parsedJson['volumeInfo']['publishedDate'] == null)
        ? ''
        : parsedJson['volumeInfo']['publishedDate'];
    final int pages = (parsedJson['volumeInfo']['pageCount'] == null)
        ? 0
        : parsedJson['volumeInfo']['pageCount'];
    final String imgUrl = (parsedJson['volumeInfo']['imageLinks']['thumbnail'] == null) ? '' : parsedJson['volumeInfo']['imageLinks']['thumbnail'];
    return Book(
      id,
      title,
      subtitle,
      authors,
      description,
      publisher,
      publishedDate,
      pages,
      imgUrl,
    );
  }
}
