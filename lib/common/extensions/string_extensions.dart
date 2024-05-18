extension StringExtension on String {
  String textTrim() {
    return this.length > 15 ? '${this.substring(0, 15)}...' : this;
  }
}