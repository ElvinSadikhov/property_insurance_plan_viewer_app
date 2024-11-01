// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:gap/gap.dart';

// Project imports:
import 'package:property_insurance_plan_viewer_app/core/theme/plan_viewer.theme.dart';
import 'package:property_insurance_plan_viewer_app/core/translations/locale_keys.g.dart';
import 'package:property_insurance_plan_viewer_app/src/features/plan/domain/entities/insurance_plan_details.dart';

class PlanOverviewCard extends StatelessWidget {
  final InsurancePlanDetails details;

  const PlanOverviewCard({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: context.theme.planViewerColors.brandLight,
      elevation: 0.2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _InfoRow(label: LocaleKeys.labels_monthlyPremium.tr(), value: details.monthlyPremium, icon: Icons.monetization_on),
            const Gap(8),
            _InfoRow(label: LocaleKeys.labels_coverageAmount.tr(), value: details.coverageAmount, icon: Icons.shield),
            const Gap(8),
            _InfoRow(label: LocaleKeys.labels_deductible.tr(), value: details.deductible, icon: Icons.money_off),
            const Gap(8),
            _InfoRow(label: LocaleKeys.labels_maxClaimLimit.tr(), value: details.maxClaimLimit, icon: Icons.account_balance_wallet),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final double value;
  final IconData icon;

  const _InfoRow({super.key, required this.label, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.blue[700]),
        const SizedBox(width: 12),
        Text(
          label,
          style: context.theme.textTheme.titleMedium?.copyWith(color: context.theme.planViewerColors.brandBlack),
        ),
        const Spacer(),
        Text(
          "\$${value.toStringAsFixed(2)}",
          style: context.theme.textTheme.bodyLarge?.copyWith(color: Colors.grey[800]),
        ),
      ],
    );
  }
}
