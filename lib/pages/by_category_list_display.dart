// ignore_for_file: unused_field

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

  final List<Map> _listViewDetails = [
    {
      "listViewText1": "Supermarket",
      "progressBarValue": 0.5,
      "listViewMoney1": 7900.00,
      "listViewMoney2": 12650.00,
      "iconFillColor": Utils.kSuperMarketIconFillColor,
    },
    {
      "listViewText1": "Travel",
      "progressBarValue": 0.5,
      "listViewMoney1": 7900.00,
      "listViewMoney2": 12650.00,
      "iconFillColor": Utils.kTravelIconFillColor,
    },
    {
      "listViewText1": "Education",
      "progressBarValue": 0.5,
      "listViewMoney1": 7900.00,
      "listViewMoney2": 12650.00,
      "iconFillColor": Utils.kEducationFillColor,
    },
    {
      "listViewText1": "Transport",
      "progressBarValue": 0.5,
      "listViewMoney1": 7900.00,
      "listViewMoney2": 12650.00,
      "iconFillColor": Utils.kTransportFillColor,
    }
  ];

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
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ListViewListItem(
                      listViewText1: _listViewDetails[index]["listViewText1"],
                      progressBarValue: _listViewDetails[index]
                          ["progressBarValue"],
                      listViewMoney1: _listViewDetails[index]["listViewMoney1"],
                      listViewMoney2: _listViewDetails[index]["listViewMoney2"],
                      iconFillColor: _listViewDetails[index]["iconFillColor"],
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: _listViewDetails.length),
            ))
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

class ListViewListItem extends StatelessWidget {
  const ListViewListItem({
    Key? key,
    required this.listViewText1,
    required this.progressBarValue,
    required this.listViewMoney1,
    required this.listViewMoney2,
    required this.iconFillColor,
  }) : super(key: key);

  final String listViewText1;
  final double progressBarValue;
  final double listViewMoney1;
  final double listViewMoney2;
  final Color iconFillColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 17.h,
            width: 12.h,
            child: CustomPaint(
              //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
              painter:
                  BookMarkIconPainter(bookmarkIconFillColor: iconFillColor),
            ),
          ),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                listViewText1,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500, fontSize: 14.h),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                  height: 10.h,
                  width: 75.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1),
                      border: Border.all(color: Colors.black)),
                  child: LinearProgressIndicator(
                    color: iconFillColor,
                    backgroundColor: Colors.white,
                    value: progressBarValue,
                  ),
                ),
                SizedBox(width: 15.w),
                Text(
                  "${(progressBarValue * 100).toInt()} %",
                  style: GoogleFonts.poppins(
                      fontSize: 9.h,
                      fontWeight: FontWeight.w500,
                      color: iconFillColor),
                )
              ]),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(listViewMoney1.toString(),
                  style: GoogleFonts.poppins(
                      fontSize: 14.h,
                      fontWeight: FontWeight.w500,
                      color: Utils.kListViewPrimaryTextColor)),
              Text(
                listViewMoney2.toString(),
                style: GoogleFonts.poppins(
                    fontSize: 12.h,
                    fontWeight: FontWeight.w500,
                    color: Utils.kListViewSecondaryTextColor),
              )
            ],
          )
        ],
      ),
    );
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
