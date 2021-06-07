import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:split_the_bill/widgets/cards/gradient_card.dart';
import 'package:split_the_bill/widgets/split_done_row.dart';

class SplitToImage extends StatelessWidget {
  GlobalKey _globalKey = GlobalKey();
  List<SplitDoneRow> splitRows;

  SplitToImage(this.splitRows);



  @override
  Widget build(BuildContext context) {
    ThemeData theme = Get.theme;

    return RepaintBoundary(
      key: _globalKey,
      child: GradientCard(
        colorTop: Color(0xFFFFFFFF),
        colorBottom: Color(0xFFEFFFF4),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Optimal split',
                style: theme.textTheme.headline2,
              ),
              SizedBox(height: 15),
              Column(
                children: splitRows,
              ),
              SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }
}
