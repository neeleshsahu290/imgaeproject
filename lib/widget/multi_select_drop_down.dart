import 'package:flutter/material.dart';

import 'my_text.dart';

class MultiSelectDropDown<T> extends StatefulWidget {
  final List<T> anyList;
  final Function(List<T>) onSelectionChanged;
  final List<T> selectedList;
  final bool isCustomObject;

  const MultiSelectDropDown(
      {Key? key,
      required this.anyList,
      required this.onSelectionChanged,
      required this.selectedList,
      this.isCustomObject = false})
      : super(key: key);

  @override
  State<MultiSelectDropDown> createState() => _MultiSelectDropDownState();
}

class _MultiSelectDropDownState<T> extends State<MultiSelectDropDown> {
  // String selectedChoice = "";
  List<T> selectedChoices = [];

  @override
  void initState() {
    super.initState();
    if (widget.selectedList.isNotEmpty) {
      selectedChoices = widget.selectedList as List<T>;
    } else {
      selectedChoices = [];
    }
  }

  _buildChoiceList() {
    List<Widget> choices = [];

    for (var item in widget.anyList) {
      choices.add(Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          color: selectedChoices.contains(item)
              ? Colors.grey.shade700
              : Colors.white,
          border: Border.all(color: Colors.grey.shade500),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: InkWell(
          onTap: () {
            setState(() {
              selectedChoices.contains(item)
                  ? selectedChoices.remove(item)
                  : selectedChoices.add(item);
              widget.onSelectionChanged(selectedChoices);
            });
          },
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
            child: MyText(
              text: widget.isCustomObject ? item.name : item,
              color:
                  selectedChoices.contains(item) ? Colors.white : Colors.black,
            ),
          ),
        ),
      ));
    }

    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5.0,
      children: _buildChoiceList(),
    );
  }
}
