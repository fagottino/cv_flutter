import 'package:aorlando/feature/home/presentation/blocs/vertical_divider_cubit.dart';
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
    test('getAndSetBodyHeight emits updated body height', () async {
      when(mockGlobalKey.currentContext).thenReturn(mockBuildContext);
      when(mockBuildContext.findRenderObject()).thenReturn(mockRenderBox);
      when(mockRenderBox.size).thenReturn(const Size(200, 200));

      final expectation = expectLater(
        verticalDividerCubit.stream,
        emitsInOrder([
          const Successfully(bodyHeight: 200),
        ]),
      );

      verticalDividerCubit.getAndSetBodyHeight(globalKey: mockGlobalKey);

      await expectation;
      await verticalDividerCubit.close();
    });

    test('getAndSetFooterHeight emits updated footer height', () async {
      when(mockGlobalKey.currentContext).thenReturn(mockBuildContext);
      when(mockBuildContext.findRenderObject()).thenReturn(mockRenderBox);
      when(mockRenderBox.size).thenReturn(const Size(200, 200));

      final expectation = expectLater(
        verticalDividerCubit.stream,
        emitsInOrder([
          const Successfully(footerHeight: 200),
        ]),
      );

      verticalDividerCubit.getAndSetFooterHeight(globalKey: mockGlobalKey);

      await expectation;
      await verticalDividerCubit.close();
    });
  });
}
