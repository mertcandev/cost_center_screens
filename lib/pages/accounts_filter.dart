// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:cost_center_screens/utils.dart';

List<Map> _balanceDetails = [
  {"balanceText": "Balance", "balanceMoney": 1000000},
  {"balanceText": "BNP Paribas", "balanceMoney": 100000},
  {"balanceText": "QNB", "balanceMoney": 200000}
];

enum ExpenseIncomePick { expense, income }
enum BottomBarTimePick { d, w, m, y }

class AccountsFilter extends StatefulWidget {
  const AccountsFilter({Key? key}) : super(key: key);

  @override
  State<AccountsFilter> createState() => _AccountsFilter();
}

class _AccountsFilter extends State<AccountsFilter> {
  final String avatarImgPath = "assets/avatar.jpg";
  final String headerButtonText = "USD";


  final String accountFilterText1 = "Personal";
  final String accountFilterText2 = "Work";
  final String accountFilterText3 = "Family";
  final String accountFilterText4 = "My Project";
  
  bool notificationVisibility = true;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context) {
      return Scaffold(
        extendBody: false,
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
              padding: EdgeInsets.only(
                  left: 25.w, right: 25.w, top: 30.h, bottom: 10),
              child: SizedBox(
                width: 310.w,
                height: 20.h,
                child: Text(
                  "Multiple Selection",
                  textAlign: TextAlign.end,
                  style: GoogleFonts.poppins(
                      fontSize: 14.h,
                      color: Utils.kMultipleSelectionTextColor,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Expanded(
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _balanceDetails.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListDisplayListCard(
                          balanceText: _balanceDetails[index]["balanceText"],
                          balanceMoney: _balanceDetails[index]["balanceMoney"],
                        );
                      },
                    ),
                    Padding(
                        padding:
                            EdgeInsets.only(left: 25.w, right: 25.w, top: 10),
                        child: GestureDetector(
                          onTap: () {
                            _showModalBottomSheet(context);
                          },
                          child: Container(
                            width: 310.w,
                            height: 102.h,
                            decoration: BoxDecoration(
                                color: Utils.kBackgroundColor,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color: Utils.kAccountCardColor, width: 2)),
                            child: Center(
                                child: SizedBox(
                              height: 30,
                              width: 30,
                              child: CustomPaint(
                                painter: AddIconPainter(),
                              ),
                            )),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: SizedBox(
            height: 90,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 36, right: 36, top: 10, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 56,
                      width: 56,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Utils.kCircularBottomBarButtonColor),
                      child: const Center(
                        child: Icon(
                          Icons.reply_rounded,
                          color: Utils.kCircularBottomBarIconColor1,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 56,
                      width: 56,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Utils.kCircularBottomBarButtonColor),
                      child: const Center(
                        child: Icon(
                          Icons.border_color_rounded,
                          color: Utils.kCircularBottomBarIconColor2,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 56,
                      width: 56,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Utils.kCircularBottomBarButtonColor),
                      child: const Center(
                        child: Icon(
                          Icons.filter_alt_rounded,
                          color: Utils.kCircularBottomBarIconColor3,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 56,
                      width: 56,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Utils.kCircularBottomBarButtonColor),
                      child: Center(
                          child: SizedBox(
                        height: 22,
                        width: 22,
                        child: CustomPaint(
                          painter: MobileDataPainter(
                              iconColor: Utils.kCircularBottomBarIconColor4),
                        ),
                      )),
                    ),
                  ),
                ],
              ),
            )),
      );
    });
  }

  Future<dynamic> _showModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        useRootNavigator: true,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16))),
        context: context,
        builder: (context) {
          return Container(
            height: 444.h,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
                color: Utils.kModalSheetBackgroundColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(24),
                        child: Text(
                          "Select Category",
                          style: GoogleFonts.poppins(
                              fontSize: 24.h,
                              fontWeight: FontWeight.w600,
                              color: Utils.kModalSheetTextColor),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 24, left: 24, bottom: 16),
                        child: Container(
                          height: 36.h,
                          width: 327.w,
                          decoration: BoxDecoration(
                            color: Utils.kModalSheetSearchBarColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  child: Icon(Icons.search_rounded,
                                      color: Utils.kModalSheetSearchIconColor,
                                      size: 12.h),
                                ),
                                Text(
                                  "Search",
                                  style: GoogleFonts.inter(
                                      fontSize: 16.h,
                                      fontWeight: FontWeight.w400,
                                      color: Utils.kModalSheetSearchTextColor),
                                )
                              ]),
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 24, right: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 56,
                                  width: 310.w,
                                  child: Text(
                                    accountFilterText1,
                                    style: GoogleFonts.poppins(
                                        fontSize: 18.h,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                SizedBox(
                                  height: 56,
                                  width: 310.w,
                                  child: Text(
                                    accountFilterText2,
                                    style: GoogleFonts.poppins(
                                        fontSize: 18.h,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                SizedBox(
                                  width: 310.w,
                                  height: 56,
                                  child: Text(
                                    accountFilterText3,
                                    style: GoogleFonts.poppins(
                                        fontSize: 18.h,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                SizedBox(
                                  width: 310.w,
                                  height: 56,
                                  child: Text(
                                    accountFilterText4,
                                    style: GoogleFonts.poppins(
                                        fontSize: 18.h,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
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

class ListDisplayListCard extends StatelessWidget {
  final String balanceText;
  final int balanceMoney;
  const ListDisplayListCard({
    Key? key,
    required this.balanceText,
    required this.balanceMoney,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 10.h),
      child: Container(
          height: 181.h,
          width: 310.w,
          decoration: BoxDecoration(
              color: Utils.kAccountCardColor,
              borderRadius: BorderRadius.circular(16)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 33,
                    left: 26,
                    bottom: MediaQuery.of(context).size.height * 0.0125),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.075,
                      width: MediaQuery.of(context).size.height * 0.075,
                      child: CustomPaint(
                        //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                        painter: AccountLogoPainter(),
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.0175),
                    Text(
                      balanceText,
                      style: GoogleFonts.poppins(
                          fontSize: 18.h,
                          fontWeight: FontWeight.w700,
                          color: Utils.kAccountCardTextColor),
                    ),
                    Text(
                      "$balanceMoney USD",
                      style: GoogleFonts.poppins(
                          fontSize: 15.h,
                          fontWeight: FontWeight.w500,
                          color: Utils.kAccountCardTextColor),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 12.w, bottom: 11.h),
                child: Column(
                  children: [
                    Expanded(flex: 1, child: SizedBox(height: 20.h)),
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: 32.w,
                        width: 32.w,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                Utils.kAccountCardTextColor.withOpacity(0.15)),
                        child: Center(
                          child: Icon(
                            Icons.menu,
                            color: Utils.kAccountCardTextColor,
                            size: 18.h,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: 20,
                        child: Center(
                            child: Row(
                          children: [
                            Text("Today",
                                style: GoogleFonts.inter(
                                    fontSize: 12.h,
                                    fontWeight: FontWeight.w500,
                                    color: Utils.kAccountCardTextColor)),
                            Padding(
                              padding: const EdgeInsets.only(left: 18),
                              child: CustomPaint(
                                size: Size(15.w, 13.h),
                                painter: BagIconPainter(),
                              ),
                            )
                          ],
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
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

class AddIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.5574581, size.height * 0.1111110);
    path_0.cubicTo(
        size.width * 0.5574581,
        size.height * 0.07889433,
        size.width * 0.5317355,
        size.height * 0.05277767,
        size.width * 0.5000000,
        size.height * 0.05277767);
    path_0.cubicTo(
        size.width * 0.4682645,
        size.height * 0.05277767,
        size.width * 0.4425419,
        size.height * 0.07889433,
        size.width * 0.4425419,
        size.height * 0.1111110);
    path_0.lineTo(size.width * 0.4425419, size.height * 0.4416667);
    path_0.lineTo(size.width * 0.1169355, size.height * 0.4416667);
    path_0.cubicTo(
        size.width * 0.08520129,
        size.height * 0.4416667,
        size.width * 0.05947581,
        size.height * 0.4677833,
        size.width * 0.05947581,
        size.height * 0.5000000);
    path_0.cubicTo(
        size.width * 0.05947581,
        size.height * 0.5322167,
        size.width * 0.08520129,
        size.height * 0.5583333,
        size.width * 0.1169355,
        size.height * 0.5583333);
    path_0.lineTo(size.width * 0.4425419, size.height * 0.5583333);
    path_0.lineTo(size.width * 0.4425419, size.height * 0.8888900);
    path_0.cubicTo(
        size.width * 0.4425419,
        size.height * 0.9211067,
        size.width * 0.4682645,
        size.height * 0.9472233,
        size.width * 0.5000000,
        size.height * 0.9472233);
    path_0.cubicTo(
        size.width * 0.5317355,
        size.height * 0.9472233,
        size.width * 0.5574581,
        size.height * 0.9211067,
        size.width * 0.5574581,
        size.height * 0.8888900);
    path_0.lineTo(size.width * 0.5574581, size.height * 0.5583333);
    path_0.lineTo(size.width * 0.8830645, size.height * 0.5583333);
    path_0.cubicTo(
        size.width * 0.9148000,
        size.height * 0.5583333,
        size.width * 0.9405226,
        size.height * 0.5322167,
        size.width * 0.9405226,
        size.height * 0.5000000);
    path_0.cubicTo(
        size.width * 0.9405226,
        size.height * 0.4677833,
        size.width * 0.9148000,
        size.height * 0.4416667,
        size.width * 0.8830645,
        size.height * 0.4416667);
    path_0.lineTo(size.width * 0.5574581, size.height * 0.4416667);
    path_0.lineTo(size.width * 0.5574581, size.height * 0.1111110);
    path_0.close();

    Paint paint0Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.09677419;
    paint0Stroke.color = const Color(0xff4478DE).withOpacity(1.0);
    paint0Stroke.strokeCap = StrokeCap.round;
    canvas.drawPath(path_0, paint0Stroke);

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xff4478DE).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class MobileDataPainter extends CustomPainter {
  Color iconColor;
  MobileDataPainter({
    required this.iconColor,
  });
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.5952556, size.height * 0.2629727);
    path_0.cubicTo(
        size.width * 0.6142389,
        size.height * 0.2785045,
        size.width * 0.6450167,
        size.height * 0.2785045,
        size.width * 0.6640056,
        size.height * 0.2629727);
    path_0.lineTo(size.width * 0.7106500, size.height * 0.2248082);
    path_0.lineTo(size.width * 0.7106500, size.height * 0.7651500);
    path_0.cubicTo(
        size.width * 0.7106500,
        size.height * 0.7871182,
        size.width * 0.7324111,
        size.height * 0.8049227,
        size.width * 0.7592611,
        size.height * 0.8049227);
    path_0.cubicTo(
        size.width * 0.7861056,
        size.height * 0.8049227,
        size.width * 0.8078722,
        size.height * 0.7871182,
        size.width * 0.8078722,
        size.height * 0.7651500);
    path_0.lineTo(size.width * 0.8078722, size.height * 0.2248082);
    path_0.lineTo(size.width * 0.8545167, size.height * 0.2629727);
    path_0.cubicTo(
        size.width * 0.8735000,
        size.height * 0.2785045,
        size.width * 0.9042778,
        size.height * 0.2785045,
        size.width * 0.9232611,
        size.height * 0.2629727);
    path_0.cubicTo(
        size.width * 0.9422444,
        size.height * 0.2474405,
        size.width * 0.9422444,
        size.height * 0.2222577,
        size.width * 0.9232611,
        size.height * 0.2067255);
    path_0.lineTo(size.width * 0.7936333, size.height * 0.1006650);
    path_0.cubicTo(
        size.width * 0.7746500,
        size.height * 0.08513273,
        size.width * 0.7438722,
        size.height * 0.08513273,
        size.width * 0.7248833,
        size.height * 0.1006650);
    path_0.lineTo(size.width * 0.5952556, size.height * 0.2067255);
    path_0.cubicTo(
        size.width * 0.5762722,
        size.height * 0.2222577,
        size.width * 0.5762722,
        size.height * 0.2474405,
        size.width * 0.5952556,
        size.height * 0.2629727);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = iconColor;
    canvas.drawPath(path_0, paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.2893517, size.height * 0.7751909);
    path_1.lineTo(size.width * 0.3359972, size.height * 0.7370273);
    path_1.cubicTo(
        size.width * 0.3549811,
        size.height * 0.7214955,
        size.width * 0.3857600,
        size.height * 0.7214955,
        size.width * 0.4047439,
        size.height * 0.7370273);
    path_1.cubicTo(
        size.width * 0.4237272,
        size.height * 0.7525591,
        size.width * 0.4237272,
        size.height * 0.7777455,
        size.width * 0.4047439,
        size.height * 0.7932773);
    path_1.lineTo(size.width * 0.2751139, size.height * 0.8993364);
    path_1.cubicTo(
        size.width * 0.2561300,
        size.height * 0.9148682,
        size.width * 0.2253511,
        size.height * 0.9148682,
        size.width * 0.2063672,
        size.height * 0.8993364);
    path_1.lineTo(size.width * 0.07673778, size.height * 0.7932773);
    path_1.cubicTo(
        size.width * 0.05775389,
        size.height * 0.7777455,
        size.width * 0.05775389,
        size.height * 0.7525591,
        size.width * 0.07673778,
        size.height * 0.7370273);
    path_1.cubicTo(
        size.width * 0.09572167,
        size.height * 0.7214955,
        size.width * 0.1265006,
        size.height * 0.7214955,
        size.width * 0.1454844,
        size.height * 0.7370273);
    path_1.lineTo(size.width * 0.1921294, size.height * 0.7751909);
    path_1.lineTo(size.width * 0.1921294, size.height * 0.2348491);
    path_1.cubicTo(
        size.width * 0.1921294,
        size.height * 0.2128832,
        size.width * 0.2138933,
        size.height * 0.1950764,
        size.width * 0.2407406,
        size.height * 0.1950764);
    path_1.cubicTo(
        size.width * 0.2675878,
        size.height * 0.1950764,
        size.width * 0.2893517,
        size.height * 0.2128832,
        size.width * 0.2893517,
        size.height * 0.2348491);
    path_1.lineTo(size.width * 0.2893517, size.height * 0.7751909);
    path_1.close();

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = iconColor;
    canvas.drawPath(path_1, paint1Fill);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.5952556, size.height * 0.2629727);
    path_2.cubicTo(
        size.width * 0.6142389,
        size.height * 0.2785045,
        size.width * 0.6450167,
        size.height * 0.2785045,
        size.width * 0.6640056,
        size.height * 0.2629727);
    path_2.lineTo(size.width * 0.7106500, size.height * 0.2248082);
    path_2.lineTo(size.width * 0.7106500, size.height * 0.7651500);
    path_2.cubicTo(
        size.width * 0.7106500,
        size.height * 0.7871182,
        size.width * 0.7324111,
        size.height * 0.8049227,
        size.width * 0.7592611,
        size.height * 0.8049227);
    path_2.cubicTo(
        size.width * 0.7861056,
        size.height * 0.8049227,
        size.width * 0.8078722,
        size.height * 0.7871182,
        size.width * 0.8078722,
        size.height * 0.7651500);
    path_2.lineTo(size.width * 0.8078722, size.height * 0.2248082);
    path_2.lineTo(size.width * 0.8545167, size.height * 0.2629727);
    path_2.cubicTo(
        size.width * 0.8735000,
        size.height * 0.2785045,
        size.width * 0.9042778,
        size.height * 0.2785045,
        size.width * 0.9232611,
        size.height * 0.2629727);
    path_2.cubicTo(
        size.width * 0.9422444,
        size.height * 0.2474405,
        size.width * 0.9422444,
        size.height * 0.2222577,
        size.width * 0.9232611,
        size.height * 0.2067255);
    path_2.lineTo(size.width * 0.7936333, size.height * 0.1006650);
    path_2.cubicTo(
        size.width * 0.7746500,
        size.height * 0.08513273,
        size.width * 0.7438722,
        size.height * 0.08513273,
        size.width * 0.7248833,
        size.height * 0.1006650);
    path_2.lineTo(size.width * 0.5952556, size.height * 0.2067255);
    path_2.cubicTo(
        size.width * 0.5762722,
        size.height * 0.2222577,
        size.width * 0.5762722,
        size.height * 0.2474405,
        size.width * 0.5952556,
        size.height * 0.2629727);
    path_2.close();

    Paint paint2Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.1111111;
    paint2Stroke.color = const Color(0xff23C16B).withOpacity(1.0);
    paint2Stroke.strokeCap = StrokeCap.round;
    canvas.drawPath(path_2, paint2Stroke);

    Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = const Color(0xff23C16B).withOpacity(1.0);
    canvas.drawPath(path_2, paint2Fill);

    Path path_3 = Path();
    path_3.moveTo(size.width * 0.2893517, size.height * 0.7751909);
    path_3.lineTo(size.width * 0.3359972, size.height * 0.7370273);
    path_3.cubicTo(
        size.width * 0.3549811,
        size.height * 0.7214955,
        size.width * 0.3857600,
        size.height * 0.7214955,
        size.width * 0.4047439,
        size.height * 0.7370273);
    path_3.cubicTo(
        size.width * 0.4237272,
        size.height * 0.7525591,
        size.width * 0.4237272,
        size.height * 0.7777455,
        size.width * 0.4047439,
        size.height * 0.7932773);
    path_3.lineTo(size.width * 0.2751139, size.height * 0.8993364);
    path_3.cubicTo(
        size.width * 0.2561300,
        size.height * 0.9148682,
        size.width * 0.2253511,
        size.height * 0.9148682,
        size.width * 0.2063672,
        size.height * 0.8993364);
    path_3.lineTo(size.width * 0.07673778, size.height * 0.7932773);
    path_3.cubicTo(
        size.width * 0.05775389,
        size.height * 0.7777455,
        size.width * 0.05775389,
        size.height * 0.7525591,
        size.width * 0.07673778,
        size.height * 0.7370273);
    path_3.cubicTo(
        size.width * 0.09572167,
        size.height * 0.7214955,
        size.width * 0.1265006,
        size.height * 0.7214955,
        size.width * 0.1454844,
        size.height * 0.7370273);
    path_3.lineTo(size.width * 0.1921294, size.height * 0.7751909);
    path_3.lineTo(size.width * 0.1921294, size.height * 0.2348491);
    path_3.cubicTo(
        size.width * 0.1921294,
        size.height * 0.2128832,
        size.width * 0.2138933,
        size.height * 0.1950764,
        size.width * 0.2407406,
        size.height * 0.1950764);
    path_3.cubicTo(
        size.width * 0.2675878,
        size.height * 0.1950764,
        size.width * 0.2893517,
        size.height * 0.2128832,
        size.width * 0.2893517,
        size.height * 0.2348491);
    path_3.lineTo(size.width * 0.2893517, size.height * 0.7751909);
    path_3.close();

    Paint paint3Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.1111111;
    paint3Stroke.color = const Color(0xff23C16B).withOpacity(1.0);
    paint3Stroke.strokeCap = StrokeCap.round;
    canvas.drawPath(path_3, paint3Stroke);

    Paint paint3Fill = Paint()..style = PaintingStyle.fill;
    paint3Fill.color = const Color(0xff23C16B).withOpacity(1.0);
    canvas.drawPath(path_3, paint3Fill);
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
    path_0.moveTo(3.952, 0.763381);
    path_0.cubicTo(3.952, 0.477224, 3.69412, 0.245247, 3.376, 0.245247);
    path_0.cubicTo(3.05788, 0.245247, 2.8, 0.477224, 2.8, 0.763381);
    path_0.lineTo(2.8, 2.01825);
    path_0.cubicTo(1.65332, 2.16408, 0.747424, 2.97993, 0.594072, 4.02061);
    path_0.lineTo(0.527601, 4.4717);
    path_0.cubicTo(0.516331, 4.54818, 0.505555, 4.6247, 0.495272, 4.70126);
    path_0.cubicTo(0.467996, 4.90435, 0.645869, 5.08117, 0.873278, 5.08117);
    path_0.lineTo(13.5587, 5.08117);
    path_0.cubicTo(13.7861, 5.08117, 13.964, 4.90435, 13.9367, 4.70126);
    path_0.cubicTo(13.9264, 4.6247, 13.9156, 4.54818, 13.9044, 4.4717);
    path_0.lineTo(13.8379, 4.02061);
    path_0.cubicTo(13.6845, 2.97994, 12.7787, 2.1641, 11.632, 2.01826);
    path_0.lineTo(11.632, 0.763381);
    path_0.cubicTo(11.632, 0.477224, 11.3741, 0.245247, 11.056, 0.245247);
    path_0.cubicTo(10.7379, 0.245247, 10.48, 0.477224, 10.48, 0.763381);
    path_0.lineTo(10.48, 1.91546);
    path_0.cubicTo(8.3083, 1.74148, 6.1237, 1.74148, 3.952, 1.91546);
    path_0.lineTo(3.952, 0.763381);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(14.0854, 6.44597);
    path_1.cubicTo(14.0787, 6.26191, 13.9096, 6.11744, 13.7049, 6.11744);
    path_1.lineTo(0.727064, 6.11744);
    path_1.cubicTo(0.522337, 6.11744, 0.35325, 6.26191, 0.346527, 6.44597);
    path_1.cubicTo(0.300908, 7.69479, 0.385236, 8.94616, 0.599304, 10.1837);
    path_1.cubicTo(0.761359, 11.1205, 1.60743, 11.84, 2.65632, 11.9331);
    path_1.lineTo(3.57255, 12.0144);
    path_1.cubicTo(5.99562, 12.2293, 8.43633, 12.2293, 10.8594, 12.0144);
    path_1.lineTo(11.7756, 11.9331);
    path_1.cubicTo(12.8245, 11.84, 13.6706, 11.1205, 13.8326, 10.1837);
    path_1.cubicTo(14.0467, 8.94616, 14.131, 7.69479, 14.0854, 6.44597);
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
