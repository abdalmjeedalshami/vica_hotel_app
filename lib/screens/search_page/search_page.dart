import 'package:flutter/material.dart';
import 'package:vica_hotel_app/utils/icons.dart';
import 'package:vica_hotel_app/utils/responsive_util.dart';
import 'package:vica_hotel_app/widgets/custom_text_field.dart';
import 'package:vica_hotel_app/widgets/raleway_text.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController searchController = TextEditingController();
  DateTime? _startDate;
  DateTime? _endDate;
  int selectedCount = 0;


  void _pickStartDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _startDate = pickedDate; // Update _startDate directly
      });
    }
  }

  void _pickEndDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _endDate = pickedDate; // Update _endDate directly
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Date Picker Example')),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: responsive(context, 30)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customTextField(
                context,
                controller: searchController,
                hintText: 'Destination',
                prefix: AppIcons.backArrow,
              ),
              Wrap(
                spacing: responsive(context, 50),
                children: [
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () => _pickStartDate(context),
                        child: Text('Start'),
                      ),
                      SizedBox(height: 16),
                      Text(
                        _startDate != null
                            ? '${_startDate!.toLocal()}'.split(' ')[0]
                            : 'No Date Selected',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () => _pickEndDate(context),
                        child: Text('End'),
                      ),
                      SizedBox(height: 16),
                      Text(
                        _endDate != null
                            ? '${_endDate!.toLocal()}'.split(' ')[0]
                            : 'No Date Selected',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RalewayText.bold('People count:     '),
                  DropdownButton<int>(
                    value: selectedCount,
                      items: [
                        DropdownMenuItem(
                          value: 0,
                          child: Text('1'),
                        ),
                        DropdownMenuItem(
                          value: 1,
                          child: Text('2'),
                        ),
                        DropdownMenuItem(
                          value: 2,
                          child: Text('3'),
                        ),
                        DropdownMenuItem(
                          value: 3,
                          child: Text('4'),
                        )
                      ],
                      onChanged: (value) {
                      setState(() {});
                        selectedCount = value!;
                      }),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content:
                            Text('Searching for: ${searchController.text}')));
                  },
                  child: Text('Search'))
            ],
          ),
        ),
      ),
    );
  }
}
