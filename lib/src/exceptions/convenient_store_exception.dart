class ConvenientStoreException implements Exception {
  final String message;

  ConvenientStoreException(this.message);

  @override
  String toString() => message;
}
