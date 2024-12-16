import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'paiement_screen.dart';

class AmendeScreen extends StatefulWidget {
  const AmendeScreen({Key? key}) : super(key: key);

  @override
  State<AmendeScreen> createState() => _AmendeScreenState();
}

class _AmendeScreenState extends State<AmendeScreen> {
  Map<String, List<Map<String, dynamic>>> infractions = {
    'Excès de vitesse': [
      {'title': 'Dépassement < 20 km/h', 'montant': 135, 'isSelected': false},
      {'title': 'Dépassement entre 20 et 30 km/h', 'montant': 180, 'isSelected': false},
      {'title': 'Dépassement entre 30 et 40 km/h', 'montant': 250, 'isSelected': false},
      {'title': 'Dépassement entre 40 et 50 km/h', 'montant': 350, 'isSelected': false},
      {'title': 'Dépassement > 50 km/h', 'montant': 450, 'isSelected': false},
    ],
    'Stationnement': [
      {'title': 'Stationnement interdit', 'montant': 60, 'isSelected': false},
      {'title': 'Stationnement sur trottoir', 'montant': 80, 'isSelected': false},
      {'title': 'Stationnement en double file', 'montant': 100, 'isSelected': false},
      {'title': 'Stationnement gênant', 'montant': 120, 'isSelected': false},
      {'title': 'Stationnement sur passage piéton', 'montant': 150, 'isSelected': false},
    ],
    'Conduite dangereuse': [
      {'title': 'Usage du téléphone au volant', 'montant': 150, 'isSelected': false},
      {'title': 'Non-respect des distances de sécurité', 'montant': 180, 'isSelected': false},
      {'title': 'Conduite en état d\'ivresse', 'montant': 750, 'isSelected': false},
      {'title': 'Dépassement dangereux', 'montant': 200, 'isSelected': false},
      {'title': 'Circulation en sens interdit', 'montant': 250, 'isSelected': false},
    ],
    'Non-respect des signalisations': [
      {'title': 'Feu rouge grillé', 'montant': 200, 'isSelected': false},
      {'title': 'Stop non respecté', 'montant': 150, 'isSelected': false},
      {'title': 'Sens interdit', 'montant': 180, 'isSelected': false},
      {'title': 'Non respect priorité à droite', 'montant': 140, 'isSelected': false},
      {'title': 'Ligne continue franchie', 'montant': 170, 'isSelected': false},
    ],
    'Transport illégal': [
      {'title': 'Transport sans licence', 'montant': 300, 'isSelected': false},
      {'title': 'Surcharge de passagers', 'montant': 250, 'isSelected': false},
      {'title': 'Transport de marchandises non autorisées', 'montant': 400, 'isSelected': false},
      {'title': 'Absence d\'assurance transport', 'montant': 500, 'isSelected': false},
      {'title': 'Transport de matières dangereuses sans autorisation', 'montant': 800, 'isSelected': false},
    ],
    'Problèmes liés au véhicule': [
      {'title': 'Défaut d\'éclairage', 'montant': 70, 'isSelected': false},
      {'title': 'Pneus usés', 'montant': 90, 'isSelected': false},
      {'title': 'Absence de contrôle technique', 'montant': 120, 'isSelected': false},
      {'title': 'Plaque d\'immatriculation non conforme', 'montant': 80, 'isSelected': false},
      {'title': 'Niveau sonore excessif', 'montant': 100, 'isSelected': false},
    ],
    'Documents manquants': [
      {'title': 'Conduite sans permis', 'montant': 800, 'isSelected': false},
      {'title': 'Défaut d\'assurance', 'montant': 500, 'isSelected': false},
      {'title': 'Carte grise non valide', 'montant': 150, 'isSelected': false},
      {'title': 'Vignette expirée', 'montant': 120, 'isSelected': false},
      {'title': 'Absence de certificat d\'immatriculation', 'montant': 200, 'isSelected': false},
    ],
    'Infractions environnementales': [
      {'title': 'Rejet de déchets sur la voie publique', 'montant': 150, 'isSelected': false},
      {'title': 'Non-respect des normes antipollution', 'montant': 200, 'isSelected': false},
      {'title': 'Lavage de véhicule interdit', 'montant': 100, 'isSelected': false},
      {'title': 'Pollution sonore excessive', 'montant': 180, 'isSelected': false},
      {'title': 'Émissions de fumée excessive', 'montant': 250, 'isSelected': false},
    ],
  };

  Map<String, bool> categoryExpanded = {
    'Excès de vitesse': false,
    'Stationnement': false,
    'Conduite dangereuse': false,
    'Non-respect des signalisations': false,
    'Transport illégal': false,
    'Problèmes liés au véhicule': false,
    'Documents manquants': false,
    'Infractions environnementales': false,
  };

  double get totalAmount {
    double total = 0;
    for (var category in infractions.values) {
      for (var infraction in category) {
        if (infraction['isSelected']) {
          total += infraction['montant'];
        }
      }
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: const Color(0XFF0A345A),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white, size: 28.r),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Amende',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 24.sp,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Header design curve
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 100.h,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0XFF0A345A),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.r),
                  bottomRight: Radius.circular(30.r),
                ),
              ),
            ),
          ),
          Column(
            children: [
              // Title card
              Padding(
                padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0),
                child: Container(
                  padding: EdgeInsets.all(24.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 20,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(12.w),
                            decoration: BoxDecoration(
                              color: const Color(0XFF0A345A).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Icon(
                              Icons.gavel_rounded,
                              color: const Color(0XFF0A345A),
                              size: 24.r,
                            ),
                          ),
                          SizedBox(width: 16.w),
                          Text(
                            'Liste des infractions',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: const Color(0XFF0A345A),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        'Sélectionnez les infractions commises',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Infractions list
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                  children: [
                    ...categoryExpanded.entries.map((entry) => _buildCategory(entry.key)),
                  ],
                ),
              ),
              _buildTotalAndValidate(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategory(String category) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: categoryExpanded[category] ?? false,
          title: Row(
            children: [
              Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  color: const Color(0XFF0A345A).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Icon(
                  _getCategoryIcon(category),
                  color: const Color(0XFF0A345A),
                  size: 20.r,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Text(
                  category,
                  style: TextStyle(
                    color: const Color(0XFF0A345A),
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                  ),
                ),
              ),
            ],
          ),
          iconColor: const Color(0XFF0A345A),
          collapsedIconColor: const Color(0XFF0A345A),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          onExpansionChanged: (expanded) {
            setState(() {
              categoryExpanded[category] = expanded;
            });
          },
          children: [
            if (infractions.containsKey(category))
              ...infractions[category]!.map((infraction) => _buildInfractionTile(infraction)),
          ],
        ),
      ),
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Excès de vitesse':
        return Icons.speed;
      case 'Stationnement':
        return Icons.local_parking;
      case 'Conduite dangereuse':
        return Icons.warning;
      case 'Non-respect des signalisations':
        return Icons.traffic;
      case 'Transport illégal':
        return Icons.no_transfer;
      case 'Problèmes liés au véhicule':
        return Icons.car_repair;
      default:
        return Icons.error;
    }
  }

  Widget _buildInfractionTile(Map<String, dynamic> infraction) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey.withOpacity(0.2),
            width: 1,
          ),
        ),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        title: Text(
          infraction['title'],
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.grey[800],
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: const Color(0XFF0A345A).withOpacity(0.1),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                '${infraction['montant'].toInt()}€',
                style: TextStyle(
                  color: const Color(0XFF0A345A),
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Transform.scale(
              scale: 1.1,
              child: Checkbox(
                value: infraction['isSelected'],
                onChanged: (bool? value) {
                  setState(() {
                    infraction['isSelected'] = value ?? false;
                  });
                },
                activeColor: const Color(0XFF0A345A),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTotalAndValidate(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Montant total',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '${totalAmount.toInt()}€',
                style: TextStyle(
                  color: const Color(0XFF0A345A),
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          SizedBox(
            width: double.infinity,
            height: 55.h,
            child: ElevatedButton(
              onPressed: totalAmount > 0
                  ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaiementScreen(montant: totalAmount),
                  ),
                );
              }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0XFF0A345A),
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                disabledBackgroundColor: Colors.grey[300],
              ),
              child: Text(
                'Procéder au paiement',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}