import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schooler_chat/constants.dart';
import 'package:schooler_chat/features/home/data/repo/home_repo.dart';
import 'package:schooler_chat/features/home/presentation/cubit/home_cubit.dart';
import 'package:schooler_chat/features/home/presentation/cubit/home_states.dart';
import 'package:schooler_chat/features/home/presentation/views/widgets/custom_product_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(HomeRepo())..fetchProducts(),
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return state is HomeLoadingState
                ? const Center(child: CircularProgressIndicator())
                : state is HomeFailureState
                    ? Center(child: Text(state.errMessage, style: const TextStyle(color: Colors.white)))
                    : state is HomeSuccessState
                        ? state.products.isEmpty
                            ? const Center(child: Text('No products found', style: TextStyle(color: Colors.white)))
                            : SafeArea(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(kLogo, height: 60),
                                        const SizedBox(width: 50),
                                        const Text(
                                          'Shop with me',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                            fontFamily: 'Pacifico',
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Expanded(
                                      child: GridView.builder(
                                        padding: const EdgeInsets.symmetric(horizontal: 16),                                    
                                        itemCount: state.products.length, 
                                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 12,
                                          mainAxisSpacing: 12,
                                          childAspectRatio: 0.8,
                                        ),
                                        itemBuilder: (context, index) {
                                          return CustomProductItem(
                                            title: state.products[index].title,
                                            description: state.products[index].description,
                                            imageUrl: state.products[index].imageUrl ?? "https://cdn.dummyjson.com/product-images/beauty/eyeshadow-palette-with-mirror/thumbnail.webp",
                                            price: state.products[index].price,
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              )
                        : const SizedBox();
  }),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xFF1B2631),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.orangeAccent,
          unselectedItemColor: Colors.white60,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.star_border), label: "Favorites"),
            BottomNavigationBarItem(icon: Icon(Icons.category), label: "Categories"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }
}