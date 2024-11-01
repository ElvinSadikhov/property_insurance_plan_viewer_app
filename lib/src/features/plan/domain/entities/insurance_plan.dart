// Package imports:
import 'package:equatable/equatable.dart';

class InsurancePlan extends Equatable {
  final String id;
  final String name;
  final double coverageAmount;
  final double monthlyPremium;

  const InsurancePlan({
    required this.id,
    required this.name,
    required this.coverageAmount,
    required this.monthlyPremium,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    coverageAmount,
    monthlyPremium,
  ];
}