import 'package:flutter/material.dart';

import '../styles/app_colors.dart';
import '../styles/app_text_styles.dart';

class AppErrorStateWidget extends StatelessWidget {
  const AppErrorStateWidget({
    super.key,
    required this.message,
    this.title = 'Qualcosa è andato storto',
    this.retryLabel = 'Riprova',
    this.onRetry,
    this.icon = Icons.error_outline_rounded,
  });

  final String message;
  final String title;
  final String retryLabel;
  final VoidCallback? onRetry;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double horizontalPadding = constraints.maxWidth < 600 ? 20 : 32;

          return ColoredBox(
            color: AppColors.primarySurface,
            child: Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: 24,
                ),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 520,
                  ),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(
                        color: AppColors.primaryBorder,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryBorder.withAlpha(70),
                          blurRadius: 24,
                          offset: const Offset(0, 14),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 28,
                        vertical: 32,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 72,
                            height: 72,
                            decoration: const BoxDecoration(
                              color: AppColors.primarySurface,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              icon,
                              size: 34,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Text(
                            title,
                            textAlign: TextAlign.center,
                            style: AppTextStyles.sectionTitleTextStyle.copyWith(
                              fontSize: 24,
                              letterSpacing: 0.3,
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            message,
                            textAlign: TextAlign.center,
                            style: AppTextStyles.defaultRegularTextStyle.copyWith(
                              fontSize: 16,
                              height: 1.5,
                              color: AppColors.black.withAlpha(180),
                            ),
                          ),
                          if (onRetry != null) ...[
                            const SizedBox(
                              height: 28,
                            ),
                            ElevatedButton(
                              onPressed: onRetry,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryColor,
                                foregroundColor: Colors.white,
                                elevation: 0,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: Text(
                                retryLabel,
                                style: AppTextStyles.defaultBoldTextStyle.copyWith(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
