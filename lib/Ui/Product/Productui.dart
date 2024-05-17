import 'package:flutter/material.dart';
import 'package:flutter_application_1/Ui/Product/bloc/product_bloc.dart';
import 'package:flutter_application_1/Models/Prodactmodel.dart';



import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProdactUi extends StatefulWidget {
  const ProdactUi({super.key});

  @override
  State<ProdactUi> createState() => _ProdactUiState();
}

class _ProdactUiState extends State<ProdactUi> {
  GetProdacts getProdacts = GetProdacts();
  @override
  void initState() {
    BlocProvider.of<ProductBloc>(context).add(GetProduct());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
      if (state is LoadingProduct) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is GetProductSucsess) {
        return Expanded(
          child: Center(
            child: Card(
              child: ListTile(
                title: Text(
                  "${state.getProdacts.data![0].name}",
                  style: TextStyle(fontSize: 12.sp),
                ),
                subtitle: Text("${state.getProdacts.data![0].price}",
                    style: TextStyle(fontSize: 12.sp)),
              ),
            ),
          ),
        );
      }
      return Center(child: CircularProgressIndicator());
    });
  }
}
