part of 'vertical_divider_cubit.dart';

sealed class VerticalDividerState extends Equatable {
  const VerticalDividerState({
    this.bodyHeight = 0,
    this.footerHeight = 0,
  });

  final double bodyHeight;
  final double footerHeight;

  @override
  List<Object?> get props => [bodyHeight, footerHeight];
}

class Successfully extends VerticalDividerState {
  const Successfully({
    super.bodyHeight = 0,
    super.footerHeight = 0,
  });

  @override
  List<Object?> get props => [bodyHeight, footerHeight];

  Successfully copyWith({
    double? bodyHeight,
    double? footerHeight,
  }) {
    return Successfully(
      bodyHeight: bodyHeight ?? this.bodyHeight,
      footerHeight: footerHeight ?? this.footerHeight,
    );
  }
}
