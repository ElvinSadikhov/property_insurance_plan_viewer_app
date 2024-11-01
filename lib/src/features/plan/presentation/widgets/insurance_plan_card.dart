// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:gap/gap.dart';

// Project imports:
import 'package:property_insurance_plan_viewer_app/core/theme/plan_viewer.theme.dart';
import 'package:property_insurance_plan_viewer_app/core/translations/locale_keys.g.dart';
import 'package:property_insurance_plan_viewer_app/src/features/plan/domain/entities/insurance_plan.dart';
import 'package:property_insurance_plan_viewer_app/src/features/plan/presentation/pages/insurance_plan_details.page.dart';

class InsurancePlanCard extends StatelessWidget {
  final InsurancePlan insurancePlan;
  
  const InsurancePlanCard({super.key, 
    required this.insurancePlan,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: context.theme.planViewerColors.brandLight,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                      color: context.theme.planViewerColors.brand,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      LocaleKeys.general_limitedOffer.tr(),
                      style: context.theme.textTheme.bodyLarge?.copyWith(color: Colors.white),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "\$",
                    style: context.theme.textTheme.bodyMedium?.copyWith(color: Colors.blueGrey),
                  ),
                ],
              ),
              const Gap(8),
              Text(
                insurancePlan.name,
                style: context.theme.textTheme.headlineMedium?.copyWith(color: context.theme.planViewerColors.brandBlack),
              ),
              const Gap(8),
              _LabeledPrice(
                label: LocaleKeys.labels_monthlyPremium.tr(),
                price: insurancePlan.monthlyPremium,
              ),
              const Gap(8),
              _LabeledPrice(
                label: LocaleKeys.labels_coverageAmount.tr(),
                price: insurancePlan.coverageAmount,
              ),
              const Gap(8),
              Align(
                alignment: Alignment.centerRight,
                child: OutlinedButton(
                  onPressed: () => _onActionButtonTap(context),
                  child: Text(LocaleKeys.general_learnMore.tr()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onActionButtonTap(BuildContext context) {
    InsurancePlanDetailsPage.open(context, planId: insurancePlan.id);
  }
}

class _LabeledPrice extends StatelessWidget {
  final String label;
  final double price;

  const _LabeledPrice({super.key, required this.label, required this.price});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: context.theme.textTheme.bodyMedium?.copyWith(color: context.theme.planViewerColors.brandBlack), overflow: TextOverflow.ellipsis,),
        Text(
          "\$$price",
          style: context.theme.textTheme.titleLarge?.copyWith(color: context.theme.planViewerColors.brandBlack, overflow: TextOverflow.ellipsis,),
        ),
      ],
    );
  }
}
