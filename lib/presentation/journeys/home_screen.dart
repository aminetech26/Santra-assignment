import 'package:flutter/material.dart';
import 'package:santra_assignment/di/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:santra_assignment/presentation/blocs/all_sellers/all_sellers_bloc.dart';
import 'package:santra_assignment/presentation/blocs/categories/categories_bloc.dart';
import 'package:santra_assignment/presentation/blocs/home_slider/home_slider_bloc.dart';
import 'package:santra_assignment/presentation/blocs/shop_card/shop_card_bloc.dart';
import 'package:santra_assignment/presentation/blocs/top_sellers/top_sellers_bloc.dart';
import 'package:santra_assignment/presentation/blocs/user_area/user_area_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late AllSellersBloc _allSellersBloc;
  late TopSellersBloc _topSellersBloc;
  late CategoriesBloc _categoriesBloc;
  late HomeSliderBloc _homeSliderBloc;
  late ShopCardBloc _shopCardBloc;
  late UserAreaBloc _userAreaBloc;

  @override
  void initState() {
    super.initState();
    _allSellersBloc = getItInstance<AllSellersBloc>();
    _topSellersBloc = getItInstance<TopSellersBloc>();
    _categoriesBloc = getItInstance<CategoriesBloc>();
    _homeSliderBloc = getItInstance<HomeSliderBloc>();
    _shopCardBloc = getItInstance<ShopCardBloc>();
    _userAreaBloc = getItInstance<UserAreaBloc>();
    _userAreaBloc.add(UserAreaLoad());
    _shopCardBloc.add(ShopCardLoad());
    _categoriesBloc.add(CategoriesLoadEvent());
    _homeSliderBloc.add(HomeSliderLoadEvent());
    _topSellersBloc.add(TopSellersLoadEvent());
    _allSellersBloc.add(AllSellersLoadEvent());
  }

  @override
  void dispose() {
    super.dispose();
    _allSellersBloc.close();
    _topSellersBloc.close();
    _categoriesBloc.close();
    _homeSliderBloc.close();
    _shopCardBloc.close();
    _userAreaBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => _allSellersBloc,
        ),
        BlocProvider(
          create: (context) => _categoriesBloc,
        ),
        BlocProvider(
          create: (context) => _topSellersBloc,
        ),
        BlocProvider(
          create: (context) => _homeSliderBloc,
        ),
        BlocProvider(
          create: (context) => _userAreaBloc,
        ),
        BlocProvider(
          create: (context) => _shopCardBloc,
        ),
      ],
      child: Scaffold(
        body: Column(
          children: [
            BlocBuilder(builder: (context, state) {
              if (state is UserAreaLoaded) {
                return SafeArea(child: AppBar());
              } else {
                return CircularProgressIndicator();
              }
            }),
          ],
        ),
      ),
    );
  }
}
