String formatDate(int date) {
  String dateStr = date.toString();
  if (dateStr.length >= 8) {
    return '${dateStr.substring(6, 8)}.${dateStr.substring(4, 6)}.${dateStr.substring(0, 4)}';
  }
  return 'Fecha no disponible';
}
