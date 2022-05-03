// ignore_for_file: unused_field

import 'package:cost_center_screens/pages/list_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';

import 'package:cost_center_screens/utils.dart';

enum ExpenseIncomePick { expense, income }
enum BottomBarTimePick { d, w, m, y }

class LargeIconsDisplay extends StatefulWidget {
  const LargeIconsDisplay({Key? key}) : super(key: key);

  @override
  State<LargeIconsDisplay> createState() => _LargeIconsDisplayState();
}

class _LargeIconsDisplayState extends State<LargeIconsDisplay> {
  Map<String, double> chartMap = {
    "Personal": 100,
    "Work": 150,
    "Family": 170,
    "My Project": 200
  };

  List<Color> colorList = [
    Utils.kChartPersonalColor,
    Utils.kChartWorkColor,
    Utils.kChartFamilyColor,
    Utils.kChartMyProjectColor
  ];

  final String avatarImgPath = "assets/avatar.jpg";
  final String headerButtonText = "USD";
  final String searchBarText = "Looking for something...";
  final String totalSpendingText = "Total\nSpending";
  final String totalSpentMoney = "1900\$";
  final String spendingDate = "Mar 22";
  final double bottomTimePickingLargeWidth = 77.w;
  final double bottomTimePickingSmallWidth = 57.w;
  final String folderBoldText = "Total Spending";
  final String folderBoldMoney = "100000";
  final String folderMoney = "10000";

  ExpenseIncomePick _selectedEI = ExpenseIncomePick.expense;
  BottomBarTimePick _selectedTime = BottomBarTimePick.d;

  final double progressBarValue = 0.5;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ListDisplay()));
          },
        ),
        backgroundColor: Utils.kBackgroundColor,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 55.h, left: 24.w, right: 24.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 30.w),
                    child: Container(
                      height: 36.h,
                      width: 36.w,
                      decoration: BoxDecoration(
                          image:
                              DecorationImage(image: AssetImage(avatarImgPath)),
                          shape: BoxShape.circle),
                    ),
                  ),
                  Text("Swipe",
                      style: GoogleFonts.poppins(
                          fontSize: 20.h, fontWeight: FontWeight.w700)),
                  Container(
                    height: 32.h,
                    width: 66.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(48),
                        color: Utils.kHeaderCurrencyButtonColor),
                    child: Center(
                      child: Text(
                        headerButtonText,
                        style: GoogleFonts.poppins(
                            fontSize: 16.h,
                            fontWeight: FontWeight.w700,
                            color: Utils.kHeaderCurrencyButtonTextColor),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.h),
              child: Container(
                height: 40.h,
                width: 309.w,
                decoration: BoxDecoration(
                    color: Utils.kSearchBarColor,
                    borderRadius: BorderRadius.circular(6)),
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.search,
                      color: Utils.kSearchBarTextColor,
                      size: 17.4.sp,
                    ),
                  ),
                  Text(
                    searchBarText,
                    style: GoogleFonts.poppins(
                        color: Utils.kSearchBarTextColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.h),
                  )
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        totalSpendingText,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            fontSize: 11.h,
                            fontWeight: FontWeight.w400,
                            color: Utils.kSpentTextColor),
                      ),
                      Text(
                        totalSpentMoney,
                        style: GoogleFonts.poppins(
                            fontSize: 32.h,
                            color: Utils.kSpentTextColor,
                            fontWeight: FontWeight.w700),
                      ),
                      Row(
                        children: [
                          Text(
                            spendingDate,
                            style: GoogleFonts.poppins(fontSize: 11),
                          ),
                          const SizedBox(width: 5),
                          Icon(
                            Icons.work,
                            color: Utils.kSpentTextColor,
                            size: 13.h,
                          )
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: SizedBox(
                      height: 200.h,
                      width: 200.h,
                      child: PieChart(
                        chartType: ChartType.ring,
                        dataMap: chartMap,
                        colorList: colorList,
                        chartRadius: 130.h,
                        ringStrokeWidth: 55,
                        legendOptions: const LegendOptions(showLegends: false),
                        chartValuesOptions:
                            const ChartValuesOptions(showChartValues: false),
                        animationDuration: const Duration(seconds: 2),
                        centerText: "Top 3",
                        centerTextStyle: GoogleFonts.poppins(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            color: Utils.kChartCenterTextColor),
                      ),
                    ),
                  )
                ]),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.h, bottom: 20.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40.h,
                    width: 40.h,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Utils.kCircularButtonAccentColor,
                        border: Border.all(
                            color: Utils.kCircularButtonBorderColor,
                            width: 0.5)),
                    child: const Icon(
                      Icons.signal_cellular_alt_rounded,
                      color: Utils.kCirculatButtonIconColor,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Container(
                      height: 40.h,
                      width: 40.h,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Utils.kCircularButtonAccentColor,
                          border: Border.all(
                              color: Utils.kCircularButtonBorderColor,
                              width: 0.5)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.watch_later,
                            color: Utils.kCirculatButtonIconColor,
                            size: 11,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              height: 1,
                              width: 25,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(1),
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.bookmark,
                            color: Utils.kCirculatButtonIconColor,
                            size: 11,
                          )
                        ],
                      )),
                  SizedBox(width: 10.w),
                  Container(
                      height: 40.h,
                      width: 40.h,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Utils.kCircularButtonColor,
                          border: Border.all(
                              color: Utils.kCircularButtonBorderColor,
                              width: 0.5)),
                      child: const Icon(Icons.create_new_folder_rounded,
                          color: Utils.kCirculatButtonIconColor, size: 25)),
                  SizedBox(width: 10.w),
                  Container(
                    height: 40.h,
                    width: 40.h,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Utils.kCircularButtonAccentColor,
                        border: Border.all(
                            color: Utils.kCircularButtonBorderColor,
                            width: 0.5)),
                    child: const Icon(
                      Icons.menu_rounded,
                      color: Color(0xffFE7886),
                      size: 25,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Container(
                    height: 40.h,
                    width: 40.h,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Utils.kCircularButtonAccentColor,
                        border: Border.all(
                            color: Utils.kCircularButtonBorderColor,
                            width: 0.5)),
                    child: const Icon(
                      Icons.cloud_download_rounded,
                      color: Utils.kCirculatButtonIconColor,
                      size: 25,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: Padding(
                  padding: EdgeInsets.only(right: 19.w, left: 19.w),
                  child: GridView(
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(top: 39.h, left: 18.w, bottom: 13),
                        child: CustomPaint(
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 39.h, left: 18.w, bottom: 13),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  folderBoldText,
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: Utils.kExpenseFolderTextColor,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  folderBoldMoney,
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: Utils.kExpenseFolderTextColor,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  folderMoney,
                                  style: GoogleFonts.poppins(
                                      fontSize: 9,
                                      color: Utils.kExpenseFolderTextColor,
                                      fontWeight: FontWeight.w400),
                                ),
                                const Spacer(),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 10.h,
                                        width: 75.w,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black)),
                                        child: LinearProgressIndicator(
                                          color: Utils
                                              .kExpenseFolderIndicatorColor,
                                          backgroundColor: Colors.white,
                                          value: progressBarValue,
                                        ),
                                      ),
                                      SizedBox(width: 15.w),
                                      Text(
                                        "${(progressBarValue * 100).toInt()} %",
                                        style: GoogleFonts.poppins(
                                            fontSize: 9,
                                            fontWeight: FontWeight.w700,
                                            color: Utils
                                                .kExpenseFolderIndicatorColor),
                                      )
                                    ])
                              ],
                            ),
                          ),
                          painter: FolderPainter(
                              folderFillColor: Utils.kExpenseFolderAccentColor),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: 39.h, left: 18.w, bottom: 13),
                        child: CustomPaint(
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 39.h, left: 18.w, bottom: 13),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  folderBoldText,
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: Utils.kExpenseFolderTextColor,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  folderBoldMoney,
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: Utils.kExpenseFolderTextColor,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  folderMoney,
                                  style: GoogleFonts.poppins(
                                      fontSize: 9,
                                      color: Utils.kExpenseFolderTextColor,
                                      fontWeight: FontWeight.w400),
                                ),
                                const Spacer(),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 10.h,
                                        width: 75.w,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black)),
                                        child: LinearProgressIndicator(
                                          color: Utils
                                              .kExpenseFolderIndicatorColor,
                                          backgroundColor: Colors.white,
                                          value: progressBarValue,
                                        ),
                                      ),
                                      SizedBox(width: 15.w),
                                      Text(
                                        "${(progressBarValue * 100).toInt()} %",
                                        style: GoogleFonts.poppins(
                                            fontSize: 9,
                                            fontWeight: FontWeight.w700,
                                            color: Utils
                                                .kExpenseFolderIndicatorColor),
                                      )
                                    ])
                              ],
                            ),
                          ),
                          painter: FolderPainter(
                              folderFillColor: Utils.kExpenseFolderAccentColor),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: 13.h, left: 18.w, bottom: 13),
                        child: CustomPaint(
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 39.h, left: 18.w, bottom: 13),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  folderBoldText,
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: Utils.kExpenseFolderTextColor,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  folderBoldMoney,
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: Utils.kExpenseFolderTextColor,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  folderMoney,
                                  style: GoogleFonts.poppins(
                                      fontSize: 9,
                                      color: Utils.kExpenseFolderTextColor,
                                      fontWeight: FontWeight.w400),
                                ),
                                const Spacer(),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 10.h,
                                        width: 75.w,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black)),
                                        child: LinearProgressIndicator(
                                          color: Utils
                                              .kExpenseFolderIndicatorColor,
                                          backgroundColor: Colors.white,
                                          value: progressBarValue,
                                        ),
                                      ),
                                      SizedBox(width: 15.w),
                                      Text(
                                        "${(progressBarValue * 100).toInt()} %",
                                        style: GoogleFonts.poppins(
                                            fontSize: 9,
                                            fontWeight: FontWeight.w700,
                                            color: Utils
                                                .kExpenseFolderIndicatorColor),
                                      )
                                    ])
                              ],
                            ),
                          ),
                          painter: FolderPainter(
                              folderFillColor: Utils.kExpenseFolderColor),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: 13.h, left: 18.w, bottom: 13),
                        child: CustomPaint(
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 39.h, left: 18.w, bottom: 13),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  folderBoldText,
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: Utils.kExpenseFolderTextColor,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  folderBoldMoney,
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: Utils.kExpenseFolderTextColor,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  folderMoney,
                                  style: GoogleFonts.poppins(
                                      fontSize: 9,
                                      color: Utils.kExpenseFolderTextColor,
                                      fontWeight: FontWeight.w400),
                                ),
                                const Spacer(),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 10.h,
                                        width: 75.w,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black)),
                                        child: LinearProgressIndicator(
                                          color: Utils
                                              .kExpenseFolderIndicatorColor,
                                          backgroundColor: Colors.white,
                                          value: progressBarValue,
                                        ),
                                      ),
                                      SizedBox(width: 15.w),
                                      Text(
                                        "${(progressBarValue * 100).toInt()} %",
                                        style: GoogleFonts.poppins(
                                            fontSize: 9,
                                            fontWeight: FontWeight.w700,
                                            color: Utils
                                                .kExpenseFolderIndicatorColor),
                                      )
                                    ])
                              ],
                            ),
                          ),
                          painter: FolderPainter(
                              folderFillColor: Utils.kExpenseFolderColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: SizedBox(
          height: 86.h,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedEI = ExpenseIncomePick.expense;
                      });
                    },
                    child: AnimatedContainer(
                      curve: Curves.fastOutSlowIn,
                      duration: const Duration(milliseconds: 300),
                      height: 28.h,
                      width: 118.5.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: _selectedEI == ExpenseIncomePick.expense
                            ? Utils.kBottomBarExpenseIncomeSelectedColor
                            : Utils.kBottomBarExpenseIncomeUnselectedColor,
                      ),
                      child: Center(
                          child: Text("Expense",
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: _selectedEI ==
                                          ExpenseIncomePick.expense
                                      ? Utils
                                          .kBottomBarExpenseIncomeSelectedTextColor
                                      : Utils
                                          .kBottomBarExpenseIncomeUnselectedTextColor))),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedEI = ExpenseIncomePick.income;
                      });
                    },
                    child: AnimatedContainer(
                      curve: Curves.fastOutSlowIn,
                      duration: const Duration(milliseconds: 300),
                      height: 28.h,
                      width: 118.5.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: _selectedEI == ExpenseIncomePick.income
                            ? Utils.kBottomBarExpenseIncomeSelectedColor
                            : Utils.kBottomBarExpenseIncomeUnselectedColor,
                      ),
                      child: Center(
                          child: Text("Income",
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: _selectedEI == ExpenseIncomePick.income
                                      ? Utils
                                          .kBottomBarExpenseIncomeSelectedTextColor
                                      : Utils
                                          .kBottomBarExpenseIncomeUnselectedTextColor))),
                    ),
                  )
                ],
              ),
              SizedBox(height: 12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedTime = BottomBarTimePick.d;
                      });
                    },
                    child: AnimatedContainer(
                      curve: Curves.fastOutSlowIn,
                      duration: const Duration(milliseconds: 300),
                      height: 22.h,
                      width: _selectedTime == BottomBarTimePick.d
                          ? bottomTimePickingLargeWidth
                          : bottomTimePickingSmallWidth,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4),
                            bottomLeft: Radius.circular(4)),
                        color: _selectedTime == BottomBarTimePick.d
                            ? Utils.kBottomBarTimePickSelectedColor
                            : Utils.kBottomBarTimePickUnselectedColor,
                      ),
                      child: Center(
                          child: Text(
                        "D",
                        style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: _selectedTime == BottomBarTimePick.d
                                ? Utils.kBottomBarTimePickSelectedTextColor
                                : Utils.kBottomBarTimePickUnselectedTextColor),
                      )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedTime = BottomBarTimePick.w;
                      });
                    },
                    child: AnimatedContainer(
                      curve: Curves.fastOutSlowIn,
                      duration: const Duration(milliseconds: 300),
                      height: 22.h,
                      width: _selectedTime == BottomBarTimePick.w
                          ? bottomTimePickingLargeWidth
                          : bottomTimePickingSmallWidth,
                      decoration: BoxDecoration(
                        color: _selectedTime == BottomBarTimePick.w
                            ? Utils.kBottomBarTimePickSelectedColor
                            : Utils.kBottomBarTimePickUnselectedColor,
                      ),
                      child: Center(
                          child: Text(
                        "W",
                        style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: _selectedTime == BottomBarTimePick.w
                                ? Utils.kBottomBarTimePickSelectedTextColor
                                : Utils.kBottomBarTimePickUnselectedTextColor),
                      )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedTime = BottomBarTimePick.m;
                      });
                    },
                    child: AnimatedContainer(
                      curve: Curves.fastOutSlowIn,
                      duration: const Duration(milliseconds: 300),
                      height: 22.h,
                      width: _selectedTime == BottomBarTimePick.m
                          ? bottomTimePickingLargeWidth
                          : bottomTimePickingSmallWidth,
                      decoration: BoxDecoration(
                        color: _selectedTime == BottomBarTimePick.m
                            ? Utils.kBottomBarTimePickSelectedColor
                            : Utils.kBottomBarTimePickUnselectedColor,
                      ),
                      child: Center(
                          child: Text(
                        "M",
                        style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: _selectedTime == BottomBarTimePick.m
                                ? Utils.kBottomBarTimePickSelectedTextColor
                                : Utils.kBottomBarTimePickUnselectedTextColor),
                      )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedTime = BottomBarTimePick.y;
                      });
                    },
                    child: AnimatedContainer(
                      curve: Curves.fastOutSlowIn,
                      duration: const Duration(milliseconds: 300),
                      height: 22.h,
                      width: _selectedTime == BottomBarTimePick.y
                          ? bottomTimePickingLargeWidth
                          : bottomTimePickingSmallWidth,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(4),
                            topRight: Radius.circular(4)),
                        color: _selectedTime == BottomBarTimePick.y
                            ? Utils.kBottomBarTimePickSelectedColor
                            : Utils.kBottomBarTimePickUnselectedColor,
                      ),
                      child: Center(
                          child: Text(
                        "Y",
                        style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: _selectedTime == BottomBarTimePick.y
                                ? Utils.kBottomBarTimePickSelectedTextColor
                                : Utils.kBottomBarTimePickUnselectedTextColor),
                      )),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}

class FolderPainter extends CustomPainter {
  Color folderFillColor;
  FolderPainter({
    required this.folderFillColor,
  });
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.9793103, size.height);
    path_0.lineTo(size.width * 0.02068966, size.height);
    path_0.cubicTo(size.width * 0.009263103, size.height, 0,
        size.height * 0.9896692, 0, size.height * 0.9769231);
    path_0.lineTo(0, size.height * 0.1333569);
    path_0.cubicTo(
        0,
        size.height * 0.1206123,
        size.width * 0.009263103,
        size.height * 0.1102800,
        size.width * 0.02068966,
        size.height * 0.1102800);
    path_0.lineTo(size.width * 0.5113972, size.height * 0.1102800);
    path_0.cubicTo(
        size.width * 0.5204559,
        size.height * 0.1102800,
        size.width * 0.5284607,
        size.height * 0.1037077,
        size.width * 0.5311524,
        size.height * 0.09406077);
    path_0.lineTo(size.width * 0.5528710, size.height * 0.01621969);
    path_0.cubicTo(size.width * 0.5555628, size.height * 0.006572485,
        size.width * 0.5635676, 0, size.width * 0.5726262, 0);
    path_0.lineTo(size.width * 0.9793103, 0);
    path_0.cubicTo(size.width * 0.9907379, 0, size.width,
        size.height * 0.01033192, size.width, size.height * 0.02307692);
    path_0.lineTo(size.width, size.height * 0.9769231);
    path_0.cubicTo(size.width, size.height * 0.9896692, size.width * 0.9907379,
        size.height, size.width * 0.9793103, size.height);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = folderFillColor;
    canvas.drawPath(path_0, paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.8821448, size.height * 0.04227192);
    path_1.cubicTo(
        size.width * 0.8763862,
        size.height * 0.04154131,
        size.width * 0.8705724,
        size.height * 0.04154131,
        size.width * 0.8648207,
        size.height * 0.04227192);
    path_1.lineTo(size.width * 0.8588621, size.height * 0.04302854);
    path_1.cubicTo(
        size.width * 0.8579793,
        size.height * 0.04314046,
        size.width * 0.8572897,
        size.height * 0.04392862,
        size.width * 0.8572138,
        size.height * 0.04491431);
    path_1.lineTo(size.width * 0.8567517, size.height * 0.05067177);
    path_1.cubicTo(
        size.width * 0.8559862,
        size.height * 0.06035185,
        size.width * 0.8559862,
        size.height * 0.07008900,
        size.width * 0.8567517,
        size.height * 0.07976923);
    path_1.lineTo(size.width * 0.8572138, size.height * 0.08552692);
    path_1.cubicTo(
        size.width * 0.8572966,
        size.height * 0.08660154,
        size.width * 0.8581034,
        size.height * 0.08742538,
        size.width * 0.8590690,
        size.height * 0.08742538);
    path_1.lineTo(size.width * 0.8668069, size.height * 0.08742538);
    path_1.lineTo(size.width * 0.8668069, size.height * 0.1182692);
    path_1.cubicTo(
        size.width * 0.8668069,
        size.height * 0.1191546,
        size.width * 0.8673103,
        size.height * 0.1199431,
        size.width * 0.8680621,
        size.height * 0.1202354);
    path_1.cubicTo(
        size.width * 0.8688069,
        size.height * 0.1205277,
        size.width * 0.8696414,
        size.height * 0.1202608,
        size.width * 0.8701379,
        size.height * 0.1195692);
    path_1.lineTo(size.width * 0.8716000, size.height * 0.1175315);
    path_1.cubicTo(
        size.width * 0.8802966,
        size.height * 0.1053792,
        size.width * 0.8872276,
        size.height * 0.09177231,
        size.width * 0.8921310,
        size.height * 0.07721231);
    path_1.lineTo(size.width * 0.8928414, size.height * 0.07509908);
    path_1.cubicTo(
        size.width * 0.8930552,
        size.height * 0.07445923,
        size.width * 0.8929793,
        size.height * 0.07374231,
        size.width * 0.8926276,
        size.height * 0.07318046);
    path_1.cubicTo(
        size.width * 0.8922759,
        size.height * 0.07261869,
        size.width * 0.8917034,
        size.height * 0.07228346,
        size.width * 0.8910897,
        size.height * 0.07228346);
    path_1.lineTo(size.width * 0.8809586, size.height * 0.07228346);
    path_1.lineTo(size.width * 0.8896414, size.height * 0.04581469);
    path_1.cubicTo(
        size.width * 0.8898414,
        size.height * 0.04521477,
        size.width * 0.8897793,
        size.height * 0.04454731,
        size.width * 0.8894759,
        size.height * 0.04400377);
    path_1.cubicTo(
        size.width * 0.8891793,
        size.height * 0.04346023,
        size.width * 0.8886690,
        size.height * 0.04310077,
        size.width * 0.8881034,
        size.height * 0.04302854);
    path_1.lineTo(size.width * 0.8821448, size.height * 0.04227192);
    path_1.close();

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = const Color(0xffFE7886).withOpacity(1.0);
    canvas.drawPath(path_1, paint1Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
