import 'package:demoprj/presentation/pages/stepper_page.dart';
import 'package:demoprj/presentation/widgets/scrollable_bars.dart';
import 'package:flutter/material.dart';

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
  String? selectedMonth;
  String? selectedDay;
  List<DateModel> datetimes =
      dataFromServer.map((e) => DateModel.fromJson(e)).toList();
  List listOfTimes = [];
  final ScrollController _scrollController = ScrollController();
  final List<Map<String, String>> months = [
    {"v": "01", "m": "Jan"},
    {"v": "02", "m": "Feb"},
    {"v": "03", "m": "Mar"},
    {"v": "04", "m": "Apr"},
    {"v": "05", "m": "May"},
    {"v": "06", "m": "Jun"},
    {"v": "07", "m": "Jul"},
    {"v": "08", "m": "Aug"},
    {"v": "09", "m": "Sep"},
    {"v": "10", "m": "Oct"},
    {"v": "11", "m": "Nov"},
    {"v": "12", "m": "Dec"},
  ];

  final List<String> days = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28",
    "29",
    "30",
    "31"
  ];

  onMonthTap(String month) {
    listOfTimes = [];
    selectedMonth = month;
    for (int i = 0; i < datetimes.length; i++) {
      if (datetimes[i].date.toString().split("-")[1] == selectedMonth) {
        listOfTimes.add(datetimes[i]);
      }
    }
    setState(() {});
  }

  onDayTap(String day) {
    selectedDay = day;
    if (selectedMonth != null) {
      var findInListOfTimes = listOfTimes.firstWhere(
        (element) => element.date.toString().split("-")[2] == selectedDay,
        orElse: () => null,
      );
      if (findInListOfTimes != null) {
        int index = listOfTimes.indexOf(findInListOfTimes);
        _scrollController.animateTo(index * 125,
            duration: const Duration(seconds: 1), curve: Curves.easeInOut);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dr. Conductor '),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 80,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.calendar_month,
                        size: 30,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 90,
                      child: Column(
                        children: [
                          ScrollableBars(
                            data: months,
                            onPressed: onMonthTap,
                            isMonth: true,
                          ),
                          const Divider(),
                          ScrollableBars(
                            data: days,
                            onPressed: onDayTap,
                            isMonth: false,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            listOfTimes.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      controller: _scrollController,
                      padding: const EdgeInsets.only(bottom: 320),
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                listOfTimes[index].date,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              GridView.builder(
                                shrinkWrap: true,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 12.0,
                                  crossAxisSpacing: 12.0,
                                  childAspectRatio: 2 / 1,
                                ),
                                itemCount: listOfTimes[index].times.length,
                                itemBuilder: (context, j) {
                                  return TimeContainer(
                                    times: listOfTimes[index].times[j],
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: listOfTimes.length,
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const StepperPage(),
            ));
          },
          child: const Text("Stepper"),
        ));
  }
}
