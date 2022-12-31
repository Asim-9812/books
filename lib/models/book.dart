

class Book{

  final String imageUrl;
  final String title;
  final String detail;
  final String rating;
  final String genres;

  Book({
    required this.title,
    required this.detail,
    required this.imageUrl,
    required this.rating,
    required this.genres
});
}

List<Book> books=[
  Book(title: 'The Republic',
      detail: 'A summary of The Republic by Plato can be defined by three words, justice, virtue, and happiness. Plato\'s text is designed so that Socrates first asks what justice is and then explains that, until one knows, they cannot then understand if justice is a virtue and provides happiness.',
      imageUrl: 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1386925655i/30289.jpg',
      rating: '⭐⭐⭐⭐⭐',
      genres: 'Idealism'),
  Book(title: 'Politics',
      detail: 'In his Nicomachean Ethics, Aristotle (384-322 B.C.E.) describes the happy life intended for man by nature as one lived in accordance with virtue, and, in his Politics, he describes the role that politics and the political community must play in bringing about the virtuous life in the citizenry.',
      imageUrl: 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1391135988i/19083.jpg',
      rating: '⭐⭐⭐⭐⭐',
      genres: 'Realism'),
  Book(title: 'Meditation',
      detail: '"Meditations" reveals that Marcus remained in control of his emotions through the beliefs that nature unfolds in a perfect way and that one must accept that they cannot change the past or what other people feel in their hearts.',
      imageUrl: 'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1421618636l/30659.jpg',
      rating: '⭐⭐⭐⭐⭐',
      genres: 'Stoicism'),
];

final readingbooks = Book(
      title: 'Beyond Good and Evil',
      detail: 'Beyond Good and Evil confirmed Nietzsche\'s position as the towering European philosopher of his age. The work dramatically rejects the tradition of Western thought with its notions of truth and God, good and evil.',
      imageUrl: 'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1388607391l/12321.jpg',
      rating: '⭐⭐⭐⭐⭐',
      genres: 'Existensialism');