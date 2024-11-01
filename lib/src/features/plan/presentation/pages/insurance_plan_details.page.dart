// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:either_dart/either.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:property_insurance_plan_viewer_app/core/error/failures/failure.dart';
import 'package:property_insurance_plan_viewer_app/core/theme/plan_viewer.theme.dart';
import 'package:property_insurance_plan_viewer_app/core/translations/locale_keys.g.dart';
import 'package:property_insurance_plan_viewer_app/src/common/presentation/widgets/responsive_layout_wrapper.dart';
import 'package:property_insurance_plan_viewer_app/src/features/plan/domain/entities/insurance_plan_details.dart';
import 'package:property_insurance_plan_viewer_app/src/features/plan/presentation/mixins/insurance_plan_details_actions.mixin.dart';
import 'package:property_insurance_plan_viewer_app/src/features/plan/presentation/notifiers/get_insurance_plan_details.notifier.dart';
import 'package:property_insurance_plan_viewer_app/src/features/plan/presentation/widgets/insurance_plan_overview_card.dart';

class InsurancePlanDetailsPage extends StatefulWidget {
  final String planId;

  const InsurancePlanDetailsPage({
    super.key,
    required this.planId,
  });

  static const String route = '/insurance-plan-details';

  static void open(BuildContext context, {required String planId}) {
    Navigator.pushNamed(context, route, arguments: {"planId": planId});
  }

  @override
  State<InsurancePlanDetailsPage> createState() => _InsurancePlanDetailsPageState();
}

class _InsurancePlanDetailsPageState extends State<InsurancePlanDetailsPage> with InsurancePlanListActionsMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 247, 234),
      appBar: AppBar(
        title: Text(
          LocaleKeys.planDetails_title.tr(),
          style: context.theme.textTheme.titleLarge?.copyWith(color: context.theme.planViewerColors.brandLight, fontWeight: FontWeight.w500),
        ),
        backgroundColor: context.theme.planViewerColors.bg,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: context.theme.planViewerColors.brandLight),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Consumer<GetInsurancePlanDetailsNotifier>(
          builder: (context, notifier, _) {
            if (notifier.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (notifier.hasData) {
              return ResponsiveLayoutWrapper(
                mobile: (_) => _MobileView(details: notifier.data!),
                tablet: (_) => _MobileView(details: notifier.data!),
                desktop: (_) => _DesktopView(details: notifier.data!),
              );
            } else if (notifier.hasFailed) {
              return Center(
                child: Text(
                  (notifier.resp as Left<Failure, InsurancePlanDetails>).value.msg,
                  style: context.theme.textTheme.displayMedium?.copyWith(color: context.theme.planViewerColors.error),
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}

class _MobileView extends StatelessWidget {
  final InsurancePlanDetails details;

  const _MobileView({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionWidget(
            title: LocaleKeys.planDetails_description.tr(),
            child: _DescriptionCard(description: details.planDescription),
          ),
          const Gap(16),
          PlanOverviewCard(details: details),
          const Gap(16),
          _SectionWidget(
            title: LocaleKeys.planDetails_coverageTypes.tr(),
            child: _PropertiesListSection(items: details.coverageTypes, iconColor: Colors.green),
          ),
          const Gap(16),
          _SectionWidget(
            title: LocaleKeys.planDetails_exclusions.tr(),
            child: _PropertiesListSection(items: details.exclusions, iconColor: Colors.red),
          ),
          const Gap(16),
          _FinancialInfoSection(details: details),
        ],
      ),
    );
  }
}

class _DesktopView extends StatelessWidget {
  final InsurancePlanDetails details;

  const _DesktopView({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.topCenter,
          constraints: const BoxConstraints(maxWidth: 1000), // Reduced max width for a more balanced view
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.planDetails_title.tr(),
                style: context.theme.textTheme.headlineLarge?.copyWith(color: Colors.blue[800], fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const Gap(32),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _SectionWidget(
                          title: LocaleKeys.planDetails_description.tr(),
                          child: _DescriptionCard(description: details.planDescription),
                        ),
                        const Gap(16),
                        _SectionWidget(
                          title: LocaleKeys.planDetails_coverageTypes.tr(),
                          child: _PropertiesListSection(items: details.coverageTypes, iconColor: Colors.green),
                        ),
                        const Gap(16),
                        _SectionWidget(
                          title: LocaleKeys.planDetails_exclusions.tr(),
                          child: _PropertiesListSection(items: details.exclusions, iconColor: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PlanOverviewCard(details: details),
                        const Gap(16),
                        _FinancialInfoSection(details: details),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionWidget extends StatelessWidget {
  final String title;
  final Widget? child;

  const _SectionWidget({super.key, required this.title, this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: context.theme.textTheme.headlineSmall?.copyWith(color: context.theme.planViewerColors.brand, fontWeight: FontWeight.w400),
        ),
        if (child != null) child!,
      ],
    );
  }
}

class _DescriptionCard extends StatelessWidget {
  final String description;

  const _DescriptionCard({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white,
      elevation: 0.2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          description,
          style: context.theme.textTheme.bodyLarge,
        ),
      ),
    );
  }
}

class _PropertiesListSection extends StatelessWidget {
  final List<String> items;
  final Color iconColor;

  const _PropertiesListSection({super.key, required this.items, required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white,
      elevation: 0.2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: items.map((item) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              children: [
                Icon(Icons.check_circle, color: iconColor),
                const SizedBox(width: 8),
                Expanded(child: Text(item, style: context.theme.textTheme.bodyLarge)),
              ],
            ),
          )).toList(),
        ),
      ),
    );
  }
}

class _FinancialInfoSection extends StatelessWidget {
  final InsurancePlanDetails details;

  const _FinancialInfoSection({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue[100],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 0.2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.planDetails_claimProcessTime.tr(args: [details.claimProcessTime]),
              style: context.theme.textTheme.bodyLarge?.copyWith(color: Colors.blue[900], fontWeight: FontWeight.bold),
            ),
            const Gap(8),
            Text(
              LocaleKeys.planDetails_planDuration.tr(args: [details.planDuration]),
              style:context.theme.textTheme.bodyLarge?.copyWith(color: Colors.blue[900]),
            ),
          ],
        ),
      ),
    );
  }
}
