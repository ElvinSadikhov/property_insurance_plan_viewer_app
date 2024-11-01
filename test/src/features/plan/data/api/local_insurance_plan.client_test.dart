// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:property_insurance_plan_viewer_app/src/features/plan/data/api/local_insurance_plan.client.dart';
import 'package:property_insurance_plan_viewer_app/src/features/plan/data/dto/insurance_plan.dto.dart';
import 'package:property_insurance_plan_viewer_app/src/features/plan/data/dto/insurance_plan_details.dto.dart';

void main() {
  late LocalInsurancePlanClient client;

  setUp(() {
    client = LocalInsurancePlanClient();
  });

  group('getAllInsurancePlans', () {
    test('should return a list of InsurancePlanDto', () async {
      //! Act
      final result = await client.getAllInsurancePlans();

      //! Assert
      expect(result, isA<List<InsurancePlanDto>>());
      expect(result.length, equals(3));
      expect(result.first, isA<InsurancePlanDto>());
      expect(result.first.id, equals("001"));
    });
  });

  group('getInsurancePlanDetails', () {
    test('should return InsurancePlanDetailsDto when a valid ID is provided', () async {
      //! Arrange
      const validId = "001";

      //! Act
      final result = await client.getInsurancePlanDetails(validId);

      //! Assert
      expect(result, isA<InsurancePlanDetailsDto>());
      expect(result.id, equals(validId));
      expect(result.name, equals("Basic Protection"));
      expect(result.coverageAmount, equals(50000.0));
    });

    test('should throw StateError when an invalid ID is provided', () async {
      //! Arrange
      const invalidId = "999";

      //! Act
      Future<void> act() async => await client.getInsurancePlanDetails(invalidId);

      //! Assert
      expect(act, throwsA(isA<StateError>()));
    });
  });
}
