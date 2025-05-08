import 'package:findet/blocs/global/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuoteItem extends StatefulWidget {
  const QuoteItem({super.key, required this.quoteText});

  final String quoteText;

  @override
  State<QuoteItem> createState() => _QuoteItemState();
}

class _QuoteItemState extends State<QuoteItem> with SingleTickerProviderStateMixin {
  bool _isDismissed = false;
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 2.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Запускаем анимацию при загрузке виджета
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.watch<ThemeBloc>().state.colors;

    return _isDismissed
        ? const SizedBox.shrink()
        : Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.down,
            onDismissed: (direction) {
              setState(() {
                _isDismissed = true;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: SlideTransition(
                position: _offsetAnimation,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: colors.quoteBackground,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Quote of the day',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            widget.quoteText,
                            style: TextStyle(
                              fontSize: 12,
                              color: colors.quoteTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: -90,
                      right: 0,
                      child: Image.asset(
                        'lib/assets/images/quotes/first_day.png',
                        width: 150,
                        height: 150,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
