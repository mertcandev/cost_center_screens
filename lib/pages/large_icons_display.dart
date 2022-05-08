// ignore_for_file: unused_field, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';

import 'package:cost_center_screens/utils.dart';

enum ExpenseIncomePick { expense, income }
enum BottomBarTimePick { d, w, m, y }

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

List<Map> folderDetails = [
  {
    "color": Utils.kExpenseFolderAccentColor,
    "boldText": "Total Spending",
    "folderBoldMoney": "100000",
    "folderMoney": "10000",
    "progressBarValue": 0.5
  },
  {
    "color": Utils.kExpenseFolderAccentColor,
    "boldText": "Personal Spending",
    "folderBoldMoney": "100000",
    "folderMoney": "10000",
    "progressBarValue": 0.5
  },
  {
    "color": Utils.kExpenseFolderColor,
    "boldText": "Family Expenses",
    "folderBoldMoney": "100000",
    "folderMoney": "10000",
    "progressBarValue": 0.5
  },
  {
    "color": Utils.kExpenseFolderColor,
    "boldText": "My Project",
    "folderBoldMoney": "100000",
    "folderMoney": "10000",
    "progressBarValue": 0.5
  }
];

class LargeIconsDisplay extends StatefulWidget {
  const LargeIconsDisplay({Key? key}) : super(key: key);

  @override
  State<LargeIconsDisplay> createState() => _LargeIconsDisplayState();
}

class _LargeIconsDisplayState extends State<LargeIconsDisplay> {
  final String avatarImgPath = "assets/avatar.jpg";
  final String headerButtonText = "USD";
  final String searchBarText = "Looking for something...";
  final String totalSpendingText = "Total\nSpending";
  final String totalSpentMoney = "1900\$";
  final String spendingDate = "Mar 22";
  final double bottomTimePickingLargeWidth = 77.w;
  final double bottomTimePickingSmallWidth = 57.w;

  ExpenseIncomePick _selectedEI = ExpenseIncomePick.expense;
  BottomBarTimePick _selectedTime = BottomBarTimePick.d;
  bool notificationVisibility = true;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context) {
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
                          style: GoogleFonts.poppins(fontSize: 11.h),
                        ),
                         SizedBox(width: 5.w),
                        CustomPaint(
                          size: const Size(15, 13),
                          painter: BagIconPainter(),
                        )
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SizedBox(
                    height: 150.h,
                    width: 150.h,
                    child: PieChart(
                      chartType: ChartType.ring,
                      dataMap: chartMap,
                      colorList: colorList,
                      chartRadius: 100.h,
                      ringStrokeWidth: 40.h,
                      legendOptions: const LegendOptions(showLegends: false),
                      chartValuesOptions:
                          const ChartValuesOptions(showChartValues: false),
                      animationDuration: const Duration(seconds: 3),
                      centerText: "Top 3",
                      centerTextStyle: GoogleFonts.poppins(
                          fontSize: 11.h,
                          fontWeight: FontWeight.w400,
                          color: Utils.kChartCenterTextColor),
                    ),
                  ),
                )
              ]),
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
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: GridView.builder(
                    itemCount: folderDetails.length,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1.115, crossAxisCount: 2),
                    itemBuilder: (BuildContext ctx, index) {
                      return ExpenseFolder(
                          folderFillColor: folderDetails[index]["color"],
                          folderBoldText: folderDetails[index]["boldText"],
                          folderBoldMoney: folderDetails[index]
                              ["folderBoldMoney"],
                          folderMoney: folderDetails[index]["folderMoney"],
                          progressBarValue: folderDetails[index]
                              ["progressBarValue"]);
                    },
                  ),
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: Container(
          height: 86.h,
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 2,
                spreadRadius: 1),
          ]),
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
                                  fontSize: 12.h,
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
    });
  }
}

class ExpenseFolder extends StatefulWidget {
  const ExpenseFolder(
      {Key? key,
      required this.folderBoldText,
      required this.folderBoldMoney,
      required this.folderMoney,
      required this.progressBarValue,
      required this.folderFillColor})
      : super(key: key);

  final String folderBoldText;
  final String folderBoldMoney;
  final String folderMoney;
  final double progressBarValue;
  final Color folderFillColor;

  @override
  State<ExpenseFolder> createState() => _ExpenseFolderState();
}

class _ExpenseFolderState extends State<ExpenseFolder> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 9.w, right: 9.w, bottom: 13.h),
      child: CustomPaint(
        child: Padding(
          padding: EdgeInsets.only(top: 39.h, left: 18.w, bottom: 16.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.folderBoldText,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                    fontSize: 12.h,
                    color: Utils.kExpenseFolderTextColor,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                widget.folderBoldMoney,
                style: GoogleFonts.poppins(
                    fontSize: 12.h,
                    color: Utils.kExpenseFolderTextColor,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                widget.folderMoney,
                style: GoogleFonts.poppins(
                    fontSize: 9.h,
                    color: Utils.kExpenseFolderTextColor,
                    fontWeight: FontWeight.w400),
              ),
              const Spacer(),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                  height: 10.h,
                  width: 75.w,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: LinearProgressIndicator(
                    color: Utils.kExpenseFolderIndicatorColor,
                    backgroundColor: Colors.white,
                    value: widget.progressBarValue.toDouble(),
                  ),
                ),
                SizedBox(width: 15.w),
                Text(
                  "${(widget.progressBarValue * 100).toInt()} %",
                  style: GoogleFonts.poppins(
                      fontSize: 9.h,
                      fontWeight: FontWeight.w700,
                      color: Utils.kExpenseFolderIndicatorColor),
                )
              ])
            ],
          ),
        ),
        painter: FolderPainter(folderFillColor: widget.folderFillColor),
      ),
    );
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
    canvas.drawShadow(path_0, Colors.grey.withAlpha(200), 4.0, false);

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

class BagIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(3.95196, 1.47323);
    path_0.cubicTo(3.95196, 1.18707, 3.69407, 0.955093, 3.37596, 0.955093);
    path_0.cubicTo(3.05784, 0.955093, 2.79996, 1.18707, 2.79996, 1.47323);
    path_0.lineTo(2.79996, 2.7281);
    path_0.cubicTo(1.65328, 2.87393, 0.747382, 3.68977, 0.59403, 4.73046);
    path_0.lineTo(0.527559, 5.18155);
    path_0.cubicTo(0.516289, 5.25802, 0.505513, 5.33455, 0.49523, 5.4111);
    path_0.cubicTo(0.467954, 5.61419, 0.645827, 5.79102, 0.873236, 5.79102);
    path_0.lineTo(13.5586, 5.79102);
    path_0.cubicTo(13.786, 5.79102, 13.9639, 5.61419, 13.9366, 5.4111);
    path_0.cubicTo(13.9264, 5.33454, 13.9156, 5.25802, 13.9043, 5.18154);
    path_0.lineTo(13.8378, 4.73045);
    path_0.cubicTo(13.6845, 3.68979, 12.7786, 2.87395, 11.632, 2.72811);
    path_0.lineTo(11.632, 1.47323);
    path_0.cubicTo(11.632, 1.18707, 11.3741, 0.955093, 11.056, 0.955093);
    path_0.cubicTo(10.7378, 0.955093, 10.48, 1.18707, 10.48, 1.47323);
    path_0.lineTo(10.48, 2.62531);
    path_0.cubicTo(8.30826, 2.45133, 6.12366, 2.45133, 3.95196, 2.6253);
    path_0.lineTo(3.95196, 1.47323);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xff404446).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(14.0854, 7.15582);
    path_1.cubicTo(14.0787, 6.97176, 13.9096, 6.82729, 13.7048, 6.82729);
    path_1.lineTo(0.727022, 6.82729);
    path_1.cubicTo(0.522295, 6.82729, 0.353208, 6.97176, 0.346485, 7.15582);
    path_1.cubicTo(0.300866, 8.40463, 0.385194, 9.65601, 0.599262, 10.8935);
    path_1.cubicTo(0.761317, 11.8303, 1.60739, 12.5499, 2.65628, 12.6429);
    path_1.lineTo(3.57251, 12.7242);
    path_1.cubicTo(5.99558, 12.9392, 8.43629, 12.9392, 10.8594, 12.7242);
    path_1.lineTo(11.7756, 12.6429);
    path_1.cubicTo(12.8245, 12.5499, 13.6706, 11.8303, 13.8326, 10.8935);
    path_1.cubicTo(14.0467, 9.65601, 14.131, 8.40463, 14.0854, 7.15582);
    path_1.close();

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = const Color(0xff404446).withOpacity(1.0);
    canvas.drawPath(path_1, paint1Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
