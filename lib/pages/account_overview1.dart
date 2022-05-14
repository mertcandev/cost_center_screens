// ignore_for_file: unused_field, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:cost_center_screens/utils.dart';

enum ExpenseIncomePick { expense, income }
enum BottomBarTimePick { d, w, m, y }
List<Map> _balanceDetailsList = [
  {
    "dotColor": Utils.kExpensesDotColor,
    "balanceType": "Expenses",
    "date": "Mar 22",
    "money": "-7900"
  },
  {
    "dotColor": Utils.kIncomeDotColor,
    "balanceType": "Income",
    "date": "Mar 22",
    "money": "+7900"
  },
  {
    "dotColor": Utils.kTransfersDotColor,
    "balanceType": "Transfers",
    "date": "Mar 22",
    "money": "-7900"
  },
  {
    "dotColor": Utils.kSubscriptionsDotColor,
    "balanceType": "Subscriptions",
    "date": "Mar 22",
    "money": "-7900"
  }
];

List<Map> _barListDetailsList = [
  {"text": "Pers.", "barValue": 0.8},
  {"text": "Family", "barValue": 0.7},
  {"text": "My\nProject", "barValue": 0.4},
  {"text": "My Work", "barValue": 0.7},
  {"text": "Others", "barValue": 0.9},
  {"text": "Misc.", "barValue": 0.5}
];

class AccountOverview1 extends StatefulWidget {
  const AccountOverview1({Key? key}) : super(key: key);

  @override
  State<AccountOverview1> createState() => _AccountOverview1();
}

class _AccountOverview1 extends State<AccountOverview1> {
  final String avatarImgPath = "assets/avatar.jpg";
  final String headerButtonText = "USD";

  final double bottomTimePickingLargeWidth = 77.w;
  final double bottomTimePickingSmallWidth = 57.w;
  final String modalSheetTotalSpendingText = "Total Spending";
  final String modalSheetMoneyText = "\$2,450";

  ExpenseIncomePick _selectedEI = ExpenseIncomePick.expense;
  BottomBarTimePick _selectedTime = BottomBarTimePick.d;

  bool notificationVisibility = true;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
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
                    child: Stack(
                      children: [
                        Container(
                          height: 36.h,
                          width: 36.w,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(avatarImgPath)),
                              shape: BoxShape.circle),
                        ),
                        Positioned(
                            right: 1.5,
                            top: 1.5,
                            child: Visibility(
                                visible: notificationVisibility,
                                child: Container(
                                  height: 8.h,
                                  width: 8.w,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white),
                                  child: Center(
                                      child: Container(
                                    height: 6.h,
                                    width: 6.w,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xffFF5247)),
                                  )),
                                )))
                      ],
                    )),
                Text("Swipe",
                    style: GoogleFonts.poppins(
                        fontSize: 20.h, fontWeight: FontWeight.w500)),
                Container(
                  height: 32.h,
                  width: 66.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(48.sp),
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
            padding: EdgeInsets.only(
                left: 25.w, right: 25.w, top: 30.h, bottom: 16.h),
            child: SizedBox(
              width: 310.w,
              height: 20.h,
              child: Text(
                "Multiple Selection",
                textAlign: TextAlign.end,
                style: GoogleFonts.poppins(
                    fontSize: 16.h,
                    color: Utils.kMultipleSelectionTextColor,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.w, right: 25.w),
            child: Container(
                height: 181.h,
                width: 312.w,
                decoration: BoxDecoration(
                    color: Utils.kAccountCardColor,
                    borderRadius: BorderRadius.circular(16.sp)),
                child: Padding(
                  padding: EdgeInsets.only(top: 18.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: 26.h,
                            bottom:
                                MediaQuery.of(context).size.height * 0.0125),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.075,
                              width: MediaQuery.of(context).size.height * 0.075,
                              child: CustomPaint(
                                    size: Size(60.w, 60.h), 

                                painter: AccountLogoPainter(),
                              ),
                            ),
                            SizedBox(
                                height: MediaQuery.of(context).size.height *
                                    0.0175),
                            Text(
                              "Total Accounts",
                              style: GoogleFonts.poppins(
                                  fontSize: 12.h,
                                  fontWeight: FontWeight.w700,
                                  color: Utils.kAccountCardTextColor),
                            ),
                            Text(
                              "1 000 000 USD",
                              style: GoogleFonts.poppins(
                                  fontSize: 24.h,
                                  fontWeight: FontWeight.w700,
                                  color: Utils.kAccountCardTextColor),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 26.h, bottom: 18.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 36.h,
                              width: 36.w,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Utils.kAccountCardTextColor
                                      .withOpacity(0.15)),
                              child: Center(
                                child: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Utils.kAccountCardTextColor,
                                  size: 18.h,
                                ),
                              ),
                            ),
                            Container(
                                height: 36.h,
                                width: 36.w,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Utils.kAccountCardTextColor
                                        .withOpacity(0.15)),
                                child: Center(
                                    child: CustomPaint(
                                  size: Size(18, 18.h),
                                  painter: BagIconPainter(),
                                ))),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          ),
          Padding(
            padding: EdgeInsets.only(left: 19.w, top: 24, bottom: 24),
            child: SizedBox(
              height: 40.h,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Container(
                      width: 45.w,
                      height: 39.h,
                      decoration: BoxDecoration(
                        color: Utils.kSelectionTabButtonColor,
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      child: Center(
                          child: CustomPaint(
                        size: Size(36.w, 30.h),
                        painter: BookmarkLogoPainter1(),
                      )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Container(
                      width: 45.w,
                      height: 39.h,
                      decoration: BoxDecoration(
                        color: Utils.kSelectionTabButtonColor,
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      child: Center(
                          child: Icon(Icons.filter_alt_rounded,
                              color: Utils.kSelectionTabIconColor, size: 25.h)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Container(
                      width: 45.w,
                      height: 39.h,
                      decoration: BoxDecoration(
                        color: Utils.kSelectionTabButtonColor,
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      child: Center(
                          child: Icon(
                        Icons.border_color_rounded,
                        color: Utils.kSelectionTabIconColor,
                        size: 25.h,
                      )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Container(
                      width: 45.w,
                      height: 39.h,
                      decoration: BoxDecoration(
                        color: Utils.kSelectionTabButtonColor,
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      child: Center(
                          child: CustomPaint(
                        size: Size(18.w, 22.h),
                        painter: MobileDataPainter1(),
                      )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Container(
                      width: 45.w,
                      height: 39.h,
                      decoration: BoxDecoration(
                        color: Utils.kSelectionTabButtonColor,
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      child: Center(
                          child: CustomPaint(
                        size: Size(18.w, 14.h),
                        painter: MenuIconPainter1(),
                      )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Container(
                      width: 45.w,
                      height: 39.h,
                      decoration: BoxDecoration(
                        color: Utils.kSelectionTabButtonColor,
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      child: Center(
                          child: CustomPaint(
                        size: Size(17.w, 19.h),
                        painter: PieChartIconPainter1(),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: _balanceDetailsList.length,
                itemBuilder: (context, index) {
                  return OverviewPage1ListItem(
                      dotColor: _balanceDetailsList[index]["dotColor"],
                      balanceTypeText: _balanceDetailsList[index]
                          ["balanceType"],
                      date: _balanceDetailsList[index]["date"],
                      money: _balanceDetailsList[index]["money"]);
                },
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 2,
              spreadRadius: 1),
        ]),
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
                      borderRadius: BorderRadius.circular(16.sp),
                      color: _selectedEI == ExpenseIncomePick.expense
                          ? Utils.kBottomBarExpenseIncomeSelectedColor
                          : Utils.kBottomBarExpenseIncomeUnselectedColor,
                    ),
                    child: Center(
                        child: Text("Expense",
                            style: GoogleFonts.poppins(
                                fontSize: 12.h,
                                fontWeight: FontWeight.w700,
                                color: _selectedEI == ExpenseIncomePick.expense
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
                      borderRadius: BorderRadius.circular(16.sp),
                      color: _selectedEI == ExpenseIncomePick.income
                          ? Utils.kBottomBarExpenseIncomeSelectedColor
                          : Utils.kBottomBarExpenseIncomeUnselectedColor,
                    ),
                    child: Center(
                        child: Text("Income",
                            style: GoogleFonts.poppins(
                                fontSize: 12.h,
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
                          fontSize: 10.h,
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
                          fontSize: 10.h,
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
                          fontSize: 10.h,
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
                      _showModalBottomSheet(context);
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
                          fontSize: 10.h,
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
  }

  Future<dynamic> _showModalBottomSheet(BuildContext context) {
    return showModalBottomSheet<dynamic>(
        isScrollControlled: true,
        useRootNavigator: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16))),
        context: context,
        builder: (context) {
          return Container(
            height: 490.h,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
                color: Utils.kModalSheetBackgroundColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 653,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 24.h, bottom: 24.h),
                        child: Container(
                          height: 64.h,
                          width: 64.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Utils.kOverviewModalSheetIconBackGroundColor,
                          ),
                          child: Center(
                              child: CustomPaint(
                            size:  Size(26.w, 26.h),
                            painter: ModalSheetIconPainter1(),
                          )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 24.h),
                        child: Container(
                          height: 72.h,
                          width: 312.w,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(modalSheetTotalSpendingText,
                                      style: GoogleFonts.poppins(
                                          fontSize: 16.h,
                                          fontWeight: FontWeight.w500,
                                          color: Utils.kModalSheetTextColor)),
                                  Text(
                                    modalSheetMoneyText,
                                    style: GoogleFonts.poppins(
                                        fontSize: 31.h,
                                        fontWeight: FontWeight.w600,
                                        color: Utils.kModalSheetTextColor),
                                  )
                                ],
                              ),
                              const Spacer(),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  DropDown(
                                      showUnderline: false,
                                      items: const ["Apr 22", "Apr 23"],
                                      hint: Text(
                                        "Apr 22",
                                        style: GoogleFonts.poppins(
                                            fontSize: 14.h,
                                            fontWeight: FontWeight.w500,
                                            color: Utils.kModalSheetTextColor),
                                      ),
                                      icon: const Icon(
                                          Icons.arrow_drop_down_rounded,
                                          color: Utils.kModalSheetTextColor)),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 174.h,
                                width: 310.w,
                                child: MediaQuery.removePadding(
                                  context: context,
                                  removeLeft: true,
                                  child: ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: _barListDetailsList.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 9.w),
                                        child: Column(
                                          children: [
                                            RotatedBox(
                                              quarterTurns: -1,
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Utils
                                                              .kModalSheetTextColor)),
                                                  width: 106.w,
                                                  height: 38.w,
                                                  child:
                                                      LinearProgressIndicator(
                                                    backgroundColor:
                                                        const Color(0xffF2F4F5),
                                                    color: Utils
                                                        .kOverviewModalSheetIndicatorColor,
                                                    value: _barListDetailsList[
                                                        index]["barValue"],
                                                  )),
                                            ),
                                            const SizedBox(height: 10),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                    _barListDetailsList[index]
                                                        ["text"],
                                                    textAlign: TextAlign.center,
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 8.h,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Utils
                                                          .kModalSheetTextColor,
                                                    )),
                                              ],
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 117,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 75,
                      decoration: const BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  color: Utils.kModalSheetDividerColor))),
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Text(
                          "Cancel",
                          style: GoogleFonts.poppins(
                              fontSize: 16.h,
                              fontWeight: FontWeight.w500,
                              color: Utils.kModalSheetCancelButtonTextColor),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}

class OverviewPage1ListItem extends StatelessWidget {
  final Color dotColor;
  final String balanceTypeText;
  final String date;
  final String money;
  const OverviewPage1ListItem({
    Key? key,
    required this.dotColor,
    required this.balanceTypeText,
    required this.date,
    required this.money,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 35.w, right: 35.w),
      child: Container(
        height: 44.h,
        width: 290.w,
        child: Center(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.fiber_manual_record_rounded,
              size: 12.h,
              color: dotColor,
            ),
            SizedBox(
              width: 12.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  balanceTypeText,
                  style: GoogleFonts.poppins(
                      fontSize: 16.h,
                      fontWeight: FontWeight.w500,
                      color: Utils.kListViewPrimaryTextColor),
                ),
                Text(date,
                    style: GoogleFonts.poppins(
                      fontSize: 12.h,
                      fontWeight: FontWeight.w400,
                      color: Utils.kListViewSecondaryTextColor,
                    ))
              ],
            ),
            const Spacer(),
            Text(
              money,
              style: GoogleFonts.poppins(
                  fontSize: 16.h,
                  fontWeight: FontWeight.w500,
                  color: Utils.kListViewPrimaryTextColor),
            )
          ],
        )),
      ),
    );
  }
}

class AccountLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Colors.white.withOpacity(1.0);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(0, 0, size.width * 0.9821433, size.height),
            bottomRight: Radius.circular(size.width * 0.2500000),
            bottomLeft: Radius.circular(size.width * 0.2500000),
            topLeft: Radius.circular(size.width * 0.2500000),
            topRight: Radius.circular(size.width * 0.2500000)),
        paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.2342717, size.height * 0.3994750);
    path_1.cubicTo(
        size.width * 0.1662237,
        size.height * 0.5087200,
        size.width * 0.1967433,
        size.height * 0.6526117,
        size.width * 0.3024400,
        size.height * 0.7208650);
    path_1.lineTo(size.width * 0.4256517, size.height * 0.5230583);
    path_1.lineTo(size.width * 0.2342717, size.height * 0.3994750);
    path_1.close();

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = const Color(0xffFFB323).withOpacity(1.0);
    canvas.drawPath(path_1, paint1Fill);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.3099033, size.height * 0.7244467);
    path_2.cubicTo(
        size.width * 0.4142217,
        size.height * 0.7918100,
        size.width * 0.5540200,
        size.height * 0.7577483,
        size.width * 0.6221533,
        size.height * 0.6483667);
    path_2.lineTo(size.width * 0.4332700, size.height * 0.5263933);
    path_2.lineTo(size.width * 0.3099033, size.height * 0.7244467);
    path_2.close();

    Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = const Color(0xff23C16B).withOpacity(1.0);
    canvas.drawPath(path_2, paint2Fill);

    Path path_3 = Path();
    path_3.moveTo(size.width * 0.5550000, size.height * 0.3159283);
    path_3.cubicTo(
        size.width * 0.4490517,
        size.height * 0.2475117,
        size.width * 0.3075350,
        size.height * 0.2813533,
        size.width * 0.2389150,
        size.height * 0.3915167);
    path_3.lineTo(size.width * 0.4307517, size.height * 0.5153967);
    path_3.lineTo(size.width * 0.5550000, size.height * 0.3159283);
    path_3.close();

    Paint paint3Fill = Paint()..style = PaintingStyle.fill;
    paint3Fill.color = const Color(0xff4478DE).withOpacity(1.0);
    canvas.drawPath(path_3, paint3Fill);

    Path path_4 = Path();
    path_4.moveTo(size.width * 0.8281783, size.height * 0.5859833);
    path_4.cubicTo(
        size.width * 0.8871133,
        size.height * 0.4953350,
        size.width * 0.8612717,
        size.height * 0.3722333,
        size.width * 0.7704617,
        size.height * 0.3110283);
    path_4.lineTo(size.width * 0.6637533, size.height * 0.4751617);
    path_4.lineTo(size.width * 0.8281783, size.height * 0.5859833);
    path_4.close();

    Paint paint4Fill = Paint()..style = PaintingStyle.fill;
    paint4Fill.color = const Color(0xffF45655).withOpacity(1.0);
    canvas.drawPath(path_4, paint4Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class BookmarkLogoPainter1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    paint0Stroke.color = const Color(0xff4478DE).withOpacity(1.0);
    paint0Stroke.strokeCap = StrokeCap.round;
    canvas.drawLine(Offset(size.width * 0.6689583, size.height * 0.2235563),
        Offset(size.width * 0.2140789, size.height * 0.8084000), paint0Stroke);

    Path path_1 = Path();
    path_1.moveTo(31.0818, 16.991);
    path_1.cubicTo(29.3756, 16.7049, 27.6244, 16.7049, 25.9182, 16.991);
    path_1.cubicTo(25.2949, 17.0955, 24.7985, 17.574, 24.6735, 18.1945);
    path_1.cubicTo(24.1009, 21.0371, 24.0697, 23.9621, 24.5814, 26.8162);
    path_1.lineTo(24.7897, 27.9783);
    path_1.cubicTo(24.854, 28.3366, 25.2908, 28.4798, 25.5547, 28.2291);
    path_1.lineTo(28.0695, 25.84);
    path_1.cubicTo(28.3108, 25.6108, 28.6892, 25.6108, 28.9305, 25.84);
    path_1.lineTo(31.4453, 28.2291);
    path_1.cubicTo(31.7092, 28.4798, 32.146, 28.3366, 32.2103, 27.9783);
    path_1.lineTo(32.4186, 26.8162);
    path_1.cubicTo(32.9303, 23.9621, 32.8991, 21.0371, 32.3265, 18.1945);
    path_1.cubicTo(32.2015, 17.574, 31.7051, 17.0955, 31.0818, 16.991);
    path_1.close();

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = const Color(0xff4478DE).withOpacity(1.0);
    canvas.drawPath(path_1, paint1Fill);

    Path path_2 = Path();
    path_2.moveTo(2.1875, 7.5);
    path_2.cubicTo(2.1875, 4.56599, 4.56599, 2.1875, 7.5, 2.1875);
    path_2.cubicTo(10.434, 2.1875, 12.8125, 4.56599, 12.8125, 7.5);
    path_2.cubicTo(12.8125, 10.434, 10.434, 12.8125, 7.5, 12.8125);
    path_2.cubicTo(4.56599, 12.8125, 2.1875, 10.434, 2.1875, 7.5);
    path_2.close();
    path_2.moveTo(7.96875, 4.375);
    path_2.cubicTo(7.96875, 4.11612, 7.75888, 3.90625, 7.5, 3.90625);
    path_2.cubicTo(7.24112, 3.90625, 7.03125, 4.11612, 7.03125, 4.375);
    path_2.lineTo(7.03125, 7.5);
    path_2.cubicTo(7.03125, 7.66162, 7.11451, 7.81184, 7.25156, 7.8975);
    path_2.lineTo(9.12656, 9.06937);
    path_2.cubicTo(9.3461, 9.20658, 9.63529, 9.13984, 9.7725, 8.92031);
    path_2.cubicTo(9.90971, 8.70078, 9.84297, 8.41158, 9.62344, 8.27438);
    path_2.lineTo(7.96875, 7.2402);
    path_2.lineTo(7.96875, 4.375);
    path_2.close();

    Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = const Color(0xff4478DE).withOpacity(1.0);
    canvas.drawPath(path_2, paint2Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class MobileDataPainter1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(10.7146, 5.78538);
    path_0.cubicTo(11.0563, 6.12709, 11.6103, 6.12709, 11.9521, 5.78538);
    path_0.lineTo(12.7917, 4.94577);
    path_0.lineTo(12.7917, 16.8333);
    path_0.cubicTo(12.7917, 17.3166, 13.1834, 17.7083, 13.6667, 17.7083);
    path_0.cubicTo(14.1499, 17.7083, 14.5417, 17.3166, 14.5417, 16.8333);
    path_0.lineTo(14.5417, 4.94577);
    path_0.lineTo(15.3813, 5.78538);
    path_0.cubicTo(15.723, 6.12709, 16.277, 6.12709, 16.6187, 5.78538);
    path_0.cubicTo(16.9604, 5.44368, 16.9604, 4.88966, 16.6187, 4.54795);
    path_0.lineTo(14.2854, 2.21461);
    path_0.cubicTo(13.9437, 1.8729, 13.3897, 1.8729, 13.0479, 2.21461);
    path_0.lineTo(10.7146, 4.54795);
    path_0.cubicTo(10.3729, 4.88966, 10.3729, 5.44368, 10.7146, 5.78538);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xff4478DE).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(5.20833, 17.0542);
    path_1.lineTo(6.04795, 16.2146);
    path_1.cubicTo(6.38966, 15.8729, 6.94368, 15.8729, 7.28539, 16.2146);
    path_1.cubicTo(7.62709, 16.5563, 7.62709, 17.1103, 7.28539, 17.4521);
    path_1.lineTo(4.95205, 19.7854);
    path_1.cubicTo(4.61034, 20.1271, 4.05632, 20.1271, 3.71461, 19.7854);
    path_1.lineTo(1.38128, 17.4521);
    path_1.cubicTo(1.03957, 17.1103, 1.03957, 16.5563, 1.38128, 16.2146);
    path_1.cubicTo(1.72299, 15.8729, 2.27701, 15.8729, 2.61872, 16.2146);
    path_1.lineTo(3.45833, 17.0542);
    path_1.lineTo(3.45833, 5.16667);
    path_1.cubicTo(3.45833, 4.68342, 3.85008, 4.29167, 4.33333, 4.29167);
    path_1.cubicTo(4.81658, 4.29167, 5.20833, 4.68342, 5.20833, 5.16667);
    path_1.lineTo(5.20833, 17.0542);
    path_1.close();

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = const Color(0xff4478DE).withOpacity(1.0);
    canvas.drawPath(path_1, paint1Fill);

    Path path_2 = Path();
    path_2.moveTo(10.7146, 5.78538);
    path_2.cubicTo(11.0563, 6.12709, 11.6103, 6.12709, 11.9521, 5.78538);
    path_2.lineTo(12.7917, 4.94577);
    path_2.lineTo(12.7917, 16.8333);
    path_2.cubicTo(12.7917, 17.3166, 13.1834, 17.7083, 13.6667, 17.7083);
    path_2.cubicTo(14.1499, 17.7083, 14.5417, 17.3166, 14.5417, 16.8333);
    path_2.lineTo(14.5417, 4.94577);
    path_2.lineTo(15.3813, 5.78538);
    path_2.cubicTo(15.723, 6.12709, 16.277, 6.12709, 16.6187, 5.78538);
    path_2.cubicTo(16.9604, 5.44368, 16.9604, 4.88966, 16.6187, 4.54795);
    path_2.lineTo(14.2854, 2.21461);
    path_2.cubicTo(13.9437, 1.8729, 13.3897, 1.8729, 13.0479, 2.21461);
    path_2.lineTo(10.7146, 4.54795);
    path_2.cubicTo(10.3729, 4.88966, 10.3729, 5.44368, 10.7146, 5.78538);
    path_2.close();

    Paint paint2Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.1111111;
    paint2Stroke.color = const Color(0xff4478DE).withOpacity(1.0);
    paint2Stroke.strokeCap = StrokeCap.round;
    canvas.drawPath(path_2, paint2Stroke);

    Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = const Color(0xff4478DE).withOpacity(1.0);
    canvas.drawPath(path_2, paint2Fill);

    Path path_3 = Path();
    path_3.moveTo(5.20833, 17.0542);
    path_3.lineTo(6.04795, 16.2146);
    path_3.cubicTo(6.38966, 15.8729, 6.94368, 15.8729, 7.28539, 16.2146);
    path_3.cubicTo(7.62709, 16.5563, 7.62709, 17.1103, 7.28539, 17.4521);
    path_3.lineTo(4.95205, 19.7854);
    path_3.cubicTo(4.61034, 20.1271, 4.05632, 20.1271, 3.71461, 19.7854);
    path_3.lineTo(1.38128, 17.4521);
    path_3.cubicTo(1.03957, 17.1103, 1.03957, 16.5563, 1.38128, 16.2146);
    path_3.cubicTo(1.72299, 15.8729, 2.27701, 15.8729, 2.61872, 16.2146);
    path_3.lineTo(3.45833, 17.0542);
    path_3.lineTo(3.45833, 5.16667);
    path_3.cubicTo(3.45833, 4.68342, 3.85008, 4.29167, 4.33333, 4.29167);
    path_3.cubicTo(4.81658, 4.29167, 5.20833, 4.68342, 5.20833, 5.16667);
    path_3.lineTo(5.20833, 17.0542);
    path_3.close();

    Paint paint3Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.1111111;
    paint3Stroke.color = const Color(0xff4478DE).withOpacity(1.0);
    paint3Stroke.strokeCap = StrokeCap.round;
    canvas.drawPath(path_3, paint3Stroke);

    Paint paint3Fill = Paint()..style = PaintingStyle.fill;
    paint3Fill.color = const Color(0xff4478DE).withOpacity(1.0);
    canvas.drawPath(path_3, paint3Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class MenuIconPainter1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(16.75, 7);
    path_0.cubicTo(16.75, 6.58579, 16.4142, 6.25, 16, 6.25);
    path_0.lineTo(2, 6.25);
    path_0.cubicTo(1.58579, 6.25, 1.25, 6.58579, 1.25, 7);
    path_0.cubicTo(1.25, 7.41421, 1.58579, 7.75, 2, 7.75);
    path_0.lineTo(16, 7.75);
    path_0.cubicTo(16.4142, 7.75, 16.75, 7.41421, 16.75, 7);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xff4478DE).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(16.75, 2);
    path_1.cubicTo(16.75, 1.58579, 16.4142, 1.25, 16, 1.25);
    path_1.lineTo(2, 1.25);
    path_1.cubicTo(1.58579, 1.25, 1.25, 1.58579, 1.25, 2);
    path_1.cubicTo(1.25, 2.41421, 1.58579, 2.75, 2, 2.75);
    path_1.lineTo(16, 2.75);
    path_1.cubicTo(16.4142, 2.75, 16.75, 2.41421, 16.75, 2);
    path_1.close();

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = const Color(0xff4478DE).withOpacity(1.0);
    canvas.drawPath(path_1, paint1Fill);

    Path path_2 = Path();
    path_2.moveTo(16.75, 12);
    path_2.cubicTo(16.75, 11.5858, 16.4142, 11.25, 16, 11.25);
    path_2.lineTo(2, 11.25);
    path_2.cubicTo(1.58579, 11.25, 1.25, 11.5858, 1.25, 12);
    path_2.cubicTo(1.25, 12.4142, 1.58579, 12.75, 2, 12.75);
    path_2.lineTo(16, 12.75);
    path_2.cubicTo(16.4142, 12.75, 16.75, 12.4142, 16.75, 12);
    path_2.close();

    Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = const Color(0xff4478DE).withOpacity(1.0);
    canvas.drawPath(path_2, paint2Fill);

    Path path_3 = Path();
    path_3.moveTo(16.75, 7);
    path_3.cubicTo(16.75, 6.58579, 16.4142, 6.25, 16, 6.25);
    path_3.lineTo(2, 6.25);
    path_3.cubicTo(1.58579, 6.25, 1.25, 6.58579, 1.25, 7);
    path_3.cubicTo(1.25, 7.41421, 1.58579, 7.75, 2, 7.75);
    path_3.lineTo(16, 7.75);
    path_3.cubicTo(16.4142, 7.75, 16.75, 7.41421, 16.75, 7);
    path_3.close();

    Paint paint3Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.1111111;
    paint3Stroke.color = const Color(0xff4478DE).withOpacity(1.0);
    paint3Stroke.strokeCap = StrokeCap.round;
    canvas.drawPath(path_3, paint3Stroke);

    Paint paint3Fill = Paint()..style = PaintingStyle.fill;
    paint3Fill.color = const Color(0xff4478DE).withOpacity(1.0);
    canvas.drawPath(path_3, paint3Fill);

    Path path_4 = Path();
    path_4.moveTo(16.75, 2);
    path_4.cubicTo(16.75, 1.58579, 16.4142, 1.25, 16, 1.25);
    path_4.lineTo(2, 1.25);
    path_4.cubicTo(1.58579, 1.25, 1.25, 1.58579, 1.25, 2);
    path_4.cubicTo(1.25, 2.41421, 1.58579, 2.75, 2, 2.75);
    path_4.lineTo(16, 2.75);
    path_4.cubicTo(16.4142, 2.75, 16.75, 2.41421, 16.75, 2);
    path_4.close();

    Paint paint4Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.1111111;
    paint4Stroke.color = const Color(0xff4478DE).withOpacity(1.0);
    paint4Stroke.strokeCap = StrokeCap.round;
    canvas.drawPath(path_4, paint4Stroke);

    Paint paint4Fill = Paint()..style = PaintingStyle.fill;
    paint4Fill.color = const Color(0xff4478DE).withOpacity(1.0);
    canvas.drawPath(path_4, paint4Fill);

    Path path_5 = Path();
    path_5.moveTo(16.75, 12);
    path_5.cubicTo(16.75, 11.5858, 16.4142, 11.25, 16, 11.25);
    path_5.lineTo(2, 11.25);
    path_5.cubicTo(1.58579, 11.25, 1.25, 11.5858, 1.25, 12);
    path_5.cubicTo(1.25, 12.4142, 1.58579, 12.75, 2, 12.75);
    path_5.lineTo(16, 12.75);
    path_5.cubicTo(16.4142, 12.75, 16.75, 12.4142, 16.75, 12);
    path_5.close();

    Paint paint5Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.1111111;
    paint5Stroke.color = const Color(0xff4478DE).withOpacity(1.0);
    paint5Stroke.strokeCap = StrokeCap.round;
    canvas.drawPath(path_5, paint5Stroke);

    Paint paint5Fill = Paint()..style = PaintingStyle.fill;
    paint5Fill.color = const Color(0xff4478DE).withOpacity(1.0);
    canvas.drawPath(path_5, paint5Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class PieChartIconPainter1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(18.4384, 6.94714);
    path_0.cubicTo(17.9878, 3.32682, 15.1183, 0.457328, 11.498, 0.00680025);
    path_0.cubicTo(10.95, -0.0614024, 10.5, 0.392869, 10.5, 0.945154);
    path_0.lineTo(10.5, 7.44515);
    path_0.cubicTo(10.5, 7.7213, 10.7239, 7.94515, 11, 7.94515);
    path_0.lineTo(17.5, 7.94515);
    path_0.cubicTo(18.0523, 7.94515, 18.5066, 7.4952, 18.4384, 6.94714);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xff4478DE).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(8.5, 1.44516);
    path_1.cubicTo(3.80558, 1.44516, 0, 5.25074, 0, 9.94516);
    path_1.cubicTo(0, 14.6396, 3.80558, 18.4452, 8.5, 18.4452);
    path_1.cubicTo(13.1944, 18.4452, 17, 14.6396, 17, 9.94516);
    path_1.cubicTo(17, 9.66902, 16.7761, 9.44516, 16.5, 9.44516);
    path_1.lineTo(9.5, 9.44516);
    path_1.cubicTo(9.22386, 9.44516, 9, 9.2213, 9, 8.94516);
    path_1.lineTo(9, 1.94516);
    path_1.cubicTo(9, 1.66902, 8.77614, 1.44516, 8.5, 1.44516);
    path_1.close();

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = const Color(0xff4478DE).withOpacity(1.0);
    canvas.drawPath(path_1, paint1Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class ModalSheetIconPainter1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(4.18364, 3.00177);
    path_0.lineTo(4.18364, 10.5071);
    path_0.cubicTo(4.18364, 11.8831, 5.30944, 13.0089, 6.68542, 13.0089);
    path_0.lineTo(19.1943, 13.0089);
    path_0.cubicTo(20.5703, 13.0089, 21.6961, 11.8831, 21.6961, 10.5071);
    path_0.lineTo(21.6961, 3.00177);
    path_0.cubicTo(21.6961, 1.62579, 20.5703, 0.499989, 19.1943, 0.499989);
    path_0.lineTo(6.68542, 0.499989);
    path_0.cubicTo(5.30944, 0.499989, 4.18364, 1.62579, 4.18364, 3.00177);
    path_0.close();
    path_0.moveTo(16.6926, 4.25266);
    path_0.lineTo(9.1872, 4.25266);
    path_0.lineTo(9.1872, 3.00177);
    path_0.lineTo(16.6926, 3.00177);
    path_0.lineTo(16.6926, 4.25266);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(25.1986, 15.6357);
    path_1.cubicTo(24.9484, 15.3856, 24.5732, 15.1354, 23.8226, 15.0103);
    path_1.cubicTo(23.0721, 14.8852, 19.0692, 14.3848, 18.5689, 14.2597);
    path_1.cubicTo(17.8183, 14.1347, 16.9427, 14.5099, 15.8169, 15.2605);
    path_1.cubicTo(15.0664, 15.7608, 13.5653, 16.6365, 13.4402, 16.6365);
    path_1.cubicTo(13.5653, 16.7615, 14.1908, 16.7615, 14.1908, 16.7615);
    path_1.lineTo(14.3158, 16.7615);
    path_1.cubicTo(15.6918, 16.7615, 16.6925, 17.8874, 16.6925, 19.1383);
    path_1.lineTo(16.6925, 19.3884);
    path_1.cubicTo(16.6925, 20.7644, 15.5667, 21.7652, 14.3158, 21.7652);
    path_1.lineTo(11.689, 21.7652);
    path_1.cubicTo(9.43737, 21.7652, 7.31086, 19.5135, 7.31086, 19.5135);
    path_1.cubicTo(7.31086, 19.5135, 9.93773, 20.5142, 11.689, 20.5142);
    path_1.lineTo(14.1908, 20.5142);
    path_1.cubicTo(14.9413, 20.5142, 15.4417, 19.8888, 15.4417, 19.2633);
    path_1.cubicTo(15.4417, 18.6379, 14.9413, 18.0124, 14.3158, 18.0124);
    path_1.cubicTo(11.9392, 17.7623, 10.9384, 16.7615, 10.9384, 16.7615);
    path_1.cubicTo(10.9384, 16.7615, 8.81193, 15.1354, 8.06139, 14.7601);
    path_1.cubicTo(5.43452, 13.259, 0.556046, 16.3863, 0.556046, 16.3863);
    path_1.lineTo(3.80836, 23.5164);
    path_1.cubicTo(3.80836, 23.5164, 5.43452, 22.5157, 7.68613, 23.3913);
    path_1.cubicTo(9.1872, 24.0168, 10.0628, 24.5171, 11.5639, 25.0175);
    path_1.cubicTo(13.6904, 25.768, 14.4409, 25.6429, 15.8169, 24.6422);
    path_1.cubicTo(17.0678, 23.7666, 23.0721, 19.0132, 23.9477, 18.3877);
    path_1.cubicTo(25.1986, 17.2619, 25.824, 16.3863, 25.1986, 15.6357);
    path_1.close();

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_1, paint1Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class BagIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(13.25, 1);
    path_0.cubicTo(13.25, 0.585786, 13.5858, 0.25, 14, 0.25);
    path_0.cubicTo(14.4142, 0.25, 14.75, 0.585786, 14.75, 1);
    path_0.lineTo(14.75, 2.81643);
    path_0.cubicTo(16.2431, 3.02751, 17.4226, 4.20845, 17.6223, 5.71484);
    path_0.lineTo(17.7089, 6.36779);
    path_0.cubicTo(17.7235, 6.47849, 17.7376, 6.58926, 17.7509, 6.70008);
    path_0.cubicTo(17.7865, 6.99405, 17.5549, 7.25, 17.2588, 7.25);
    path_0.lineTo(0.741308, 7.25);
    path_0.cubicTo(0.445202, 7.25, 0.213594, 6.99405, 0.249111, 6.70008);
    path_0.cubicTo(0.262501, 6.58926, 0.276533, 6.47849, 0.291206, 6.36779);
    path_0.lineTo(0.377758, 5.71484);
    path_0.cubicTo(0.577433, 4.20847, 1.75696, 3.02754, 3.25, 2.81644);
    path_0.lineTo(3.25, 1);
    path_0.cubicTo(3.25, 0.585786, 3.58579, 0.25, 4, 0.25);
    path_0.cubicTo(4.41421, 0.25, 4.75, 0.585786, 4.75, 1);
    path_0.lineTo(4.75, 2.66763);
    path_0.cubicTo(7.57773, 2.4158, 10.4223, 2.4158, 13.25, 2.66763);
    path_0.lineTo(13.25, 1);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(0.0554333, 9.22555);
    path_1.cubicTo(0.064188, 8.95912, 0.284353, 8.75, 0.550924, 8.75);
    path_1.lineTo(17.4491, 8.75);
    path_1.cubicTo(17.7157, 8.75, 17.9359, 8.95912, 17.9446, 9.22555);
    path_1.cubicTo(18.004, 11.0332, 17.8942, 12.8446, 17.6155, 14.6359);
    path_1.cubicTo(17.4045, 15.9919, 16.3028, 17.0335, 14.9371, 17.1681);
    path_1.lineTo(13.7441, 17.2858);
    path_1.cubicTo(10.589, 17.5969, 7.41103, 17.5969, 4.25599, 17.2858);
    path_1.lineTo(3.06298, 17.1681);
    path_1.cubicTo(1.69724, 17.0335, 0.595579, 15.9919, 0.384569, 14.6359);
    path_1.cubicTo(0.105837, 12.8446, -0.00396538, 11.0332, 0.0554333, 9.22555);
    path_1.close();

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_1, paint1Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
