import 'package:aorlando/feature/home/presentation/blocs/vertical_divider_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'vertical_divider_cubit_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<GlobalKey>(),
  MockSpec<BuildContext>(),
  MockSpec<RenderBox>(),
])
void main() {
  late MockGlobalKey mockGlobalKey;
  late VerticalDividerCubit verticalDividerCubit;
  late MockBuildContext mockBuildContext;
  late MockRenderBox mockRenderBox;

  setUp(() {
    mockGlobalKey = MockGlobalKey();
    verticalDividerCubit = VerticalDividerCubit();
    mockBuildContext = MockBuildContext();
    mockRenderBox = MockRenderBox();
  });

  group('VerticalDividerCubit', () {
    blocTest<VerticalDividerCubit, VerticalDividerState>(
      'getAndSetBodyHeight - Successfully',
      build: () {
        when(mockGlobalKey.currentContext).thenReturn(mockBuildContext);
        when(mockBuildContext.findRenderObject()).thenReturn(mockRenderBox);
        when(mockRenderBox.size).thenReturn(const Size(200, 200));
        return verticalDividerCubit;
      },
      act: (cubit) {
        cubit.getAndSetBodyHeight(globalKey: mockGlobalKey);
      },
      expect: () => [
        Successfully(bodyHeight: 200),
      ],
    );

    blocTest<VerticalDividerCubit, VerticalDividerState>(
      'getAndSetFooterHeight - Successfully',
      build: () {
        when(mockGlobalKey.currentContext).thenReturn(mockBuildContext);
        when(mockBuildContext.findRenderObject()).thenReturn(mockRenderBox);
        when(mockRenderBox.size).thenReturn(const Size(200, 200));
        return verticalDividerCubit;
      },
      act: (cubit) {
        cubit.getAndSetFooterHeight(globalKey: mockGlobalKey);
      },
      expect: () => [
        Successfully(footerHeight: 200),
      ],
    );
  });
}
