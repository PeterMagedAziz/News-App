
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/states.dart';
import '../../shared/components/components.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
        builder: (context,state) {
          var list = NewsCubit.get(context).science;
          return ConditionalBuilder(
            condition: list.isNotEmpty,
            builder: (context) => ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context,index) => buildArticleItems(NewsCubit.get(context).science[index],context),
                separatorBuilder: (context,index) => myDivider(),
                itemCount: 20),
            fallback: (context) => const Center(
              child: CircularProgressIndicator(
              ),
            ),
          );
        },
        listener: (context,states) {}
    );
  }
}