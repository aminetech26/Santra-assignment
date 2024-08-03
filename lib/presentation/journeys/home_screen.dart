import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        backgroundColor: const Color(0xFFF7F7F8),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder(
                  bloc: _userAreaBloc,
                  builder: (context, state) {
                    if (state is UserAreaLoaded) {
                      return SafeArea(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              IconButton(
                                icon: Icon(Icons.menu),
                                onPressed: () {},
                              ),
                              Row(
                                children: [
                                  Text('Home, ${state.userArea}'),
                                  Icon(Icons.arrow_drop_down),
                                ],
                              ),
                              InkWell(
                                onTap: () {},
                                child: Stack(
                                  children: [
                                    Image.asset(
                                      'assets/images/shopping_card.png',
                                      width: 35.w,
                                      height: 35.h,
                                    ),
                                    Positioned(
                                      top: 5,
                                      right: 5,
                                      child: CircleAvatar(
                                        radius: 8,
                                        backgroundColor: Colors.yellow,
                                        child: BlocBuilder<ShopCardBloc,
                                            ShopCardState>(
                                          bloc: _shopCardBloc,
                                          builder: (context, state) {
                                            if (state is ShopCardLoaded) {
                                              return Text(
                                                '${state.itemsNumber}',
                                                textAlign: TextAlign.center,
                                              );
                                            } else {
                                              return const Text('0');
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ]),
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  }),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          focusColor: Colors.white,
                          fillColor: Colors.white,
                          labelText: 'Search...',
                          suffixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      color: Colors.white,
                      child: Image.asset(
                        'assets/images/setting.png',
                        width: 35.w,
                        height: 35.h,
                      ),
                    ),
                  ),
                ],
              ),
              BlocBuilder<CategoriesBloc, CategoriesState>(
                builder: (context, state) {
                  if (state is CategoriesLoaded) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: SizedBox(
                        height: 40.h,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  if (state.categories[index].imageThumb != "")
                                    CachedNetworkImage(
                                      imageUrl:
                                          state.categories[index].imageThumb!,
                                      width: 15.w,
                                      height: 15.h,
                                    ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                      state.categories[index].subDivisionName!),
                                ],
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                width: 20.w,
                              );
                            },
                            itemCount: state.categories.length),
                      ),
                    );
                  }
                  return const CircularProgressIndicator();
                },
              ),
              BlocBuilder<HomeSliderBloc, HomeSliderState>(
                builder: (context, state) {
                  if (state is HomeSliderLoaded) {
                    return SizedBox(
                        height: 200.h,
                        child: CarouselSlider(
                            options: CarouselOptions(
                              height: 400,
                              aspectRatio: 16 / 9,
                              viewportFraction: 0.8,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 3),
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              scrollDirection: Axis.horizontal,
                            ),
                            items: state.homeSliders.map((key) {
                              final index = state.homeSliders.indexOf(key);
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                      width: MediaQuery.of(context).size.width,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 5.0),
                                      decoration:
                                          BoxDecoration(color: Colors.grey),
                                      child: CachedNetworkImage(
                                        placeholder: (context, url) =>
                                            const Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                        imageUrl:
                                            state.homeSliders[index].imagePath!,
                                        fit: BoxFit.cover,
                                      ));
                                },
                              );
                            }).toList()));
                  }
                  return const CircularProgressIndicator();
                },
              ),
              Placeholder(
                fallbackHeight: 50.h,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  'Top Chefs',
                  textAlign: TextAlign.start,
                ),
              ),
              BlocBuilder<TopSellersBloc, TopSellersState>(
                builder: (context, state) {
                  if (state is TopSellersLoaded) {
                    return SizedBox(
                      height: 120.h,
                      child: ListView.separated(
                          separatorBuilder: (context, index) => SizedBox(
                                width: 20.w,
                              ),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                CachedNetworkImage(
                                  imageUrl:
                                      state.topSellers[index].sellerLogoCdn!,
                                  width: 100.w,
                                  height: 100.h,
                                ),
                                Text(state.topSellers[index].businessName!),
                              ],
                            );
                          },
                          itemCount: state.topSellers.length),
                    );
                  }
                  return const CircularProgressIndicator();
                },
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  'All Chefs',
                  textAlign: TextAlign.start,
                ),
              ),
              BlocBuilder<AllSellersBloc, AllSellersState>(
                builder: (context, state) {
                  if (state is AllSellersLoaded) {
                    return SizedBox(
                      height: 200.h, // Adjust the height as needed
                      child: ListView.separated(
                        physics:
                            const BouncingScrollPhysics(), // Allows scrolling
                        separatorBuilder: (context, index) => SizedBox.shrink(),
                        scrollDirection: Axis.vertical,
                        itemCount: state.allSellers.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                              color: Colors.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Wrap the Stack in a ConstrainedBox
                                  ConstrainedBox(
                                    constraints: BoxConstraints(
                                      maxHeight: 120
                                          .h, // Set a fixed height for the Stack
                                      minHeight:
                                          120.h, // You can adjust this value
                                    ),
                                    child: Stack(
                                      fit: StackFit.expand,
                                      children: [
                                        CachedNetworkImage(
                                          imageUrl: state
                                              .allSellers[index].sellerLogoCdn!,
                                          width: double
                                              .infinity, // Use double.infinity for width
                                          height:
                                              100.h, // Ensure a fixed height
                                          fit: BoxFit
                                              .fill, // Fit the image correctly
                                        ),
                                        Positioned(
                                          top: 10,
                                          left: 10,
                                          child: CircleAvatar(
                                            radius:
                                                16, // Adjusted for better readability
                                            backgroundColor: Colors.black,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const Icon(Icons.star,
                                                    color: Colors.yellow,
                                                    size: 12),
                                                const SizedBox(
                                                    width:
                                                        4), // Add spacing between icon and text
                                                Text(
                                                  '${state.allSellers[index].anyPromotion!} % OFF',
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize:
                                                        12, // Adjust font size as needed
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            state.allSellers[index]
                                                .businessName!,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            const Icon(Icons.star,
                                                color: Color(0xFFFFEB3B)),
                                            const SizedBox(
                                                width:
                                                    4), // Add spacing between icon and text
                                            Text(state.allSellers[index]
                                                .sellerRating!),
                                          ],
                                        ),
                                        SizedBox(width: 10.w),
                                        Row(
                                          children: [
                                            const Icon(Icons.fire_truck,
                                                color: Color(0xFFFFEB3B)),
                                            const SizedBox(
                                                width:
                                                    4), // Add spacing between icon and text
                                            Text(state.allSellers[index]
                                                .preparationTime!),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
