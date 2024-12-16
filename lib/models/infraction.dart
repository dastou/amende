class Infraction {
  final String category;
  final String title;
  final double montant;
  bool isSelected;

  Infraction({
    required this.category,
    required this.title,
    required this.montant,
    this.isSelected = false,
  });
}