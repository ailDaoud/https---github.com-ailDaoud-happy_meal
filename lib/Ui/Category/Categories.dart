import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/Ui/Category/bloc/category_bloc.dart';
import 'package:flutter_application_1/Ui/SubCategory/bloc/content_bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Widget.dart';

class CategoriesUiState extends StatefulWidget {
  const CategoriesUiState({super.key});

  @override
  State<CategoriesUiState> createState() => _CategoriesUiStateState();
}

class _CategoriesUiStateState extends State<CategoriesUiState> {
  @override
  void initState() {
    BlocProvider.of<CategoryBloc>(context).add(GetCategories());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Text("Home "),
      ),
      body: Column(
        children: [
          Text(
            "Categories",
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 24,
          ),
          Categories(),
          SizedBox(
            height: MediaQuery.of(context).size.height / 20,
          ),
          BlocBuilder<ContentBloc, ContentState>(
            builder: (context, state) {
              if (state is CetSubcategoriesFailed) {
                return const Text("wrongggggg333");
              } else if (state is CetSubcategoriessucsess) {
                return SubcategoriesName(
                    subcate: state
                        .subcategory); //Subcategories(subcate: state.subcategory);
              } else if (state is LoadingSubCategories) {
                return const Center(
                    child: Text(
                  "there is no item !!!",
                  style: TextStyle(color: Colors.red),
                ));
              }
              return const SizedBox();
            },
          )
        ],
      ),
    );
  }
}
