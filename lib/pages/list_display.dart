// ignore_for_file: unused_field

import 'package:cost_center_screens/pages/by_category_list_display.dart';
import 'package:cost_center_screens/pages/by_period_list_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';

import 'package:cost_center_screens/utils.dart';

enum ExpenseIncomePick { expense, income }
enum BottomBarTimePick { d, w, m, y }

class ListDisplay extends StatefulWidget {
  const ListDisplay({Key? key}) : super(key: key);

  @override
  State<ListDisplay> createState() => _ListDisplayState();
}

class _ListDisplayState extends State<ListDisplay> {
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
  final String listViewText1 = "Personal";
  final String listViewText2 = "Work";
  final String listViewText3 = "Family";
  final String listViewText4 = "My Project";

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
                    builder: (context) => ByCategoryListDisplay()));
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
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.only(right: 30.w, left: 30.w),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomPaint(
                            size: Size(
                                20,
                                (20 * 0.8181818181818182)
                                    .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                            painter: FolderIconPainter(
                                iconFillColor: Utils.kPersonelIconFillColor,
                                iconFillAccentColor:
                                    Utils.kPersonelIconFillAccentColor,
                                iconFillAccentColor2:
                                    Utils.kPersonelIconFillAccentColor2),
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
                                        color: Utils
                                            .kListViewPersonalIndicatorColor,
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
                                              .kListViewPersonalIndicatorColor),
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
                          CustomPaint(
                            size: Size(
                                20,
                                (20 * 0.8181818181818182)
                                    .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                            painter: FolderIconPainter(
                                iconFillColor: Utils.kWorkIconFillColor,
                                iconFillAccentColor:
                                    Utils.kWorkIconFillAccentColor,
                                iconFillAccentColor2:
                                    Utils.kWorkIconFillAccentColor2),
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
                                        color:
                                            Utils.kListViewWorkIndicatorColor,
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
                          CustomPaint(
                            size: Size(
                                20,
                                (20 * 0.8181818181818182)
                                    .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                            painter: FolderIconPainter(
                                iconFillColor: Utils.kFamilyIconFillColor,
                                iconFillAccentColor:
                                    Utils.kFamilyIconFillAccentColor,
                                iconFillAccentColor2:
                                    Utils.kFamilyIconFillAccentColor2),
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
                                        color:
                                            Utils.kListViewFamilyIndicatorColor,
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
                                              .kListViewFamilyIndicatorColor),
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
                          CustomPaint(
                            size: Size(
                                20,
                                (20 * 0.8181818181818182)
                                    .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                            painter: FolderIconPainter(
                                iconFillColor: Utils.kMyProjectIconFillColor,
                                iconFillAccentColor:
                                    Utils.kMyProjectIconFillAccentColor,
                                iconFillAccentColor2:
                                    Utils.kMyProjectIconFillAccentColor2),
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
                                        color: Utils
                                            .kListViewMyProjectIndicatorColor,
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
                                              .kListViewMyProjectIndicatorColor),
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

class FolderIconPainter extends CustomPainter {
  Color iconFillColor;
  Color iconFillAccentColor;
  Color iconFillAccentColor2;
  FolderIconPainter({
    required this.iconFillColor,
    required this.iconFillAccentColor,
    required this.iconFillAccentColor2,
  });
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.9659091, size.height * 0.9248778);
    path_0.lineTo(size.width * 0.9659091, size.height * 0.9387667);
    path_0.lineTo(size.width * 0.9545455, size.height * 0.9387667);
    path_0.lineTo(size.width * 0.04545455, size.height * 0.9387667);
    path_0.lineTo(size.width * 0.03409100, size.height * 0.9387667);
    path_0.lineTo(size.width * 0.03409100, size.height * 0.9248778);
    path_0.lineTo(size.width * 0.03409100, size.height * 0.07381278);
    path_0.lineTo(size.width * 0.03409100, size.height * 0.05992389);
    path_0.lineTo(size.width * 0.04545455, size.height * 0.05992389);
    path_0.lineTo(size.width * 0.4494618, size.height * 0.05992389);
    path_0.lineTo(size.width * 0.4561273, size.height * 0.05992389);
    path_0.lineTo(size.width * 0.4593818, size.height * 0.06703389);
    path_0.lineTo(size.width * 0.4841000, size.height * 0.1210606);
    path_0.lineTo(size.width * 0.9545455, size.height * 0.1210606);
    path_0.lineTo(size.width * 0.9659091, size.height * 0.1210606);
    path_0.lineTo(size.width * 0.9659091, size.height * 0.1349494);
    path_0.lineTo(size.width * 0.9659091, size.height * 0.9248778);
    path_0.close();

    Paint paint0Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.02272727;
    paint0Stroke.color = const Color(0xff404446).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Stroke);

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = iconFillAccentColor2.withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.09548136, size.height * 0.1796339);
    path_1.lineTo(size.width * 0.8851318, size.height * 0.1796339);
    path_1.lineTo(size.width * 0.8851318, size.height * 0.8689556);
    path_1.lineTo(size.width * 0.09548136, size.height * 0.8689556);
    path_1.lineTo(size.width * 0.09548136, size.height * 0.1796339);
    path_1.close();

    Paint paint1Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.02272727;
    paint1Stroke.color = const Color(0xff404446).withOpacity(1.0);
    canvas.drawPath(path_1, paint1Stroke);

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = Colors.black.withOpacity(0.05);
    canvas.drawPath(path_1, paint1Fill);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.1040927, size.height * 0.1927633);
    path_2.lineTo(size.width * 0.8937455, size.height * 0.1927633);
    path_2.lineTo(size.width * 0.8937455, size.height * 0.8820833);
    path_2.lineTo(size.width * 0.1040927, size.height * 0.8820833);
    path_2.lineTo(size.width * 0.1040927, size.height * 0.1927633);
    path_2.close();

    Paint paint2Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.02272727;
    paint2Stroke.color = const Color(0xff404446).withOpacity(1.0);
    canvas.drawPath(path_2, paint2Stroke);

    Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_2, paint2Fill);

    Path path_3 = Path();
    path_3.moveTo(size.width * 0.6676318, size.height * 0.9170000);
    path_3.lineTo(size.width * 0.3007255, size.height * 0.9170000);
    path_3.cubicTo(
        size.width * 0.1597432,
        size.height * 0.9170000,
        size.width * 0.04545455,
        size.height * 0.7773167,
        size.width * 0.04545455,
        size.height * 0.6050056);
    path_3.cubicTo(
        size.width * 0.04545455,
        size.height * 0.4326922,
        size.width * 0.1597432,
        size.height * 0.2930061,
        size.width * 0.3007255,
        size.height * 0.2930061);
    path_3.lineTo(size.width * 0.4896136, size.height * 0.2930061);
    path_3.cubicTo(
        size.width * 0.5106409,
        size.height * 0.2930061,
        size.width * 0.5296909,
        size.height * 0.2778422,
        size.width * 0.5381909,
        size.height * 0.2543344);
    path_3.cubicTo(
        size.width * 0.5466955,
        size.height * 0.2308261,
        size.width * 0.5657455,
        size.height * 0.2156622,
        size.width * 0.5867727,
        size.height * 0.2156622);
    path_3.lineTo(size.width * 0.7108818, size.height * 0.2156622);
    path_3.cubicTo(
        size.width * 0.8454545,
        size.height * 0.2156622,
        size.width * 0.9545455,
        size.height * 0.3489978,
        size.width * 0.9545455,
        size.height * 0.5134750);
    path_3.lineTo(size.width * 0.9545455, size.height * 0.5663333);
    path_3.cubicTo(
        size.width * 0.9545455,
        size.height * 0.7600000,
        size.width * 0.8260909,
        size.height * 0.9170000,
        size.width * 0.6676318,
        size.height * 0.9170000);
    path_3.close();

    Paint paint3Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.02272727;
    paint3Stroke.color = const Color(0xff404446).withOpacity(1.0);
    canvas.drawPath(path_3, paint3Stroke);

    Paint paint3Fill = Paint()..style = PaintingStyle.fill;
    paint3Fill.color = Colors.black.withOpacity(0.06);
    canvas.drawPath(path_3, paint3Fill);

    Path path_4 = Path();
    path_4.moveTo(size.width * 0.9545455, size.height * 0.9248778);
    path_4.lineTo(size.width * 0.04545455, size.height * 0.9248778);
    path_4.lineTo(size.width * 0.04545455, size.height * 0.3008806);
    path_4.lineTo(size.width * 0.5242045, size.height * 0.3008806);
    path_4.lineTo(size.width * 0.5521773, size.height * 0.2235367);
    path_4.lineTo(size.width * 0.9545455, size.height * 0.2235367);
    path_4.lineTo(size.width * 0.9545455, size.height * 0.9248778);
    path_4.close();

    Paint paint4Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.02272727;
    paint4Stroke.color = const Color(0xff404446).withOpacity(1.0);
    canvas.drawPath(path_4, paint4Stroke);

    Paint paint4Fill = Paint()..style = PaintingStyle.fill;
    paint4Fill.color = iconFillAccentColor.withOpacity(1.0);
    canvas.drawPath(path_4, paint4Fill);

    Path path_5 = Path();
    path_5.moveTo(size.width * 0.3012027, size.height * 0.9261778);
    path_5.lineTo(size.width * 0.6660227, size.height * 0.9261778);
    path_5.cubicTo(
        size.width * 0.8247727,
        size.height * 0.9261778,
        size.width * 0.9534682,
        size.height * 0.7688833,
        size.width * 0.9534682,
        size.height * 0.5748500);
    path_5.lineTo(size.width * 0.9534682, size.height * 0.5208411);
    path_5.cubicTo(
        size.width * 0.9534682,
        size.height * 0.4859428,
        size.width * 0.9485500,
        size.height * 0.4524483,
        size.width * 0.9395136,
        size.height * 0.4213378);
    path_5.cubicTo(
        size.width * 0.7710318,
        size.height * 0.7426111,
        size.width * 0.4480427,
        size.height * 0.8774111,
        size.width * 0.2427200,
        size.height * 0.9179667);
    path_5.cubicTo(
        size.width * 0.2615023,
        size.height * 0.9233389,
        size.width * 0.2810814,
        size.height * 0.9261778,
        size.width * 0.3012027,
        size.height * 0.9261778);
    path_5.close();

    Paint paint5Fill = Paint()..style = PaintingStyle.fill;
    paint5Fill.color = iconFillColor.withOpacity(1.0);
    canvas.drawPath(path_5, paint5Fill);

    Path path_6 = Path();
    path_6.moveTo(size.width * 0.9395136, size.height * 0.4213378);
    path_6.lineTo(size.width * 0.9502227, size.height * 0.4166906);
    path_6.lineTo(size.width * 0.9424591, size.height * 0.3899772);
    path_6.lineTo(size.width * 0.9299455, size.height * 0.4138433);
    path_6.lineTo(size.width * 0.9395136, size.height * 0.4213378);
    path_6.close();
    path_6.moveTo(size.width * 0.2427200, size.height * 0.9179667);
    path_6.lineTo(size.width * 0.2409073, size.height * 0.9042556);
    path_6.lineTo(size.width * 0.2401318, size.height * 0.9314944);
    path_6.lineTo(size.width * 0.2427200, size.height * 0.9179667);
    path_6.close();
    path_6.moveTo(size.width * 0.6660227, size.height * 0.9122889);
    path_6.lineTo(size.width * 0.3012027, size.height * 0.9122889);
    path_6.lineTo(size.width * 0.3012027, size.height * 0.9400667);
    path_6.lineTo(size.width * 0.6660227, size.height * 0.9400667);
    path_6.lineTo(size.width * 0.6660227, size.height * 0.9122889);
    path_6.close();
    path_6.moveTo(size.width * 0.9421045, size.height * 0.5748500);
    path_6.cubicTo(
        size.width * 0.9421045,
        size.height * 0.7612111,
        size.width * 0.8185000,
        size.height * 0.9122889,
        size.width * 0.6660227,
        size.height * 0.9122889);
    path_6.lineTo(size.width * 0.6660227, size.height * 0.9400667);
    path_6.cubicTo(
        size.width * 0.8310500,
        size.height * 0.9400667,
        size.width * 0.9648318,
        size.height * 0.7765556,
        size.width * 0.9648318,
        size.height * 0.5748500);
    path_6.lineTo(size.width * 0.9421045, size.height * 0.5748500);
    path_6.close();
    path_6.moveTo(size.width * 0.9421045, size.height * 0.5208411);
    path_6.lineTo(size.width * 0.9421045, size.height * 0.5748500);
    path_6.lineTo(size.width * 0.9648318, size.height * 0.5748500);
    path_6.lineTo(size.width * 0.9648318, size.height * 0.5208411);
    path_6.lineTo(size.width * 0.9421045, size.height * 0.5208411);
    path_6.close();
    path_6.moveTo(size.width * 0.9288045, size.height * 0.4259850);
    path_6.cubicTo(
        size.width * 0.9374136,
        size.height * 0.4556244,
        size.width * 0.9421045,
        size.height * 0.4875483,
        size.width * 0.9421045,
        size.height * 0.5208411);
    path_6.lineTo(size.width * 0.9648318, size.height * 0.5208411);
    path_6.cubicTo(
        size.width * 0.9648318,
        size.height * 0.4843372,
        size.width * 0.9596864,
        size.height * 0.4492722,
        size.width * 0.9502227,
        size.height * 0.4166906);
    path_6.lineTo(size.width * 0.9288045, size.height * 0.4259850);
    path_6.close();
    path_6.moveTo(size.width * 0.9299455, size.height * 0.4138433);
    path_6.cubicTo(
        size.width * 0.7640818,
        size.height * 0.7301278,
        size.width * 0.4450923,
        size.height * 0.8639278,
        size.width * 0.2409073,
        size.height * 0.9042556);
    path_6.lineTo(size.width * 0.2445332, size.height * 0.9316778);
    path_6.cubicTo(
        size.width * 0.4509936,
        size.height * 0.8909000,
        size.width * 0.7779818,
        size.height * 0.7550944,
        size.width * 0.9490818,
        size.height * 0.4288328);
    path_6.lineTo(size.width * 0.9299455, size.height * 0.4138433);
    path_6.close();
    path_6.moveTo(size.width * 0.3012027, size.height * 0.9122889);
    path_6.cubicTo(
        size.width * 0.2819586,
        size.height * 0.9122889,
        size.width * 0.2632486,
        size.height * 0.9095722,
        size.width * 0.2453086,
        size.height * 0.9044444);
    path_6.lineTo(size.width * 0.2401318, size.height * 0.9314944);
    path_6.cubicTo(
        size.width * 0.2597564,
        size.height * 0.9371056,
        size.width * 0.2802036,
        size.height * 0.9400667,
        size.width * 0.3012027,
        size.height * 0.9400667);
    path_6.lineTo(size.width * 0.3012027, size.height * 0.9122889);
    path_6.close();

    Paint paint6Fill = Paint()..style = PaintingStyle.fill;
    paint6Fill.color = const Color(0xff404446).withOpacity(1.0);
    canvas.drawPath(path_6, paint6Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
