import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/Prodactmodel.dart';
import 'package:flutter_application_1/bloc/content_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProdactUi extends StatefulWidget {
  const ProdactUi({super.key});

  @override
  State<ProdactUi> createState() => _ProdactUiState();
}

class _ProdactUiState extends State<ProdactUi> {
  GetProdacts getProdacts = GetProdacts();
  @override
  void initState() {
    BlocProvider.of<ContentBloc>(context).add(GetProduct());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContentBloc, ContentState>(builder: (context, state) {
      if (state is LoadingProduct) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is GetProductSucsess) {
        return Expanded(
          child: Card(
            child: ListTile(
              title: Text("${state.getProdacts.data![0].name}"),
              subtitle: Text("${state.getProdacts.data![0].price}"),
            ),
          ),
        );
      }
      return Container();
    });
  }
}
