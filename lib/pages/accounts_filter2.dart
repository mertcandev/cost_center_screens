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


enum PurposePick { cost, profit, generic }

class AccountsFilter2 extends StatefulWidget {
  const AccountsFilter2({Key? key}) : super(key: key);

  @override
  State<AccountsFilter2> createState() => _AccountsFilter2();
}

class _AccountsFilter2 extends State<AccountsFilter2> {
  final String avatarImgPath = "assets/avatar.jpg";
  final String headerButtonText = "USD";

  final double progressBarValue = 0.5;

  final String accountFilterText1 = "Personal";
  final String accountFilterText2 = "Work";
  final String accountFilterText3 = "Family";
  final String accountFilterText4 = "My Project";

  PurposePick _selectedPurpose = PurposePick.cost;
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
        isScrollControlled: true,
        useRootNavigator: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16))),
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return Container(
              height: 640.h,
              width: 360.w,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
                  color: Utils.kModalSheetBackgroundColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 24.h, bottom: 16.h),
                    child: SizedBox(
                      height: 44.h,
                      width: 360.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 18.w, top: 10.h, bottom: 10.h),
                              child: SizedBox(
                                height: 24.h,
                                width: 24.w,
                                child: Center(
                                    child: Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  size: 12.h,
                                )),
                              ),
                            ),
                          ),
                          Text("Edit Center",
                              style: GoogleFonts.poppins(
                                  fontSize: 18.h,
                                  color: Utils.kModalSheetTextColor,
                                  fontWeight: FontWeight.w400)),
                          Padding(
                            padding: EdgeInsets.only(right: 18.w),
                            child: SizedBox(height: 24.h, width: 24.w),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 56.h,
                    width: 56.w,
                    decoration: const BoxDecoration(
                        color: Utils.kAccountFilterEditModalSheetIconColor,
                        shape: BoxShape.circle),
                    child: Center(
                      child: Icon(
                        Icons.border_color_rounded,
                        size: 20.h,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16.h, left: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Center Name",
                          style: GoogleFonts.poppins(
                              fontSize: 12.h,
                              fontWeight: FontWeight.w400,
                              color:
                                  Utils.kAccountFilterEditModalSheetTextColor),
                        ),
                        SizedBox(height: 6.h),
                        Padding(
                          padding: EdgeInsets.only(bottom: 38.h),
                          child: Container(
                            width: 313.w,
                            height: 48.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: Utils
                                        .kAccountFilterEditModalSheetTextFieldColor)),
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 15.w,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Personal",
                                    style: GoogleFonts.poppins(
                                        fontSize: 16.h,
                                        fontWeight: FontWeight.w400,
                                        color: Utils
                                            .kAccountFilterEditModalSheetTextFieldTextColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "Select Center Purpose",
                          style: GoogleFonts.poppins(
                              fontSize: 12.h,
                              fontWeight: FontWeight.w400,
                              color:
                                  Utils.kAccountFilterEditModalSheetTextColor),
                        ),
                        SizedBox(height: 18.h),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedPurpose = PurposePick.cost;
                                });
                              },
                              child: Row(
                                children: [
                                  AnimatedContainer(
                                    duration: const Duration(milliseconds: 500),
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: const Color(0xff5BEFBD)
                                          .withOpacity(0.5),
                                    ),
                                    child: Visibility(
                                        visible:
                                            _selectedPurpose == PurposePick.cost
                                                ? true
                                                : false,
                                        child: Center(
                                          child: Container(
                                            height: 16,
                                            width: 16,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xff5BEFBD),
                                            ),
                                            child: Center(
                                              child: Container(
                                                height: 7,
                                                width: 7,
                                                decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        )),
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    "Cost Center",
                                    style: GoogleFonts.poppins(
                                        fontSize: 16.h,
                                        fontWeight: FontWeight.w500,
                                        color: Utils
                                            .kAccountFilterEditCheckBoxTextColor),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 21),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedPurpose = PurposePick.profit;
                                });
                              },
                              child: Row(
                                children: [
                                  AnimatedContainer(
                                    duration: const Duration(milliseconds: 500),
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: const Color(0xff5BEFBD)
                                          .withOpacity(0.5),
                                    ),
                                    child: Visibility(
                                        visible: _selectedPurpose ==
                                                PurposePick.profit
                                            ? true
                                            : false,
                                        child: Center(
                                          child: Container(
                                            height: 16,
                                            width: 16,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xff5BEFBD),
                                            ),
                                            child: Center(
                                              child: Container(
                                                height: 7,
                                                width: 7,
                                                decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        )),
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    "Profit Center",
                                    style: GoogleFonts.poppins(
                                        fontSize: 16.h,
                                        fontWeight: FontWeight.w500,
                                        color: Utils
                                            .kAccountFilterEditCheckBoxTextColor),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 21),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedPurpose = PurposePick.generic;
                                });
                              },
                              child: Row(
                                children: [
                                  AnimatedContainer(
                                    duration: const Duration(milliseconds: 500),
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: const Color(0xff5BEFBD)
                                          .withOpacity(0.5),
                                    ),
                                    child: Visibility(
                                        visible: _selectedPurpose ==
                                                PurposePick.generic
                                            ? true
                                            : false,
                                        child: Center(
                                          child: Container(
                                            height: 16,
                                            width: 16,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xff5BEFBD),
                                            ),
                                            child: Center(
                                              child: Container(
                                                height: 7,
                                                width: 7,
                                                decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        )),
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    "Generic",
                                    style: GoogleFonts.poppins(
                                        fontSize: 16.h,
                                        fontWeight: FontWeight.w500,
                                        color: Utils
                                            .kAccountFilterEditCheckBoxTextColor),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.only(bottom: 35.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 56.h,
                              width: 56.w,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Utils.kCircularButtonBorderColor),
                                  shape: BoxShape.circle,
                                  color: Utils.kDeleteButtonColor),
                              child: Center(
                                child: CustomPaint(
                                  size: Size(20.w, 24.h),
                                  painter: DeleteIconPainter(),
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              "Delete",
                              style: GoogleFonts.poppins(
                                  fontSize: 12.h,
                                  fontWeight: FontWeight.w500,
                                  color: Utils.kModalSheetTextColor),
                            )
                          ],
                        ),
                        SizedBox(width: 50.w),
                        Column(
                          children: [
                            Container(
                              height: 56.h,
                              width: 56.w,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Utils.kCircularButtonBorderColor),
                                  shape: BoxShape.circle,
                                  color: Utils.kSaveButtonColor),
                              child: Center(
                                child: CustomPaint(
                                  size: const Size(23, 17),
                                  painter: SaveIconPainter(),
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              "Save",
                              style: GoogleFonts.poppins(
                                  fontSize: 12.h,
                                  fontWeight: FontWeight.w500,
                                  color: Utils.kModalSheetTextColor),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          });
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

class DeleteIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(6.79171, 1.5);
    path_0.cubicTo(6.79171, 1.01675, 7.18346, 0.625, 7.66671, 0.625);
    path_0.lineTo(12.3334, 0.625);
    path_0.cubicTo(12.8166, 0.625, 13.2084, 1.01675, 13.2084, 1.5);
    path_0.lineTo(13.2084, 2.375);
    path_0.lineTo(18.1667, 2.375);
    path_0.cubicTo(18.65, 2.375, 19.0417, 2.76675, 19.0417, 3.25);
    path_0.cubicTo(19.0417, 3.73325, 18.65, 4.125, 18.1667, 4.125);
    path_0.lineTo(1.83337, 4.125);
    path_0.cubicTo(1.35012, 4.125, 0.958374, 3.73325, 0.958374, 3.25);
    path_0.cubicTo(0.958374, 2.76675, 1.35012, 2.375, 1.83337, 2.375);
    path_0.lineTo(6.79171, 2.375);
    path_0.lineTo(6.79171, 1.5);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(3.27992, 7.26891);
    path_1.cubicTo(3.31274, 6.9735, 3.56245, 6.75, 3.85969, 6.75);
    path_1.lineTo(16.1404, 6.75);
    path_1.cubicTo(16.4376, 6.75, 16.6873, 6.9735, 16.7202, 7.26891);
    path_1.lineTo(16.9537, 9.37049);
    path_1.cubicTo(17.3746, 13.1586, 17.3746, 16.9817, 16.9537, 20.7699);
    path_1.lineTo(16.9307, 20.9768);
    path_1.cubicTo(16.7774, 22.3564, 15.7081, 23.4566, 14.3333, 23.649);
    path_1.cubicTo(11.4585, 24.0515, 8.54159, 24.0515, 5.66674, 23.649);
    path_1.cubicTo(4.29198, 23.4566, 3.2227, 22.3564, 3.0694, 20.9768);
    path_1.lineTo(3.04641, 20.7699);
    path_1.cubicTo(2.62551, 16.9817, 2.62551, 13.1586, 3.04641, 9.37048);
    path_1.lineTo(3.27992, 7.26891);
    path_1.close();
    path_1.moveTo(8.54171, 11.3);
    path_1.cubicTo(8.54171, 10.8167, 8.14996, 10.425, 7.66671, 10.425);
    path_1.cubicTo(7.18346, 10.425, 6.79171, 10.8167, 6.79171, 11.3);
    path_1.lineTo(6.79171, 19.4667);
    path_1.cubicTo(6.79171, 19.9499, 7.18346, 20.3417, 7.66671, 20.3417);
    path_1.cubicTo(8.14996, 20.3417, 8.54171, 19.9499, 8.54171, 19.4667);
    path_1.lineTo(8.54171, 11.3);
    path_1.close();
    path_1.moveTo(13.2084, 11.3);
    path_1.cubicTo(13.2084, 10.8167, 12.8166, 10.425, 12.3334, 10.425);
    path_1.cubicTo(11.8501, 10.425, 11.4584, 10.8167, 11.4584, 11.3);
    path_1.lineTo(11.4584, 19.4667);
    path_1.cubicTo(11.4584, 19.9499, 11.8501, 20.3417, 12.3334, 20.3417);
    path_1.cubicTo(12.8166, 20.3417, 13.2084, 19.9499, 13.2084, 19.4667);
    path_1.lineTo(13.2084, 11.3);
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

class SaveIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(20.2942, 2.62245);
    path_0.cubicTo(20.7213, 3.04958, 20.7213, 3.74211, 20.2942, 4.16924);
    path_0.lineTo(10.0859, 14.3776);
    path_0.cubicTo(9.65872, 14.8047, 8.9662, 14.8047, 8.53906, 14.3776);
    path_0.lineTo(2.70573, 8.54424);
    path_0.cubicTo(2.27859, 8.11711, 2.27859, 7.42458, 2.70573, 6.99745);
    path_0.cubicTo(3.13286, 6.57031, 3.82539, 6.57031, 4.25252, 6.99745);
    path_0.lineTo(9.31246, 12.0574);
    path_0.lineTo(18.7474, 2.62245);
    path_0.cubicTo(19.1745, 2.19531, 19.8671, 2.19531, 20.2942, 2.62245);
    path_0.close();

    Paint paint0Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.1739130;
    paint0Stroke.color = Colors.white.withOpacity(1.0);
    paint0Stroke.strokeCap = StrokeCap.round;
    paint0Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_0, paint0Stroke);

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Colors.white.withOpacity(1.0);
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
