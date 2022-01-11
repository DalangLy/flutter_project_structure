import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_structure/config/routes/default_route/router.gr.dart';
import 'package:project_structure/core/bloc/network_checker/network_checker_bloc.dart';
import 'package:project_structure/features/home/presentation/widgets/animated_menu_icon.dart';
import 'package:project_structure/features/home/presentation/widgets/main_end_drawer.dart';
import 'package:project_structure/features/home/presentation/widgets/main_scaffold.dart';
import 'package:project_structure/features/home/presentation/widgets/main_navigation.dart';

class HomeWrapperPage extends StatefulWidget {
  const HomeWrapperPage({Key? key}) : super(key: key);

  @override
  State<HomeWrapperPage> createState() => _HomeWrapperPageState();
}

class _HomeWrapperPageState extends State<HomeWrapperPage> {
  final List<MainNavigationItem> _navigationItems = const <MainNavigationItem>[
    MainNavigationItem(title: 'Dashboard', iconData: Icons.speed, route: DashboardRoute(), path: '',),
    MainNavigationItem(title: 'Item', iconData: Icons.category, route: ItemWrapperRoute(), path: 'items', children: <MainNavigationItem>[
      MainNavigationItem(title: 'Items', iconData: Icons.title, route: ItemWrapperRoute(), path: 'items',),
      // MainNavigationItem(title: 'Item Groups', iconData: Icons.group_work, route: ItemGroupWrapperRoute(), path: 'item_groups',),
      // MainNavigationItem(title: 'Item Types', iconData: Icons.format_align_center, route: ItemTypeWrapperRoute(), path: 'item_types',),
      // MainNavigationItem(title: 'Item Sources', iconData: Icons.raw_on, route: ItemSourceWrapperRoute(), path: 'item_sources',),
      // MainNavigationItem(title: 'Item Tax Duties', iconData: Icons.price_change, route: ItemTaxDutyWrapperRoute(), path: 'item_tax_duties',),
      // MainNavigationItem(title: 'Sizes', iconData: Icons.line_weight, route: ItemSizeWrapperRoute(), path: 'item_sizes',),
      // MainNavigationItem(title: 'Item SKUs', iconData: Icons.receipt, route: ItemSKUWrapperRoute(), path: 'item_sku',),
      // MainNavigationItem(title: 'Item Prices', iconData: Icons.money, route: ItemPriceWrapperRoute(), path: 'item_prices',),
      // MainNavigationItem(title: 'Item Classes', iconData: Icons.grading, route: ItemClassWrapperRoute(), path: 'item_classes',),
    ]),
    // MainNavigationItem(title: 'Period', iconData: Icons.schedule, route: PeriodWrapperRoute(), path: 'periods',),
    // MainNavigationItem(title: 'Record Status Types', iconData: Icons.fiber_new, route: RecordStatusTypeWrapperRoute(), path: 'record_status_types',
    //   children: <MainNavigationItem>[
    //     MainNavigationItem(title: 'Record Status Types', iconData: Icons.fiber_new, route: RecordStatusTypeWrapperRoute(), path: 'record_status_types',),
    //     MainNavigationItem(title: 'Record Status Type Subscripting', iconData: Icons.new_releases, route: RecordStatusTypeSubscriptingWrapperRoute(), path: 'record_status_type_subscripting',),
    //   ],
    // ),
    // MainNavigationItem(title: 'Reason Codes', iconData: Icons.info, route: ReasonCodeWrapperRoute(), path: 'reason_codes',),
    // MainNavigationItem(title: 'Languages', iconData: Icons.language, route: LanguageWrapperRoute(), path: 'languages',),
    // MainNavigationItem(title: 'Subscriptions', iconData: Icons.subscriptions, route: RegionWrapperRoute(), path: 'regions',
    //   children: <MainNavigationItem>[
    //     MainNavigationItem(title: 'Regions', iconData: Icons.my_location, route: RegionWrapperRoute(), path: 'regions',),
    //     MainNavigationItem(title: 'Kinds', iconData: Icons.title, route: KindWrapperRoute(), path: 'kinds',),
    //     MainNavigationItem(title: 'Subscription Types', iconData: Icons.account_tree, route: SubscriptionTypeWrapperRoute(), path: 'subscription_types',),
    //     MainNavigationItem(title: 'Subscriptions', iconData: Icons.share, route: SubscriptionWrapperRoute(), path: 'subscriptions',),
    //     MainNavigationItem(title: 'User Subscripting', iconData: Icons.manage_accounts, route: UserSubscriptingWrapperRoute(), path: 'user_subscripting',),
    //   ],
    // ),
    // MainNavigationItem(title: 'Currencies', iconData: Icons.paid, route: CurrencyWrapperRoute(), path: 'currencies',
    //   children: <MainNavigationItem>[
    //     MainNavigationItem(title: 'Currencies', iconData: Icons.attach_money, route: CurrencyWrapperRoute(), path: 'currencies',),
    //     MainNavigationItem(title: 'Currency Notes', iconData: Icons.description, route: CurrencyNoteWrapperRoute(), path: 'currency_notes',),
    //   ],
    // ),
    // MainNavigationItem(title: 'Floor Plans', iconData: Icons.menu, route: FloorPlanWrapperRoute(), path: 'floor_plans',
    //   children: <MainNavigationItem>[
    //     MainNavigationItem(title: 'Floor Plan Types', iconData: Icons.menu_open, route: FloorPlanTypeWrapperRoute(), path: 'floor_plan_types',),
    //     MainNavigationItem(title: 'Floor Plans', iconData: Icons.menu, route: FloorPlanWrapperRoute(), path: 'floor_plans',),
    //   ],
    // ),

    // MainNavigationItem(title: 'Taxes', iconData: Icons.account_balance, route: TaxWrapperRoute(), path: 'taxes',
    //   children: <MainNavigationItem>[
    //     MainNavigationItem(title: 'Taxes', iconData: Icons.account_balance, route: TaxWrapperRoute(), path: 'taxes',),
    //     MainNavigationItem(title: 'Tax Types', iconData: Icons.euro_symbol, route: TaxTypeWrapperRoute(), path: 'tax_types',),
    //     MainNavigationItem(title: 'Tax Apply Types', iconData: Icons.gavel, route: TaxApplyTypeWrapperRoute(), path: 'tax_apply_types',),
    //     MainNavigationItem(title: 'Tax Applying', iconData: Icons.picture_in_picture, route: TaxApplyingWrapperRoute(), path: 'tax_applying',),
    //   ],
    // ),
    // MainNavigationItem(title: 'Discounts', iconData: Icons.money_off, route: DiscountWrapperRoute(), path: 'discounts',
    //   children: <MainNavigationItem>[
    //     MainNavigationItem(title: 'Discounts', iconData: Icons.money_off, route: DiscountWrapperRoute(), path: 'discounts',),
    //     MainNavigationItem(title: 'Discount Types', iconData: Icons.local_atm, route: DiscountTypeWrapperRoute(), path: 'discount_types',),
    //     MainNavigationItem(title: 'Manual Value Types', iconData: Icons.create, route: ManualValueTypeWrapperRoute(), path: 'manual_value_types',),
    //     MainNavigationItem(title: 'Reference Types', iconData: Icons.no_photography, route: ReferenceTypeWrapperRoute(), path: 'reference_types',),
    //   ],
    // ),
    // MainNavigationItem(title: 'Promotions', iconData: Icons.redeem, route: PromotionWrapperRoute(), path: 'promotions',
    //   children: <MainNavigationItem>[
    //     MainNavigationItem(title: 'Promotions', iconData: Icons.redeem, route: PromotionWrapperRoute(), path: 'promotions',),
    //     MainNavigationItem(title: 'Promotion Targets', iconData: Icons.adjust, route: PromotionTargetWrapperRoute(), path: 'promotion_targets',),
    //     MainNavigationItem(title: 'Promotion Types', iconData: Icons.title, route: PromotionTypeWrapperRoute(), path: 'promotion_types',),
    //     MainNavigationItem(title: 'Promotion Sub Types', iconData: Icons.crib, route: PromotionSubTypeWrapperRoute(), path: 'promotion_sub_types',),
    //     MainNavigationItem(title: 'Promotion Conditions', iconData: Icons.ac_unit, route: PromotionConditionWrapperRoute(), path: 'promotion_conditions',),
    //     MainNavigationItem(title: 'Promotion Details', iconData: Icons.privacy_tip, route: PromotionDetailWrapperRoute(), path: 'promotion_details',),
    //   ],
    // ),
    // MainNavigationItem(title: 'Campaigns', iconData: Icons.campaign, route: CampaignWrapperRoute(), path: 'campaigns',
    //   children: <MainNavigationItem>[
    //     MainNavigationItem(title: 'Campaigns', iconData: Icons.campaign, route: CampaignWrapperRoute(), path: 'campaigns',),
    //     MainNavigationItem(title: 'Campaign Types', iconData: Icons.hearing, route: CampaignTypeWrapperRoute(), path: 'campaign_types',),
    //   ],
    // ),
    // MainNavigationItem(title: 'Channels', iconData: Icons.signal_cellular_0_bar, route: ChannelWrapperRoute(), path: 'channels',
    //   children: <MainNavigationItem>[
    //     MainNavigationItem(title: 'Channels', iconData: Icons.signal_cellular_0_bar, route: ChannelWrapperRoute(), path: 'channels',),
    //     MainNavigationItem(title: 'Channel Types', iconData: Icons.podcasts, route: ChannelTypeWrapperRoute(), path: 'channel_types',),
    //   ],
    // ),
    // MainNavigationItem(title: 'Sources', iconData: Icons.architecture, route: SourceWrapperRoute(), path: 'sources',
    //   children: <MainNavigationItem>[
    //     MainNavigationItem(title: 'Sources', iconData: Icons.architecture, route: SourceWrapperRoute(), path: 'sources',),
    //     MainNavigationItem(title: 'Source Types', iconData: Icons.imagesearch_roller, route: SourceTypeWrapperRoute(), path: 'source_types',),
    //   ],
    // ),
    // MainNavigationItem(title: 'Giveaways', iconData: Icons.card_giftcard, route: GiveawayWrapperRoute(), path: 'giveaways',
    //   children: <MainNavigationItem>[
    //     MainNavigationItem(title: 'Giveaways', iconData: Icons.card_giftcard, route: GiveawayWrapperRoute(), path: 'giveaways',),
    //     MainNavigationItem(title: 'Giveaway Types', iconData: Icons.present_to_all, route: GiveawayTypeWrapperRoute(), path: 'giveaway_types',),
    //     MainNavigationItem(title: 'Giveaway Condition Types', iconData: Icons.timelapse, route: GiveawayConditionTypeWrapperRoute(), path: 'giveaway_condition_types',),
    //   ],
    // ),
    // MainNavigationItem(title: 'Photos', iconData: Icons.photo, route: PhotoWrapperRoute(), path: 'photos',
    //   children: <MainNavigationItem>[
    //     MainNavigationItem(title: 'Photos', iconData: Icons.photo, route: PhotoWrapperRoute(), path: 'photos',),
    //     MainNavigationItem(title: 'Photo Types', iconData: Icons.photo_album, route: PhotoTypeWrapperRoute(), path: 'photo_types',),
    //   ],
    // ),
    // MainNavigationItem(title: 'Serial Number Type', iconData: Icons.confirmation_number, route: SerialNumberTypeWrapperRoute(), path: 'serial_number_types',),
    // MainNavigationItem(title: 'Numbering Type', iconData: Icons.format_list_numbered, route: NumberingTypeWrapperRoute(), path: 'numbering_types',),
    // MainNavigationItem(title: 'Version Type', iconData: Icons.edit_road_sharp, route: VersionTypeWrapperRoute(), path: 'version_types',),
  ];
  
  @override
  Widget build(BuildContext context) {
    return BlocListener<NetworkCheckerBloc, NetworkCheckerState>(
      listener: (context, state) {
        if(state is IsOnline){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Online using ${state.type}'),),);
        }
        else{
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Offline'),),);
        }
      },
      child: MainScaffold(
        appBar: AppBar(
          leading: _toggleDrawerButton(),
          backgroundColor: Colors.grey,
        ),
        drawer: MainNavigation(
          navigationItems: _navigationItems,
        ),
        endDrawer: const MainEndDrawer(),
        body: const SafeArea(
          child: AutoRouter(),
        ),
      ),
    );
  }

  Widget _toggleDrawerButton(){
    return Builder(
        builder: (context) {
          return AnimatedMenuIcon(
            onPressed: () => MainScaffold.of(context).toggleDrawer(),
          );
        }
    );
  }
}