// ignore_for_file: unused_field

import 'package:cost_center_screens/pages/by_period_list_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';

import 'package:cost_center_screens/utils.dart';

enum ExpenseIncomePick { expense, income }
enum BottomBarTimePick { d, w, m, y }

class ByCategoryListDisplay extends StatefulWidget {
  const ByCategoryListDisplay({Key? key}) : super(key: key);

  @override
  State<ByCategoryListDisplay> createState() => _ByCategoryListDisplay();
}

class _ByCategoryListDisplay extends State<ByCategoryListDisplay> {
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
  final String listViewText1 = "Supermarket";
  final String listViewText2 = "Travel";
  final String listViewText3 = "Education";
  final String listViewText4 = "Transport";

  ExpenseIncomePick _selectedEI = ExpenseIncomePick.expense;
  BottomBarTimePick _selectedTime = BottomBarTimePick.d;

  final double progressBarValuePersonel = 0.5;
  final double progressBarValueWork = 0.5;
  final double progressBarValueFamily = 0.5;
  final double progressBarValueMyProject = 0.5;

  final double listViewJanuary22BoldMoney = 7900.00;
  final double listViewJanuary22LightMoney = 12650.00;
  final double listViewFebruary22BoldMoney = 7900.00;
  final double listViewFebruary22LightMoney = 12650.00;
  final double listViewMarch22BoldMoney = 7900.00;
  final double listViewMarch22LightMoney = 12650.00;
  final double listViewApril22BoldMoney = 7900.00;
  final double listViewApril22LightMoney = 12650.00;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context) {
      return Scaffold(
        backgroundColor: Utils.kBackgroundColor,
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        floatingActionButton: SizedBox(
          width: 44.h,
          height: 44.h,
          child: FittedBox(
            child: FloatingActionButton(
              foregroundColor: Utils.kFloatingActionButtonColor,
              child: Icon(
                Icons.add,
                size: 20.h,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ByPeriodListDisplay()));
              },
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 55.h, left: 24.w, right: 24.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        height: 20.h,
                        width: 20.w,
                        color: Colors.transparent,
                        child: Center(
                          child: Icon(Icons.arrow_back_ios, size: 16.h),
                        )),
                  ),
                  Text("Profit and loss",
                      style: GoogleFonts.poppins(
                          fontSize: 18.h, fontWeight: FontWeight.w400)),
                  SizedBox(
                    height: 20.h,
                    width: 20.w,
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
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.only(right: 30.w, left: 30.w),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 17.h,
                            width: 12.h,
                            child: CustomPaint(
                              //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                              painter: BookMarkIconPainter(
                                  bookmarkIconFillColor:
                                      Utils.kSuperMarketIconFillColor),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                listViewText1,
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.h),
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 10.h,
                                      width: 75.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(1),
                                          border:
                                              Border.all(color: Colors.black)),
                                      child: LinearProgressIndicator(
                                        color: Utils.kSuperMarketIconFillColor,
                                        backgroundColor: Colors.white,
                                        value: progressBarValueFamily,
                                      ),
                                    ),
                                    SizedBox(width: 15.w),
                                    Text(
                                      "${(progressBarValueFamily * 100).toInt()} %",
                                      style: GoogleFonts.poppins(
                                          fontSize: 9,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              Utils.kSuperMarketIconFillColor),
                                    )
                                  ]),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(listViewMarch22BoldMoney.toString(),
                                  style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Utils.kListViewPrimaryTextColor)),
                              Text(
                                listViewMarch22LightMoney.toString(),
                                style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Utils.kListViewSecondaryTextColor),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        width: 290.w,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.h),
                          child: const Divider(color: Utils.kListDividerColor),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 17.h,
                            width: 12.h,
                            child: CustomPaint(
                                /*  size: Size(
                                    20,
                                    (20 * 0.8181818181818182)
                                        .toDouble()), */
                                painter: BookMarkIconPainter(
                                    bookmarkIconFillColor:
                                        Utils.kTravelIconFillColor)),
                          ),
                          SizedBox(width: 12.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                listViewText2,
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.h),
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 10.h,
                                      width: 75.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(1),
                                          border:
                                              Border.all(color: Colors.black)),
                                      child: LinearProgressIndicator(
                                        color: Utils.kTravelIconFillColor,
                                        backgroundColor: Colors.white,
                                        value: progressBarValueFamily,
                                      ),
                                    ),
                                    SizedBox(width: 15.w),
                                    Text(
                                      "${(progressBarValueFamily * 100).toInt()} %",
                                      style: GoogleFonts.poppins(
                                          fontSize: 9,
                                          fontWeight: FontWeight.w500,
                                          color: Utils
                                              .kListViewWorkIndicatorColor),
                                    )
                                  ]),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(listViewMarch22BoldMoney.toString(),
                                  style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Utils.kListViewPrimaryTextColor)),
                              Text(
                                listViewMarch22LightMoney.toString(),
                                style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Utils.kListViewSecondaryTextColor),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        width: 290.w,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.h),
                          child: const Divider(color: Utils.kListDividerColor),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 17.h,
                            width: 12.h,
                            child: CustomPaint(
                              painter: BookMarkIconPainter(
                                  bookmarkIconFillColor:
                                      Utils.kEducationFillColor),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                listViewText3,
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.h),
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 10.h,
                                      width: 75.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(1),
                                          border:
                                              Border.all(color: Colors.black)),
                                      child: LinearProgressIndicator(
                                        color: Utils.kEducationFillColor,
                                        backgroundColor: Colors.white,
                                        value: progressBarValueFamily,
                                      ),
                                    ),
                                    SizedBox(width: 15.w),
                                    Text(
                                      "${(progressBarValueFamily * 100).toInt()} %",
                                      style: GoogleFonts.poppins(
                                          fontSize: 9,
                                          fontWeight: FontWeight.w500,
                                          color: Utils.kEducationFillColor),
                                    )
                                  ]),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(listViewMarch22BoldMoney.toString(),
                                  style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Utils.kListViewPrimaryTextColor)),
                              Text(
                                listViewMarch22LightMoney.toString(),
                                style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Utils.kListViewSecondaryTextColor),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        width: 290.w,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.h),
                          child: const Divider(color: Utils.kListDividerColor),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 17.h,
                            width: 12.h,
                            child: CustomPaint(
                              painter: BookMarkIconPainter(
                                  bookmarkIconFillColor:
                                      Utils.kTransportFillColor),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                listViewText4,
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.h),
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 10.h,
                                      width: 75.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(1),
                                          border:
                                              Border.all(color: Colors.black)),
                                      child: LinearProgressIndicator(
                                        color: Utils.kTransportFillColor,
                                        backgroundColor: Colors.white,
                                        value: progressBarValueFamily,
                                      ),
                                    ),
                                    SizedBox(width: 15.w),
                                    Text(
                                      "${(progressBarValueFamily * 100).toInt()} %",
                                      style: GoogleFonts.poppins(
                                          fontSize: 9,
                                          fontWeight: FontWeight.w500,
                                          color: Utils.kTransportFillColor),
                                    )
                                  ]),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(listViewMarch22BoldMoney.toString(),
                                  style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Utils.kListViewPrimaryTextColor)),
                              Text(
                                listViewMarch22LightMoney.toString(),
                                style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Utils.kListViewSecondaryTextColor),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        width: 290.w,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.h),
                          child: const Divider(color: Utils.kListDividerColor),
                        ),
                      )
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

class BookMarkIconPainter extends CustomPainter {
  Color bookmarkIconFillColor;
  BookMarkIconPainter({
    required this.bookmarkIconFillColor,
  });
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.9791667, size.height * 0.04166667);
    path_0.lineTo(size.width * 0.9791667, size.height * 0.04166667);
    path_0.lineTo(size.width * 0.02083333, size.height * 0.04166667);
    path_0.lineTo(size.width * 0.02083333, size.height * 0.9346778);
    path_0.lineTo(size.width * 0.4683642, size.height * 0.5866000);
    path_0.cubicTo(
        size.width * 0.4849933,
        size.height * 0.5736611,
        size.width * 0.5150067,
        size.height * 0.5736611,
        size.width * 0.5316358,
        size.height * 0.5866000);
    path_0.lineTo(size.width * 0.9791667, size.height * 0.9346778);
    path_0.lineTo(size.width * 0.9633917, size.height * 0.9436889);
    path_0.lineTo(size.width * 0.9791667, size.height * 0.9346778);
    path_0.lineTo(size.width * 0.9791667, size.height * 0.04166667);
    path_0.close();

    Paint paint0Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.04166667;
    paint0Stroke.color = const Color(0xff404446).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Stroke);

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = bookmarkIconFillColor;
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
