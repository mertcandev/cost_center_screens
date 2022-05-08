// ignore_for_file: unused_field

import 'package:cost_center_screens/pages/by_category_list_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';

import 'package:cost_center_screens/utils.dart';

enum ExpenseIncomePick { expense, income }
enum BottomBarTimePick { d, w, m, y }

List<Map> listViewListItemsDetails = [];
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
    "listViewText1": "Personel",
    "progressBarValue": 0.5,
    "listViewMoney1": 7900.00,
    "listViewMoney2": 12650.00,
    "iconFillColor": Utils.kPersonelIconFillColor,
    "iconFillAccentColor": Utils.kPersonelIconFillAccentColor,
    "indicatorFillColor": Utils.kPersonelIconFillAccentColor
  },
  {
    "listViewText1": "Work",
    "progressBarValue": 0.5,
    "listViewMoney1": 7900.00,
    "listViewMoney2": 12650.00,
    "iconFillColor": Utils.kWorkIconFillColor,
    "iconFillAccentColor": Utils.kWorkIconFillAccentColor,
    "indicatorFillColor": Utils.kWorkIconFillAccentColor
  },
  {
    "listViewText1": "Family",
    "progressBarValue": 0.5,
    "listViewMoney1": 7900.00,
    "listViewMoney2": 12650.00,
    "iconFillColor": Utils.kFamilyIconFillColor,
    "iconFillAccentColor": Utils.kFamilyIconFillAccentColor,
    "indicatorFillColor": Utils.kFamilyIconFillAccentColor
  },
  {
    "listViewText1": "My Project",
    "progressBarValue": 0.5,
    "listViewMoney1": 7900.00,
    "listViewMoney2": 12650.00,
    "iconFillColor": Utils.kMyProjectIconFillColor,
    "iconFillAccentColor": Utils.kMyProjectIconFillAccentColor,
    "indicatorFillColor": Utils.kMyProjectIconFillAccentColor
  }
];

class ListDisplay extends StatefulWidget {
  const ListDisplay({Key? key}) : super(key: key);

  @override
  State<ListDisplay> createState() => _ListDisplayState();
}

class _ListDisplayState extends State<ListDisplay> {
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
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ByCategoryListDisplay()));
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
                    onTap: () {},
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
                      iconFillAccentColor: _listViewDetails[index]
                          ["iconFillAccentColor"],
                      indicatorFillColor: _listViewDetails[index]
                          ["indicatorFillColor"],
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: _listViewDetails.length),
            ))
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
  const ListViewListItem(
      {Key? key,
      required this.listViewText1,
      required this.progressBarValue,
      required this.listViewMoney1,
      required this.listViewMoney2,
      required this.iconFillColor,
      required this.iconFillAccentColor,
      required this.indicatorFillColor})
      : super(key: key);

  final String listViewText1;
  final double progressBarValue;
  final double listViewMoney1;
  final double listViewMoney2;
  final Color iconFillColor;
  final Color iconFillAccentColor;
  final Color indicatorFillColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30.w, right: 30.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 15.h,
            width: 20.h,
            child: CustomPaint(
              //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
              painter: FolderIconPainter(
                iconFillAccentColor: iconFillAccentColor,
                iconFillColor: iconFillColor,
              ),
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
                    color: indicatorFillColor,
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
                      color: indicatorFillColor),
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

class FolderIconPainter extends CustomPainter {
  Color iconFillColor;
  Color iconFillAccentColor;
  FolderIconPainter(
      {required this.iconFillColor, required this.iconFillAccentColor});
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
    paint0Fill.color = iconFillAccentColor;
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
    paint4Fill.color = iconFillAccentColor;
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
