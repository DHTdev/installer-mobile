import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
// Using Flutter's RichText instead of the external 'substring_highlight' package.

class AutocompleteOptionsList extends StatelessWidget {
  const AutocompleteOptionsList({
    Key? key,
    required this.textFieldKey,
    required this.textController,
    required this.options,
    required this.onSelected,
    required this.textStyle,
    this.textAlign = TextAlign.start,
    this.optionBackgroundColor,
    this.optionHighlightColor,
    this.textHighlightStyle,
    this.maxHeight,
    this.elevation = 4.0,
  }) : super(key: key);

  final GlobalKey textFieldKey;
  final TextEditingController textController;
  final List<String> options;
  final Function(String) onSelected;
  final Color? optionHighlightColor;
  final Color? optionBackgroundColor;
  final TextStyle textStyle;
  final TextStyle? textHighlightStyle;
  final TextAlign textAlign;
  final double? maxHeight;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    final textFieldBox =
        textFieldKey.currentContext!.findRenderObject() as RenderBox;
    final textFieldWidth = textFieldBox.size.width;
    return Align(
      alignment: Directionality.of(context) == TextDirection.rtl
          ? Alignment.topRight
          : Alignment.topLeft,
      child: Material(
        elevation: elevation,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: textFieldWidth,
            maxHeight: maxHeight ?? 200,
          ),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: options.length,
            itemBuilder: (context, index) {
              final option = options.elementAt(index);
              return InkWell(
                onTap: () => onSelected(option),
                child: Builder(builder: (context) {
                  final bool highlight =
                      AutocompleteHighlightedOption.of(context) == index;
                  if (highlight) {
                    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                      Scrollable.ensureVisible(context, alignment: 0.5);
                    });
                  }

                  // Build highlighted text using RichText to avoid external dependency.
                  final term = textController.text;
                  final List<TextSpan> spans = [];
                  if (term.isEmpty) {
                    spans.add(TextSpan(text: option, style: textStyle));
                  } else {
                    final lowerOption = option.toLowerCase();
                    final lowerTerm = term.toLowerCase();
                    int start = 0;
                    int matchIndex = lowerOption.indexOf(lowerTerm, start);
                    while (matchIndex != -1) {
                      if (matchIndex > start) {
                        spans.add(TextSpan(
                            text: option.substring(start, matchIndex),
                            style: textStyle));
                      }
                      spans.add(TextSpan(
                          text: option.substring(
                              matchIndex, matchIndex + term.length),
                          style: textHighlightStyle ?? textStyle));
                      start = matchIndex + term.length;
                      matchIndex = lowerOption.indexOf(lowerTerm, start);
                    }
                    if (start < option.length) {
                      spans.add(TextSpan(
                          text: option.substring(start), style: textStyle));
                    }
                  }

                  return Container(
                    color: highlight
                        ? optionHighlightColor ?? Theme.of(context).focusColor
                        : optionBackgroundColor,
                    padding: const EdgeInsets.all(16.0),
                    child: RichText(
                      textAlign: textAlign,
                      text: TextSpan(style: textStyle, children: spans),
                    ),
                  );
                }),
              );
            },
          ),
        ),
      ),
    );
  }
}
