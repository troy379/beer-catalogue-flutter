import 'package:beer_catalogue_flutter/presentation/common/adapters/exception_to_error_message_adapter.dart';
import 'package:beer_catalogue_flutter/presentation/common/ui/app_loading_overlay.dart';
import 'package:beer_catalogue_flutter/presentation/common/ui/app_try_again_error.dart';
import 'package:flutter/material.dart';

class AppPaginatedList<T> extends StatefulWidget {
  final List<T> items;
  final NullableIndexedWidgetBuilder itemsBuilder;
  final bool isLoading;
  final Exception? loadingException;
  final VoidCallback onLoadItems;

  const AppPaginatedList({
    required this.items,
    required this.itemsBuilder,
    required this.isLoading,
    required this.loadingException,
    required this.onLoadItems,
    Key? key,
  }) : super(key: key);

  @override
  State<AppPaginatedList<T>> createState() => _AppPaginatedListState<T>();
}

class _AppPaginatedListState<T> extends State<AppPaginatedList<T>> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.extentAfter < 200 && !widget.isLoading && widget.loadingException == null) {
        widget.onLoadItems();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (widget.items.isEmpty && widget.isLoading) ...{
          const AppLoadingOverlay(),
        } else if (widget.items.isEmpty && widget.loadingException != null) ...{
          AppSimpleTryAgainError(
            message: ExceptionToErrorMessageAdapter.getMessage(context, widget.loadingException!),
            onTryAgain: widget.onLoadItems,
          ),
        } else ...{
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  widget.itemsBuilder,
                  childCount: widget.items.length,
                ),
              ),
              if (widget.items.isNotEmpty && widget.isLoading) ...{
                const SliverPadding(
                  padding: EdgeInsets.all(24),
                  sliver: SliverToBoxAdapter(child: AppLoadingOverlay()),
                )
              },
              if (widget.items.isNotEmpty && widget.loadingException != null) ...{
                SliverPadding(
                  padding: const EdgeInsets.all(24),
                  sliver: SliverToBoxAdapter(
                    child: AppSimpleTryAgainError(
                      message: ExceptionToErrorMessageAdapter.getMessage(context, widget.loadingException!),
                      onTryAgain: widget.onLoadItems,
                    ),
                  ),
                ),
              },
              SliverToBoxAdapter(
                child: SizedBox(height: MediaQuery.of(context).padding.bottom),
              ),
            ],
          ),
        },
      ],
    );
  }
}
