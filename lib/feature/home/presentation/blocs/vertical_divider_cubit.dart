import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'vertical_divider_state.dart';

class VerticalDividerCubit extends Cubit<VerticalDividerState> {
  VerticalDividerCubit() : super(Successfully());

  Future<void> setBodyHeight({
    required double height,
  }) async {
    emit(
      (state as Successfully).copyWith(bodyHeight: height == double.infinity ? 400 : height),
    );
  }

  Future<void> setFooterHeight({
    required double height,
  }) async {
    // (state as Successfully).copyWith(footerHeight: height == double.infinity ? 400 : height);
    emit(
      (state as Successfully).copyWith(footerHeight: height == double.infinity ? 400 : height),
    );
  }
}
