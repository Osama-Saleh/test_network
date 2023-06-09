import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netwrok/Cubit/home_cubit.dart';
import 'package:netwrok/Cubit/home_cubit_state.dart';
import 'package:netwrok/Widget/home_screen/build_list_view.dart';
import 'package:animations/animations.dart';
import 'package:netwrok/view/details_Screen.dart';
import 'package:netwrok/view/favorites_items.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  // void setState(VoidCallback fn) {
  //   HomeCubit.get(context).getFavorite();
  //   // TODO: implement setState
  //   super.setState(fn);
  // }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color.fromRGBO(47, 70, 109, 60),
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FavoritesItemsScreen(),
                        ));
                  },
                  icon: Icon(Icons.favorite))
            ],
          ),
          body: HomeCubit.get(context).product == null
              ? const Center(child: CircularProgressIndicator())
              : SafeArea(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Container(
                          height: 100,
                          clipBehavior: Clip.antiAlias,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(offset: Offset(0, 5), blurRadius: 8)
                              ]),
                          child: OpenContainer(
                            transitionDuration:
                                const Duration(milliseconds: 1000),
                            closedBuilder: (context, action) {
                              return InkWell(
                                  onTap: action,
                                  child: BuildListView(index: index));
                            },
                            openBuilder: (context, action) =>
                                DetailsScreen(index: index),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 5,
                          ),
                      itemCount: HomeCubit.get(context).product!.length),
                ),
        );
      },
    );
  }
}
