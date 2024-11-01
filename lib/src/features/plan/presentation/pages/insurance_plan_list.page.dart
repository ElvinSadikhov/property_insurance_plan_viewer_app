// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:property_insurance_plan_viewer_app/core/theme/plan_viewer.theme.dart';
import 'package:property_insurance_plan_viewer_app/core/translations/locale_keys.g.dart';
import 'package:property_insurance_plan_viewer_app/src/common/presentation/widgets/responsive_layout_wrapper.dart';
import 'package:property_insurance_plan_viewer_app/src/features/plan/presentation/mixins/insurance_plan_list_actions.mixin.dart';
import 'package:property_insurance_plan_viewer_app/src/features/plan/presentation/notifiers/get_insurance_plans.notifier.dart';
import 'package:property_insurance_plan_viewer_app/src/features/plan/presentation/widgets/insurance_plan_card.dart';

class InsurancePlanListPage extends StatefulWidget {
  static const String route = '/insurance-plan-list';

  const InsurancePlanListPage({super.key});

  @override
  State<InsurancePlanListPage> createState() => _InsurancePlanListPageState();
}

class _InsurancePlanListPageState extends State<InsurancePlanListPage> with InsurancePlanListActionsMixin {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: getInsurancePlansNotifier,
      builder: (context, _) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: Consumer<GetInsurancePlansNotifier>(
                builder: (context, notifier, _) {
                  if (notifier.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (notifier.hasData) {
                    return ResponsiveLayoutWrapper(
                      mobile: (_) => const _MobileView(),
                      tablet: (_) => const _MobileView(),
                      desktop: (_) => const _DesktopView(),
                    );
                  } else if (notifier.hasFailed) {
                    return Center(child: Text(
                      LocaleKeys.general_noData.tr(), 
                      style: context.theme.textTheme.displayMedium?.copyWith(color: context.theme.planViewerColors.error),
                    ),);
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class _MobileView extends StatelessWidget {
  const _MobileView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(LocaleKeys.general_allPlans.tr(), style: context.theme.textTheme.displayMedium?.copyWith(color: Colors.white),),
        ),
        const Gap(16),
        Expanded(
          child: ListView.builder(
            itemCount: context.read<GetInsurancePlansNotifier>().resp!.right.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: InsurancePlanCard(insurancePlan: context.read<GetInsurancePlansNotifier>().resp!.right[index]),
              );
            },
          ),
        )
      ],
    );
  }
}

class _DesktopView extends StatelessWidget {
  const _DesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    LocaleKeys.general_allPlans.tr(),
                    style: context.theme.textTheme.displayMedium?.copyWith(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  LocaleKeys.descriptions_choosePlan.tr(),
                  style: context.theme.textTheme.bodyLarge?.copyWith(color: Colors.white70),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: context.read<GetInsurancePlansNotifier>().resp!.right.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: InsurancePlanCard(insurancePlan: context.read<GetInsurancePlansNotifier>().resp!.right[index]),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
