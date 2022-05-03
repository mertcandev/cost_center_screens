// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';

import 'package:cost_center_screens/utils.dart';

enum ExpenseIncomePick { expense, income }
enum BottomBarTimePick { d, w, m, y }

class ByTransactionListDisplay extends StatefulWidget {
  const ByTransactionListDisplay({Key? key}) : super(key: key);

  @override
  State<ByTransactionListDisplay> createState() => _ByTransactionListDisplay();
}

class _ByTransactionListDisplay extends State<ByTransactionListDisplay> {
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
  final String listViewText1 = "January 22";
  final String listViewText2 = "February 22";
  final String listViewText3 = "March 22";
  final String listViewText4 = "April 22";

  ExpenseIncomePick _selectedEI = ExpenseIncomePick.expense;
  BottomBarTimePick _selectedTime = BottomBarTimePick.d;

  final double progressBarValuePersonel = 0.5;
  final double progressBarValueWork = 0.5;
  final double progressBarValueFamily = 0.5;
  final double progressBarValueMyProject = 0.5;

  final int listViewCard1BoldMoney = 7900;
  final int listViewCard1LightMoney = 6400;
  final int listViewCard2BoldMoney = 7900;
  final int listViewCard2LightMoney = 6400;
  final int listViewCard3BoldMoney = 7900;
  final int listViewCard3LightMoney = 6400;

  final String _accountName = "Account";
  final String _centerName = "Center";
  final String _categoryName = "Category";

  final String _accountDetail = "25 Mar 22";
  final String _centerDetail = "description";
  final String _categoryDetail = "shop name";

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
              onPressed: () {},
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
                      Slidable(
                        endActionPane:
                            ActionPane(motion: const ScrollMotion(), children: [
                          Padding(
                            padding: EdgeInsets.only(left: 15.w),
                            child: Container(
                              height: 40.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                color: Utils.kSlideIconColor1,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black),
                              ),
                              child: Center(
                                  child: Icon(
                                Icons.refresh_rounded,
                                size: 15.h,
                                color: Colors.white,
                              )),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 7.w, right: 7.w),
                            child: Container(
                              height: 40.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                color: Utils.kSlideIconColor2,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black),
                              ),
                              child: Center(
                                  child: Icon(
                                Icons.border_color_rounded,
                                size: 15.h,
                                color: Colors.white,
                              )),
                            ),
                          ),
                          Container(
                            height: 40.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                              color: Utils.kSlideIconColor3,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.black),
                            ),
                            child: Center(
                                child: Icon(
                              Icons.delete_forever_rounded,
                              size: 15.h,
                              color: Colors.white,
                            )),
                          )
                        ]),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 17.h,
                              width: 17.h,
                              child: CustomPaint(
                                //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                                painter: TransactionIconPainter(
                                    transactionIconFillColor:
                                        Utils.kTransactionIconColor1),
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "$_accountName | $_centerName | $_categoryName",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12.h,
                                      color: Utils.kListViewPrimaryTextColor),
                                ),
                                Text(
                                  "$_accountDetail, $_centerDetail, $_categoryDetail",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10.h,
                                      color: Utils.kListViewSecondaryTextColor),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("$listViewCard1BoldMoney \$",
                                    style: GoogleFonts.poppins(
                                        fontSize: 14.h,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Utils.kListViewPrimaryTextColor)),
                                Text(
                                  "$listViewCard1LightMoney €",
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Utils.kListViewSecondaryTextColor),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 290.w,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.h),
                          child: const Divider(color: Utils.kListDividerColor),
                        ),
                      ),
                      Slidable(
                        endActionPane:
                            ActionPane(motion: const ScrollMotion(), children: [
                          Padding(
                            padding: EdgeInsets.only(left: 15.w),
                            child: Container(
                              height: 40.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                color: Utils.kSlideIconColor1,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black),
                              ),
                              child: Center(
                                  child: Icon(
                                Icons.refresh_rounded,
                                size: 15.h,
                                color: Colors.white,
                              )),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 7.w, right: 7.w),
                            child: Container(
                              height: 40.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                color: Utils.kSlideIconColor2,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black),
                              ),
                              child: Center(
                                  child: Icon(
                                Icons.border_color_rounded,
                                size: 15.h,
                                color: Colors.white,
                              )),
                            ),
                          ),
                          Container(
                            height: 40.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                              color: Utils.kSlideIconColor3,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.black),
                            ),
                            child: Center(
                                child: Icon(
                              Icons.delete_forever_rounded,
                              size: 15.h,
                              color: Colors.white,
                            )),
                          )
                        ]),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 17.h,
                              width: 17.h,
                              child: CustomPaint(
                                //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                                painter: TransactionIconPainter(
                                    transactionIconFillColor:
                                        Utils.kTransactionIconColor2),
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "$_accountName | $_centerName | $_categoryName",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12.h,
                                      color: Utils.kListViewPrimaryTextColor),
                                ),
                                Text(
                                  "$_accountDetail, $_centerDetail, $_categoryDetail",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10.h,
                                      color: Utils.kListViewSecondaryTextColor),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("$listViewCard1BoldMoney \$",
                                    style: GoogleFonts.poppins(
                                        fontSize: 14.h,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Utils.kListViewPrimaryTextColor)),
                                Text(
                                  "$listViewCard1LightMoney €",
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Utils.kListViewSecondaryTextColor),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 290.w,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.h),
                          child: const Divider(color: Utils.kListDividerColor),
                        ),
                      ),
                      Slidable(
                        endActionPane:
                            ActionPane(motion: const ScrollMotion(), children: [
                          Padding(
                            padding: EdgeInsets.only(left: 15.w),
                            child: Container(
                              height: 40.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                color: Utils.kSlideIconColor1,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black),
                              ),
                              child: Center(
                                  child: Icon(
                                Icons.refresh_rounded,
                                size: 15.h,
                                color: Colors.white,
                              )),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 7.w, right: 7.w),
                            child: Container(
                              height: 40.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                color: Utils.kSlideIconColor2,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black),
                              ),
                              child: Center(
                                  child: Icon(
                                Icons.border_color_rounded,
                                size: 15.h,
                                color: Colors.white,
                              )),
                            ),
                          ),
                          Container(
                            height: 40.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                              color: Utils.kSlideIconColor3,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.black),
                            ),
                            child: Center(
                                child: Icon(
                              Icons.delete_forever_rounded,
                              size: 15.h,
                              color: Colors.white,
                            )),
                          )
                        ]),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 17.h,
                              width: 17.h,
                              child: CustomPaint(
                                //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                                painter: TransactionIconPainter(
                                    transactionIconFillColor:
                                        Utils.kTransactionIconColor3),
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "$_accountName | $_centerName | $_categoryName",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12.h,
                                      color: Utils.kListViewPrimaryTextColor),
                                ),
                                Text(
                                  "$_accountDetail, $_centerDetail, $_categoryDetail",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10.h,
                                      color: Utils.kListViewSecondaryTextColor),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("$listViewCard1BoldMoney \$",
                                    style: GoogleFonts.poppins(
                                        fontSize: 14.h,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Utils.kListViewPrimaryTextColor)),
                                Text(
                                  "$listViewCard1LightMoney €",
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Utils.kListViewSecondaryTextColor),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 290.w,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.h),
                          child: const Divider(color: Utils.kListDividerColor),
                        ),
                      ),
                      Slidable(
                        endActionPane:
                            ActionPane(motion: const ScrollMotion(), children: [
                          Padding(
                            padding: EdgeInsets.only(left: 15.w),
                            child: Container(
                              height: 40.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                color: Utils.kSlideIconColor1,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black),
                              ),
                              child: Center(
                                  child: Icon(
                                Icons.refresh_rounded,
                                size: 15.h,
                                color: Colors.white,
                              )),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 7.w, right: 7.w),
                            child: Container(
                              height: 40.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                color: Utils.kSlideIconColor2,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black),
                              ),
                              child: Center(
                                  child: Icon(
                                Icons.border_color_rounded,
                                size: 15.h,
                                color: Colors.white,
                              )),
                            ),
                          ),
                          Container(
                            height: 40.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                              color: Utils.kSlideIconColor3,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.black),
                            ),
                            child: Center(
                                child: Icon(
                              Icons.delete_forever_rounded,
                              size: 15.h,
                              color: Colors.white,
                            )),
                          )
                        ]),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 17.h,
                              width: 17.h,
                              child: CustomPaint(
                                //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                                painter: TransactionIconPainter(
                                    transactionIconFillColor:
                                        Utils.kTransactionIconColor4),
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "$_accountName | $_centerName | $_categoryName",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12.h,
                                      color: Utils.kListViewPrimaryTextColor),
                                ),
                                Text(
                                  "$_accountDetail, $_centerDetail, $_categoryDetail",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10.h,
                                      color: Utils.kListViewSecondaryTextColor),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("$listViewCard1BoldMoney \$",
                                    style: GoogleFonts.poppins(
                                        fontSize: 14.h,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Utils.kListViewPrimaryTextColor)),
                                Text(
                                  "$listViewCard1LightMoney €",
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Utils.kListViewSecondaryTextColor),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 290.w,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.h),
                          child: const Divider(color: Utils.kListDividerColor),
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

class TransactionIconPainter extends CustomPainter {
  Color transactionIconFillColor;
  TransactionIconPainter({
    required this.transactionIconFillColor,
  });
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.8472238, size.height * 0.9474190);
    path_0.lineTo(size.width * 0.2023819, size.height * 0.9474190);
    path_0.cubicTo(
        size.width * 0.1064990,
        size.height * 0.9474190,
        size.width * 0.02877081,
        size.height * 0.8696905,
        size.width * 0.02877081,
        size.height * 0.7738095);
    path_0.lineTo(size.width * 0.02877081, size.height * 0.1261505);
    path_0.cubicTo(
        size.width * 0.02877081,
        size.height * 0.07319667,
        size.width * 0.08114381,
        size.height * 0.03962529,
        size.width * 0.1272281,
        size.height * 0.05562476);
    path_0.cubicTo(
        size.width * 0.1338114,
        size.height * 0.05791048,
        size.width * 0.1402667,
        size.height * 0.06120810,
        size.width * 0.1464224,
        size.height * 0.06560476);
    path_0.lineTo(size.width * 0.1551052, size.height * 0.07180714);
    path_0.cubicTo(
        size.width * 0.1981619,
        size.height * 0.1025619,
        size.width * 0.2563957,
        size.height * 0.1024257,
        size.width * 0.2995733,
        size.height * 0.07158429);
    path_0.cubicTo(
        size.width * 0.3599376,
        size.height * 0.02846700,
        size.width * 0.4416519,
        size.height * 0.02846700,
        size.width * 0.5020143,
        size.height * 0.07158429);
    path_0.cubicTo(
        size.width * 0.5451952,
        size.height * 0.1024257,
        size.width * 0.6034286,
        size.height * 0.1025619,
        size.width * 0.6464857,
        size.height * 0.07180714);
    path_0.lineTo(size.width * 0.6551667, size.height * 0.06560476);
    path_0.cubicTo(
        size.width * 0.7044143,
        size.height * 0.03042905,
        size.width * 0.7728190,
        size.height * 0.06563190,
        size.width * 0.7728190,
        size.height * 0.1261505);
    path_0.lineTo(size.width * 0.7728190, size.height * 0.5009905);
    path_0.lineTo(size.width * 0.9464286, size.height * 0.5009905);
    path_0.cubicTo(
        size.width * 0.9669762,
        size.height * 0.5009905,
        size.width * 0.9836333,
        size.height * 0.5176476,
        size.width * 0.9836333,
        size.height * 0.5381952);
    path_0.lineTo(size.width * 0.9836333, size.height * 0.8110095);
    path_0.cubicTo(
        size.width * 0.9836333,
        size.height * 0.8863476,
        size.width * 0.9225619,
        size.height * 0.9474190,
        size.width * 0.8472238,
        size.height * 0.9474190);
    path_0.close();
    path_0.moveTo(size.width * 0.7852190, size.height * 0.5753952);
    path_0.lineTo(size.width * 0.7852190, size.height * 0.8110095);
    path_0.cubicTo(
        size.width * 0.7852190,
        size.height * 0.8452571,
        size.width * 0.8129810,
        size.height * 0.8730143,
        size.width * 0.8472238,
        size.height * 0.8730143);
    path_0.cubicTo(
        size.width * 0.8814667,
        size.height * 0.8730143,
        size.width * 0.9092286,
        size.height * 0.8452571,
        size.width * 0.9092286,
        size.height * 0.8110095);
    path_0.lineTo(size.width * 0.9092286, size.height * 0.5753952);
    path_0.lineTo(size.width * 0.7852190, size.height * 0.5753952);
    path_0.close();
    path_0.moveTo(size.width * 0.5744048, size.height * 0.3645833);
    path_0.cubicTo(
        size.width * 0.5744048,
        size.height * 0.3440371,
        size.width * 0.5577476,
        size.height * 0.3273810,
        size.width * 0.5372048,
        size.height * 0.3273810);
    path_0.lineTo(size.width * 0.2395843, size.height * 0.3273810);
    path_0.cubicTo(
        size.width * 0.2190381,
        size.height * 0.3273810,
        size.width * 0.2023819,
        size.height * 0.3440371,
        size.width * 0.2023819,
        size.height * 0.3645833);
    path_0.cubicTo(
        size.width * 0.2023819,
        size.height * 0.3851295,
        size.width * 0.2190381,
        size.height * 0.4017857,
        size.width * 0.2395843,
        size.height * 0.4017857);
    path_0.lineTo(size.width * 0.5372048, size.height * 0.4017857);
    path_0.cubicTo(
        size.width * 0.5577476,
        size.height * 0.4017857,
        size.width * 0.5744048,
        size.height * 0.3851295,
        size.width * 0.5744048,
        size.height * 0.3645833);
    path_0.close();
    path_0.moveTo(size.width * 0.5248048, size.height * 0.5133905);
    path_0.cubicTo(
        size.width * 0.5248048,
        size.height * 0.4928476,
        size.width * 0.5081476,
        size.height * 0.4761905,
        size.width * 0.4876000,
        size.height * 0.4761905);
    path_0.lineTo(size.width * 0.2395843, size.height * 0.4761905);
    path_0.cubicTo(
        size.width * 0.2190381,
        size.height * 0.4761905,
        size.width * 0.2023819,
        size.height * 0.4928476,
        size.width * 0.2023819,
        size.height * 0.5133905);
    path_0.cubicTo(
        size.width * 0.2023819,
        size.height * 0.5339381,
        size.width * 0.2190381,
        size.height * 0.5505952,
        size.width * 0.2395843,
        size.height * 0.5505952);
    path_0.lineTo(size.width * 0.4876000, size.height * 0.5505952);
    path_0.cubicTo(
        size.width * 0.5081476,
        size.height * 0.5505952,
        size.width * 0.5248048,
        size.height * 0.5339381,
        size.width * 0.5248048,
        size.height * 0.5133905);
    path_0.close();
    path_0.moveTo(size.width * 0.5372048, size.height * 0.6250000);
    path_0.cubicTo(
        size.width * 0.5577476,
        size.height * 0.6250000,
        size.width * 0.5744048,
        size.height * 0.6416571,
        size.width * 0.5744048,
        size.height * 0.6622000);
    path_0.cubicTo(
        size.width * 0.5744048,
        size.height * 0.6827476,
        size.width * 0.5577476,
        size.height * 0.6994048,
        size.width * 0.5372048,
        size.height * 0.6994048);
    path_0.lineTo(size.width * 0.2395843, size.height * 0.6994048);
    path_0.cubicTo(
        size.width * 0.2190381,
        size.height * 0.6994048,
        size.width * 0.2023819,
        size.height * 0.6827476,
        size.width * 0.2023819,
        size.height * 0.6622000);
    path_0.cubicTo(
        size.width * 0.2023819,
        size.height * 0.6416571,
        size.width * 0.2190381,
        size.height * 0.6250000,
        size.width * 0.2395843,
        size.height * 0.6250000);
    path_0.lineTo(size.width * 0.5372048, size.height * 0.6250000);
    path_0.close();

    Paint paint0Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.02380952;
    paint0Stroke.color = const Color(0xff404446).withOpacity(1.0);
    paint0Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_0, paint0Stroke);

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = transactionIconFillColor;
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
