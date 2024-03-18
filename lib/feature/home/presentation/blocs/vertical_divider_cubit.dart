import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'vertical_divider_state.dart';

class VerticalDividerCubit extends Cubit<VerticalDividerState> {
  VerticalDividerCubit() : super(Successfully());

  void getAndSetBodyHeight({
    required GlobalKey globalKey,
  }) {
    emit(
      (state as Successfully).copyWith(
        bodyHeight: _getBoxHeight(globalKey.currentContext),
      ),
    );
  }

  void getAndSetFooterHeight({
    required GlobalKey globalKey,
  }) {
    emit(
      (state as Successfully).copyWith(
        footerHeight: _getBoxHeight(globalKey.currentContext),
      ),
    );
  }

  double _getBoxHeight(BuildContext? context) {
    double height = 400;
    if (context != null) {
      final box = context.findRenderObject() as RenderBox;
      if (box.size.height != double.infinity) {
        height = box.size.height;
      }
    }
    return height;
  }
}
