import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/Ui/Category/bloc/category_bloc.dart';
import 'package:flutter_application_1/Ui/SubCategory/bloc/content_bloc.dart';
import 'package:flutter_application_1/Models/Subprodactsmodel.dart';
import 'package:flutter_application_1/Models/caregoriesmodel.dart';
import 'package:flutter_application_1/Ui/Product/Productui.dart';

import 'package:flutter_application_1/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                return Name(
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

class Categories extends StatelessWidget {
  Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is CetcategoriesFailed) {
          return const Text("wrongggggg");
        } else if (state is Cetcategoriessucsess) {
          return Sucsess(
            cate: state.categoryy,
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

class Sucsess extends StatelessWidget {
  final Categoryy cate;
  Sucsess({
    super.key,
    required this.cate,
  });
  final int currentindex = sharedPreferences!.getInt("catid") ?? 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 35.0.h,
        margin: const EdgeInsets.only(top: 16),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:
                cate.data!.categories.length, //cate.data!.categories.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () async {
                  await BlocProvider.of<ContentBloc>(context)
                    ..add(GetsubCategories());
                  sharedPreferences!
                      .setInt("catid", cate.data!.categories[index].id);
                },
                child: Container(
                  margin: EdgeInsets.only(right: 10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: Colors.greenAccent),
                  child: Text(
                    "${cate.data!.categories[index].name}",
                    style: TextStyle(fontSize: 12.sp),
                  ),
                ),
              );
            }),
      ),
    );
  }
}

class Subcategories extends StatefulWidget {
  final List<Datum> subcate;
  Subcategories({super.key, required this.subcate});

  @override
  State<Subcategories> createState() => _SubcategoriesState(subcate: subcate);
}

class _SubcategoriesState extends State<Subcategories> {
  final List<Datum> subcate;

  _SubcategoriesState({required this.subcate});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: ListView.builder(
        itemCount: subcate.length, //subcate.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(
                "${subcate[index].name}",
                style: TextStyle(fontSize: 12.sp),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Name extends StatelessWidget {
  final List<Datum> subcate;
  const Name({super.key, required this.subcate});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: subcate.length, //subcate.length,
        itemBuilder: (context, index) {
          return Center(
            child: Card(
              child: ListTile(
                onTap: () {
                  sharedPreferences!.setInt("proid", subcate[index].id);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProdactUi(),
                      ));
                },
                title: Text(
                  "${subcate[index].name}",
                  style: TextStyle(fontSize: 12.sp),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
