import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:demoprj/dataFromServer.dart';
import 'package:demoprj/models/DateModel.dart';
import 'package:demoprj/presentation/widgets/time_continer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime? selectedDate;
  List<DateModel> datetimes =
      dataFromServer.map((e) => DateModel.fromJson(e)).toList();
  List listOfTimes = [];

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2025, 4, 12),
      firstDate: DateTime(2025),
      lastDate: DateTime(2026),
    );

    if (pickedDate != null) {
      final formattedPickedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      final DateModel dateTimeModel = datetimes.firstWhere(
        (dt) => dt.date.contains(formattedPickedDate),
        orElse: () => DateModel(id: 0, date: '', times: []),
      );

      setState(() {
        selectedDate = pickedDate;
        listOfTimes = dateTimeModel.times;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate = selectedDate != null
        ? DateFormat('yyyy-MM-dd').format(selectedDate!)
        : 'No date selected';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dr....'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _selectDate,
              child: const Text('Date'),
            ),
            const SizedBox(height: 8),
            Text(formattedDate),
            const SizedBox(height: 16),
            listOfTimes.isNotEmpty
                ? Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 12.0,
                        crossAxisSpacing: 12.0,
                        childAspectRatio: 2 / 1,
                      ),
                      itemCount: listOfTimes.length,
                      itemBuilder: (context, index) {
                        return TimeContainer(
                          times: listOfTimes[index],
                        );
                      },
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
