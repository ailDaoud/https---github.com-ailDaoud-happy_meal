import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/caregoriesmodel.dart';
import 'package:flutter_application_1/bloc/login_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesUiState extends StatefulWidget {
  const CategoriesUiState({super.key});

  @override
  State<CategoriesUiState> createState() => _CategoriesUiStateState();
}

class _CategoriesUiStateState extends State<CategoriesUiState> {
  @override
  void initState() {
    BlocProvider.of<LoginBloc>(context).add(GetCategories());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home "),
      ),
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          if (state is CetcategoriesFailed) {
            return const Text("wrongggggg");
          } else if (state is Cetcategoriessucsess) {
            return Sucsess(cate:state.categoryy,);
          }
          return const Center(child: const CircularProgressIndicator());
        },
      ),
    );
  }
}

class Sucsess extends StatelessWidget {
  final Categoryy cate;
  const Sucsess({super.key, required this.cate,});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cate.data!.categories.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text("${cate.data!.categories[index].name}"),
          ),
        );
      },
    );
  }
}
