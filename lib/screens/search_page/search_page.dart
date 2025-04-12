import 'package:flutter/material.dart';
import 'package:vica_hotel_app/utils/colors.dart';
import 'package:vica_hotel_app/utils/icons.dart';
import 'package:vica_hotel_app/utils/responsive_util.dart';
import 'package:vica_hotel_app/widgets/custom_text_field.dart';
import 'package:vica_hotel_app/widgets/raleway_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  final TextEditingController searchController = TextEditingController();
  DateTime? _startDate;
  DateTime? _endDate;
  int selectedCount = 0;

  Future<void> _pickStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primary,
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _startDate = picked;
      });
    }
  }

  Future<void> _pickEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary, // header background & buttons
              onPrimary: Colors.white, // header text
              onSurface: Colors.black, // body text
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primary, // cancel & ok button color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _endDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
          title: Text(
            locale.search_field_hint,
        style: const TextStyle(color: AppColors.primary),
      )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: responsive(context, 30)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                        child: const Text(
                          'Start',
                          style: TextStyle(
                              color: AppColors.primary, fontFamily: 'Raleway'),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        _startDate != null
                            ? '${_startDate!.toLocal()}'.split(' ')[0]
                            : 'No Date Selected',
                        style: const TextStyle(
                            color: AppColors.primary,
                            fontSize: 18,
                            fontFamily: 'Poppins'),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () => _pickEndDate(context),
                        child: const Text(
                          'End',
                          style: TextStyle(
                              color: AppColors.primary, fontFamily: 'Raleway'),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        _endDate != null
                            ? '${_endDate!.toLocal()}'.split(' ')[0]
                            : 'No Date Selected',
                        style: const TextStyle(
                            color: AppColors.primary,
                            fontSize: 18,
                            fontFamily: 'Poppins'),
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
                          child: Text('1',
                              style: TextStyle(
                                  color: AppColors.primary,
                                  fontFamily: 'Raleway',
                                  fontSize: responsive(context, 18))),
                        ),
                        DropdownMenuItem(
                          value: 1,
                          child: Text('2',
                              style: TextStyle(
                                  color: AppColors.primary,
                                  fontFamily: 'Raleway',
                                  fontSize: responsive(context, 18))),
                        ),
                        DropdownMenuItem(
                          value: 2,
                          child: Text('3',
                              style: TextStyle(
                                  color: AppColors.primary,
                                  fontFamily: 'Raleway',
                                  fontSize: responsive(context, 18))),
                        ),
                        DropdownMenuItem(
                          value: 3,
                          child: Text('4',
                              style: TextStyle(
                                  color: AppColors.primary,
                                  fontFamily: 'Raleway',
                                  fontSize: responsive(context, 18))),
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
                  child: const Text('Search',
                      style: TextStyle(
                          color: AppColors.primary, fontFamily: 'Poppins')))
            ],
          ),
        ),
      ),
    );
  }
}
