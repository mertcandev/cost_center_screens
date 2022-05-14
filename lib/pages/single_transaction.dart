// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:cost_center_screens/utils.dart';

class SingleTransactionDisplay extends StatefulWidget {
  const SingleTransactionDisplay({Key? key}) : super(key: key);

  @override
  State<SingleTransactionDisplay> createState() => _SingleTransactionDisplay();
}

class _SingleTransactionDisplay extends State<SingleTransactionDisplay> {
  final dateText = "15 Mar 22";
  final moneyText = "1118,75";
  final logoPath = "assets/deliveroo_logo.png";
  final descriptionText =
      "Team lunch at la defense bistro, business area. Paris 92060, Team lunch at la defense bistro, business area. Paris 92060";

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
        backgroundColor: Utils.kBackgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: 55.h, left: 24.w, right: 24.w, bottom: 25.h),
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
                  Text("Transaction",
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
              padding: EdgeInsets.only(bottom: 30.h),
              child: Container(
                height: 56.h,
                width: 56.w,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Utils.kTransactionLogoColor),
                child: Center(
                  child: CustomPaint(
                    size: Size(17.w, 16.h),
                    painter: TransactionIconPainter(),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 18.h),
              child: Text(
                dateText,
                style: GoogleFonts.poppins(
                    fontSize: 14.h,
                    color: Utils.kSingleTransactionDateColor,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 23.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 32.h,
                    width: 66.w,
                  ),
                  Text(
                    moneyText,
                    style: GoogleFonts.poppins(
                        fontSize: 24.h,
                        fontWeight: FontWeight.w700,
                        color: Utils.kSingleTransactionMoneyColor),
                  ),
                  Container(
                    height: 32.h,
                    width: 66.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(48.sp),
                        color: Utils.kHeaderCurrencyButtonColor),
                    child: Center(
                      child: Text(
                        "USD",
                        style: GoogleFonts.poppins(
                            fontSize: 16.h,
                            fontWeight: FontWeight.w700,
                            color: Utils.kHeaderCurrencyButtonTextColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 28.w, right: 28.w, bottom: 11.h),
              child: SizedBox(
                height: 131.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Image(
                          image: AssetImage(logoPath),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            CustomPaint(
                              size: Size(9.w, 13.h),
                              painter: AttachIconPainter(),
                            ),
                            SizedBox(width: 13.w),
                            CustomPaint(
                              size: Size(11.w, 14.h),
                              painter: LocationIconPainter(),
                            )
                          ],
                        ),
                        SizedBox(
                            width: 35.w,
                            child: Divider(
                              color: Utils.kSingleTransactionDividerColor,
                            ))
                      ],
                    ),
                    Container(
                      height: 131.h,
                      width: 219.w,
                      decoration: BoxDecoration(
                          color: Utils.kSingleTransactionDescriptionBoxColor,
                          borderRadius: BorderRadius.circular(10.sp)),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 12.h, bottom: 12, left: 24.w, right: 24.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Description",
                              style: GoogleFonts.poppins(
                                  fontSize: 12.h,
                                  fontWeight: FontWeight.w600,
                                  color: Utils
                                      .kSingleTransactionDescriptionTitleColor),
                            ),
                            SizedBox(height: 16.h),
                            Text(
                              descriptionText,
                              style: GoogleFonts.poppins(
                                  fontSize: 14.h,
                                  fontWeight: FontWeight.w500,
                                  color: Utils
                                      .kSingleTransactionDescriptionTextColor),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 11.h),
              child: Container(
                height: 58.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Utils.kSingleTransactionCreditCardButtonColor,
                    borderRadius: BorderRadius.circular(6.sp)),
                child: Center(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 40.h,
                          width: 40.w,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: Center(
                            child: CustomPaint(
                              size: Size(24.w, 24.h),
                              painter: CreditCardIconPainter(),
                            ),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Text(
                          "Credit Card",
                          style: GoogleFonts.poppins(
                              fontSize: 12.h,
                              fontWeight: FontWeight.w700,
                              color: Utils
                                  .kSingleTransactionCreditCardButtonTextColor),
                        )
                      ]),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.w, right: 30.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 50.h,
                        width: 65.5.w,
                        decoration: BoxDecoration(
                            color: Utils.kSingleTransactionButtonColor,
                            borderRadius: BorderRadius.circular(6.sp)),
                        child: Center(
                          child: Icon(
                            Icons.folder_rounded,
                            color: Colors.white,
                            size: 23.h,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "Business",
                        style: GoogleFonts.poppins(
                            fontSize: 10.h,
                            fontWeight: FontWeight.w700,
                            color: Utils.kSingleTransactionButtonTextColor),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 50.h,
                        width: 65.5.w,
                        decoration: BoxDecoration(
                            color: Utils.kSingleTransactionButtonColor,
                            borderRadius: BorderRadius.circular(6.sp)),
                        child: Center(
                            child: CustomPaint(
                          size: Size(15.w, 20.h),
                          painter: FoodIconPainter(),
                        )),
                      ),
                      SizedBox(height: 10.w),
                      Text(
                        "Food",
                        style: GoogleFonts.poppins(
                            fontSize: 10.h,
                            fontWeight: FontWeight.w700,
                            color: Utils.kSingleTransactionButtonTextColor),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 50.h,
                        width: 65.5.w,
                        decoration: BoxDecoration(
                            color: Utils.kSingleTransactionButtonColor,
                            borderRadius: BorderRadius.circular(6.sp)),
                        child: Center(
                            child: CustomPaint(
                          size: Size(16.w, 20.h),
                          painter: EatOutIconPainter(),
                        )),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "Eat Out",
                        style: GoogleFonts.poppins(
                            fontSize: 10.h,
                            fontWeight: FontWeight.w700,
                            color: Utils.kSingleTransactionButtonTextColor),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 50.h,
                        width: 65.5.w,
                        decoration: BoxDecoration(
                            color: Utils.kSingleTransactionButtonColor,
                            borderRadius: BorderRadius.circular(6.sp)),
                        child: Center(
                            child: Image.asset("assets/deliveroo_icon.png")),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "Deliveroo",
                        style: GoogleFonts.poppins(
                            fontSize: 10.h,
                            fontWeight: FontWeight.w700,
                            color: Utils.kSingleTransactionButtonTextColor),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(left: 23.w, right: 23.w, bottom: 20.h),
          child: SizedBox(
            width: 330.w,
            height: 77.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 46.h,
                      width: 46.w,
                      decoration: BoxDecoration(
                          color:
                              Utils.kSingleTransactionBottomBarEditButtonColor,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Utils.kCircularButtonBorderColor,
                          )),
                      child: Center(
                          child: CustomPaint(
                        size: Size(17.w, 18.h),
                        painter: EditIconPainter(),
                      )),
                    ),
                    Text(
                      "Edit",
                      style: GoogleFonts.poppins(
                          fontSize: 12.h,
                          fontWeight: FontWeight.w500,
                          color: Utils.kSingleTransactionBottomBarTextColor),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 46.h,
                      width: 46.w,
                      decoration: BoxDecoration(
                          color: Utils
                              .kSingleTransactionBottomBarRefundButtonColor,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Utils.kCircularButtonBorderColor,
                          )),
                      child: Center(
                          child: CustomPaint(
                        size: Size(17.w, 19.h),
                        painter: RefundIconPainter(),
                      )),
                    ),
                    Text(
                      "Refund",
                      style: GoogleFonts.poppins(
                          fontSize: 12.h,
                          fontWeight: FontWeight.w500,
                          color: Utils.kSingleTransactionBottomBarTextColor),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 46.h,
                      width: 46.w,
                      decoration: BoxDecoration(
                          color: Utils
                              .kSingleTransactionBottomBarDeleteButtonColor,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Utils.kCircularButtonBorderColor,
                          )),
                      child: Center(
                          child: CustomPaint(
                        size: Size(16.w, 20.h),
                        painter: DeleteIconPainter(),
                      )),
                    ),
                    Text(
                      "Delete",
                      style: GoogleFonts.poppins(
                          fontSize: 12.h,
                          fontWeight: FontWeight.w500,
                          color: Utils.kSingleTransactionBottomBarTextColor),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 46.h,
                      width: 46.w,
                      decoration: BoxDecoration(
                          color:
                              Utils.kSingleTransactionBottomBarFlagButtonColor,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Utils.kCircularButtonBorderColor,
                          )),
                      child: Center(
                          child: CustomPaint(
                        size: Size(15.w, 18.h),
                        painter: FlagIconPainter(),
                      )),
                    ),
                    Text(
                      "Flag",
                      style: GoogleFonts.poppins(
                          fontSize: 12.h,
                          fontWeight: FontWeight.w500,
                          color: Utils.kSingleTransactionBottomBarTextColor),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 46.h,
                      width: 46.w,
                      decoration: BoxDecoration(
                          color: Utils
                              .kSingleTransactionBottomBarMomentButtonColor,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Utils.kCircularButtonBorderColor,
                          )),
                      child: Center(
                          child: CustomPaint(
                        size: Size(22.w, 22.h),
                        painter: MomentIconPainter(),
                      )),
                    ),
                    Text(
                      "Moment",
                      style: GoogleFonts.poppins(
                          fontSize: 12.h,
                          fontWeight: FontWeight.w500,
                          color: Utils.kSingleTransactionBottomBarTextColor),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

class EditIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(3.15687, 10.4111);
    path_0.lineTo(11.498, 2.06989);
    path_0.lineTo(13.472, 4.0439);
    path_0.lineTo(5.13088, 12.3851);
    path_0.lineTo(2.45895, 13.083);
    path_0.lineTo(3.15687, 10.4111);
    path_0.close();

    Paint paint0Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.1176471;
    paint0Stroke.color = Colors.white.withOpacity(1.0);
    paint0Stroke.strokeCap = StrokeCap.round;
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

class RefundIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(3.27267, 5.3226);
    path_0.cubicTo(3.06642, 5.26819, 2.89499, 5.12497, 2.80475, 4.93169);
    path_0.cubicTo(2.71451, 4.7384, 2.71479, 4.51503, 2.80551, 4.32197);
    path_0.lineTo(4.39706, 0.934843);
    path_0.cubicTo(4.51566, 0.682432, 4.76958, 0.521415, 5.04847, 0.52176);
    path_0.cubicTo(5.32735, 0.522105, 5.58087, 0.683749, 5.69884, 0.936453);
    path_0.lineTo(6.40094, 2.4403);
    path_0.cubicTo(6.42605, 2.43044, 6.45196, 2.42188, 6.47864, 2.41474);
    path_0.cubicTo(10.6448, 1.2984, 14.9272, 3.77082, 16.0435, 7.93703);
    path_0.cubicTo(17.1599, 12.1032, 14.6874, 16.3856, 10.5212, 17.5019);
    path_0.cubicTo(6.35502, 18.6182, 2.07268, 16.1458, 0.956345, 11.9796);
    path_0.cubicTo(0.601357, 10.6548, 0.609343, 9.3161, 0.920258, 8.07149);
    path_0.cubicTo(1.01646, 7.68637, 1.40666, 7.45215, 1.79178, 7.54836);
    path_0.cubicTo(2.1769, 7.64457, 2.41111, 8.03476, 2.3149, 8.41988);
    path_0.cubicTo(2.06162, 9.43379, 2.05464, 10.5244, 2.34486, 11.6076);
    path_0.cubicTo(3.25572, 15.0069, 6.74983, 17.0242, 10.1492, 16.1134);
    path_0.cubicTo(13.5485, 15.2025, 15.5659, 11.7084, 14.655, 8.30908);
    path_0.cubicTo(13.759, 4.96531, 10.3636, 2.95874, 7.0175, 3.76092);
    path_0.lineTo(7.72589, 5.27825);
    path_0.cubicTo(7.84387, 5.53095, 7.80501, 5.82909, 7.62621, 6.04312);
    path_0.cubicTo(7.4474, 6.25714, 7.16093, 6.34842, 6.89127, 6.27727);
    path_0.lineTo(3.27267, 5.3226);
    path_0.close();

    Paint paint0Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    paint0Stroke.color = Colors.white.withOpacity(1.0);
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

class DeleteIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(5.36454, 1.375);
    path_0.cubicTo(5.36454, 0.978045, 5.68634, 0.65625, 6.08329, 0.65625);
    path_0.lineTo(9.91663, 0.65625);
    path_0.cubicTo(10.3136, 0.65625, 10.6354, 0.978045, 10.6354, 1.375);
    path_0.lineTo(10.6354, 2.09375);
    path_0.lineTo(14.7083, 2.09375);
    path_0.cubicTo(15.1052, 2.09375, 15.427, 2.41555, 15.427, 2.8125);
    path_0.cubicTo(15.427, 3.20945, 15.1052, 3.53125, 14.7083, 3.53125);
    path_0.lineTo(1.29163, 3.53125);
    path_0.cubicTo(0.894671, 3.53125, 0.572876, 3.20945, 0.572876, 2.8125);
    path_0.cubicTo(0.572876, 2.41555, 0.894671, 2.09375, 1.29163, 2.09375);
    path_0.lineTo(5.36454, 2.09375);
    path_0.lineTo(5.36454, 1.375);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(2.47986, 6.11375);
    path_1.cubicTo(2.50682, 5.87109, 2.71194, 5.6875, 2.9561, 5.6875);
    path_1.lineTo(13.0438, 5.6875);
    path_1.cubicTo(13.288, 5.6875, 13.4931, 5.87109, 13.5201, 6.11375);
    path_1.lineTo(13.7119, 7.84004);
    path_1.cubicTo(14.0576, 10.9517, 14.0576, 14.0921, 13.7119, 17.2038);
    path_1.lineTo(13.693, 17.3738);
    path_1.cubicTo(13.5671, 18.5071, 12.6887, 19.4107, 11.5595, 19.5688);
    path_1.cubicTo(9.19797, 19.8995, 6.80194, 19.8995, 4.44046, 19.5688);
    path_1.cubicTo(3.31119, 19.4107, 2.43286, 18.5071, 2.30693, 17.3738);
    path_1.lineTo(2.28805, 17.2038);
    path_1.cubicTo(1.94231, 14.0921, 1.94231, 10.9517, 2.28805, 7.84004);
    path_1.lineTo(2.47986, 6.11375);
    path_1.close();
    path_1.moveTo(6.80204, 9.42499);
    path_1.cubicTo(6.80204, 9.02804, 6.48025, 8.70624, 6.08329, 8.70624);
    path_1.cubicTo(5.68634, 8.70624, 5.36454, 9.02804, 5.36454, 9.42499);
    path_1.lineTo(5.36454, 16.1333);
    path_1.cubicTo(5.36454, 16.5303, 5.68634, 16.8521, 6.08329, 16.8521);
    path_1.cubicTo(6.48025, 16.8521, 6.80204, 16.5303, 6.80204, 16.1333);
    path_1.lineTo(6.80204, 9.42499);
    path_1.close();
    path_1.moveTo(10.6354, 9.42499);
    path_1.cubicTo(10.6354, 9.02804, 10.3136, 8.70624, 9.91663, 8.70624);
    path_1.cubicTo(9.51967, 8.70624, 9.19788, 9.02804, 9.19788, 9.42499);
    path_1.lineTo(9.19788, 16.1333);
    path_1.cubicTo(9.19788, 16.5303, 9.51967, 16.8521, 9.91663, 16.8521);
    path_1.cubicTo(10.3136, 16.8521, 10.6354, 16.5303, 10.6354, 16.1333);
    path_1.lineTo(10.6354, 9.42499);
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

class FlagIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0.928589, 11.4643);
    path_0.cubicTo(0.928589, 11.4643, 1.75002, 10.6428, 4.2143, 10.6428);
    path_0.cubicTo(6.67859, 10.6428, 8.32144, 12.2857, 10.7857, 12.2857);
    path_0.cubicTo(13.25, 12.2857, 14.0714, 11.4643, 14.0714, 11.4643);
    path_0.lineTo(14.0714, 1.60713);
    path_0.cubicTo(14.0714, 1.60713, 13.25, 2.42856, 10.7857, 2.42856);
    path_0.cubicTo(8.32144, 2.42856, 6.67859, 0.785706, 4.2143, 0.785706);
    path_0.cubicTo(1.75002, 0.785706, 0.928589, 1.60713, 0.928589, 1.60713);
    path_0.lineTo(0.928589, 11.4643);
    path_0.close();

    Paint paint0Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    paint0Stroke.color = Colors.white.withOpacity(1.0);
    paint0Stroke.strokeCap = StrokeCap.round;
    paint0Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_0, paint0Stroke);

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(0.928589, 17.2143);
    path_1.lineTo(0.928589, 11.4643);

    Paint paint1Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    paint1Stroke.color = Colors.white.withOpacity(1.0);
    paint1Stroke.strokeCap = StrokeCap.round;
    paint1Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_1, paint1Stroke);

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = const Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_1, paint1Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class MomentIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(11.8289, 2.3714);
    path_0.cubicTo(11.4595, 1.73492, 10.5404, 1.73492, 10.1711, 2.3714);
    path_0.lineTo(7.5701, 6.85382);
    path_0.cubicTo(7.38766, 7.16824, 7.07232, 7.3828, 6.71289, 7.43709);
    path_0.lineTo(1.8385, 8.1733);
    path_0.cubicTo(1.01982, 8.29696, 0.732642, 9.33062, 1.37023, 9.85886);
    path_0.lineTo(5.00144, 12.8673);
    path_0.cubicTo(5.33757, 13.1458, 5.49561, 13.585, 5.41396, 14.0138);
    path_0.lineTo(4.46409, 19.0021);
    path_0.cubicTo(4.31394, 19.7906, 5.14174, 20.4033, 5.852, 20.0293);
    path_0.lineTo(10.4419, 17.6126);
    path_0.cubicTo(10.7912, 17.4286, 11.2087, 17.4286, 11.5581, 17.6126);
    path_0.lineTo(16.1479, 20.0293);
    path_0.cubicTo(16.8582, 20.4033, 17.686, 19.7906, 17.5358, 19.0021);
    path_0.lineTo(16.586, 14.0138);
    path_0.cubicTo(16.5043, 13.585, 16.6624, 13.1458, 16.9985, 12.8673);
    path_0.lineTo(20.6297, 9.85886);
    path_0.cubicTo(21.2673, 9.33063, 20.9801, 8.29696, 20.1614, 8.1733);
    path_0.lineTo(15.287, 7.43709);
    path_0.cubicTo(14.9276, 7.3828, 14.6123, 7.16824, 14.4298, 6.85382);
    path_0.lineTo(11.8289, 2.3714);
    path_0.close();

    Paint paint0Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.09090909;
    paint0Stroke.color = Colors.white.withOpacity(1.0);
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

class TransactionIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(13.8334, 15.9167);
    path_0.lineTo(3.00004, 15.9167);
    path_0.cubicTo(1.38921, 15.9167, 0.083374, 14.6108, 0.083374, 13);
    path_0.lineTo(0.083374, 2.11932);
    path_0.cubicTo(0.083374, 1.2297, 0.963239, 0.665699, 1.73746, 0.934493);
    path_0.cubicTo(1.84806, 0.972892, 1.9565, 1.02829, 2.05992, 1.10216);
    path_0.lineTo(2.20579, 1.20635);
    path_0.cubicTo(2.92915, 1.72303, 3.90747, 1.72074, 4.63286, 1.20261);
    path_0.cubicTo(5.64698, 0.47824, 7.01977, 0.47824, 8.03389, 1.20261);
    path_0.cubicTo(8.75928, 1.72074, 9.7376, 1.72303, 10.461, 1.20635);
    path_0.lineTo(10.6068, 1.10216);
    path_0.cubicTo(11.4342, 0.511202, 12.5834, 1.10261, 12.5834, 2.11932);
    path_0.lineTo(12.5834, 8.41666);
    path_0.lineTo(15.5, 8.41666);
    path_0.cubicTo(15.8452, 8.41666, 16.125, 8.69648, 16.125, 9.04166);
    path_0.lineTo(16.125, 13.625);
    path_0.cubicTo(16.125, 14.8906, 15.099, 15.9167, 13.8334, 15.9167);
    path_0.close();
    path_0.moveTo(12.7917, 9.66666);
    path_0.lineTo(12.7917, 13.625);
    path_0.cubicTo(12.7917, 14.2003, 13.2581, 14.6667, 13.8334, 14.6667);
    path_0.cubicTo(14.4087, 14.6667, 14.875, 14.2003, 14.875, 13.625);
    path_0.lineTo(14.875, 9.66666);
    path_0.lineTo(12.7917, 9.66666);
    path_0.close();
    path_0.moveTo(9.25004, 6.12499);
    path_0.cubicTo(9.25004, 5.77981, 8.97022, 5.49999, 8.62504, 5.49999);
    path_0.lineTo(3.62504, 5.49999);
    path_0.cubicTo(3.27986, 5.49999, 3.00004, 5.77981, 3.00004, 6.12499);
    path_0.cubicTo(3.00004, 6.47017, 3.27986, 6.74999, 3.62504, 6.74999);
    path_0.lineTo(8.62504, 6.74999);
    path_0.cubicTo(8.97022, 6.74999, 9.25004, 6.47017, 9.25004, 6.12499);
    path_0.close();
    path_0.moveTo(8.41671, 8.62499);
    path_0.cubicTo(8.41671, 8.27982, 8.13688, 7.99999, 7.79171, 7.99999);
    path_0.lineTo(3.62504, 7.99999);
    path_0.cubicTo(3.27986, 7.99999, 3.00004, 8.27982, 3.00004, 8.62499);
    path_0.cubicTo(3.00004, 8.97017, 3.27986, 9.24999, 3.62504, 9.24999);
    path_0.lineTo(7.79171, 9.24999);
    path_0.cubicTo(8.13688, 9.24999, 8.41671, 8.97017, 8.41671, 8.62499);
    path_0.close();
    path_0.moveTo(8.62504, 10.5);
    path_0.cubicTo(8.97022, 10.5, 9.25004, 10.7798, 9.25004, 11.125);
    path_0.cubicTo(9.25004, 11.4702, 8.97022, 11.75, 8.62504, 11.75);
    path_0.lineTo(3.62504, 11.75);
    path_0.cubicTo(3.27986, 11.75, 3.00004, 11.4702, 3.00004, 11.125);
    path_0.cubicTo(3.00004, 10.7798, 3.27986, 10.5, 3.62504, 10.5);
    path_0.lineTo(8.62504, 10.5);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class AttachIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(4.5, 0.40625);
    path_0.cubicTo(6.82995, 0.40625, 8.71875, 2.29505, 8.71875, 4.625);
    path_0.lineTo(8.71875, 9.625);
    path_0.cubicTo(8.71875, 11.2646, 7.3896, 12.5938, 5.75, 12.5938);
    path_0.cubicTo(4.1104, 12.5938, 2.78125, 11.2646, 2.78125, 9.625);
    path_0.lineTo(2.78125, 4.53571);
    path_0.cubicTo(2.78125, 3.58647, 3.55076, 2.81696, 4.5, 2.81696);
    path_0.cubicTo(5.44924, 2.81696, 6.21875, 3.58647, 6.21875, 4.53571);
    path_0.lineTo(6.21875, 9.44643);
    path_0.cubicTo(6.21875, 9.70531, 6.00888, 9.91518, 5.75, 9.91518);
    path_0.cubicTo(5.49112, 9.91518, 5.28125, 9.70531, 5.28125, 9.44643);
    path_0.lineTo(5.28125, 4.53571);
    path_0.cubicTo(5.28125, 4.10424, 4.93147, 3.75446, 4.5, 3.75446);
    path_0.cubicTo(4.06853, 3.75446, 3.71875, 4.10424, 3.71875, 4.53571);
    path_0.lineTo(3.71875, 9.625);
    path_0.cubicTo(3.71875, 10.7468, 4.62817, 11.6562, 5.75, 11.6562);
    path_0.cubicTo(6.87183, 11.6562, 7.78125, 10.7468, 7.78125, 9.625);
    path_0.lineTo(7.78125, 4.625);
    path_0.cubicTo(7.78125, 2.81282, 6.31218, 1.34375, 4.5, 1.34375);
    path_0.cubicTo(2.68782, 1.34375, 1.21875, 2.81282, 1.21875, 4.625);
    path_0.lineTo(1.21875, 9.44643);
    path_0.cubicTo(1.21875, 9.70531, 1.00888, 9.91518, 0.75, 9.91518);
    path_0.cubicTo(0.491117, 9.91518, 0.28125, 9.70531, 0.28125, 9.44643);
    path_0.lineTo(0.28125, 4.625);
    path_0.cubicTo(0.28125, 2.29505, 2.17005, 0.40625, 4.5, 0.40625);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xff4478DE).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class LocationIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0.358464, 5.54837);
    path_0.cubicTo(0.573239, 2.94278, 2.75061, 0.9375, 5.36504, 0.9375);
    path_0.lineTo(5.635, 0.9375);
    path_0.cubicTo(8.24942, 0.9375, 10.4268, 2.94278, 10.6416, 5.54837);
    path_0.cubicTo(10.7572, 6.95124, 10.3239, 8.34424, 9.43283, 9.43395);
    path_0.lineTo(6.43717, 13.0976);
    path_0.cubicTo(5.95281, 13.6899, 5.04723, 13.6899, 4.56287, 13.0976);
    path_0.lineTo(1.5672, 9.43395);
    path_0.cubicTo(0.676167, 8.34424, 0.242828, 6.95124, 0.358464, 5.54837);
    path_0.close();
    path_0.moveTo(4.40625, 5.98214);
    path_0.cubicTo(4.40625, 5.34089, 4.9083, 4.84375, 5.5, 4.84375);
    path_0.cubicTo(6.0917, 4.84375, 6.59375, 5.34089, 6.59375, 5.98214);
    path_0.cubicTo(6.59375, 6.4842, 6.28316, 6.90235, 5.86347, 7.05628);
    path_0.cubicTo(5.49591, 7.19108, 5.03125, 7.54775, 5.03125, 8.125);
    path_0.cubicTo(5.03125, 8.38388, 5.24112, 8.59375, 5.5, 8.59375);
    path_0.cubicTo(5.75888, 8.59375, 5.96875, 8.38388, 5.96875, 8.125);
    path_0.cubicTo(5.96875, 8.11522, 5.97128, 8.09094, 6.00701, 8.05115);
    path_0.cubicTo(6.0452, 8.00863, 6.10848, 7.96498, 6.18627, 7.93645);
    path_0.cubicTo(6.97611, 7.64678, 7.53125, 6.8765, 7.53125, 5.98214);
    path_0.cubicTo(7.53125, 4.84819, 6.63419, 3.90625, 5.5, 3.90625);
    path_0.cubicTo(4.36581, 3.90625, 3.46875, 4.84819, 3.46875, 5.98214);
    path_0.cubicTo(3.46875, 6.24103, 3.67862, 6.45089, 3.9375, 6.45089);
    path_0.cubicTo(4.19638, 6.45089, 4.40625, 6.24103, 4.40625, 5.98214);
    path_0.close();
    path_0.moveTo(5.5, 10.625);
    path_0.cubicTo(5.84518, 10.625, 6.125, 10.3452, 6.125, 10);
    path_0.cubicTo(6.125, 9.65482, 5.84518, 9.375, 5.5, 9.375);
    path_0.cubicTo(5.15482, 9.375, 4.875, 9.65482, 4.875, 10);
    path_0.cubicTo(4.875, 10.3452, 5.15482, 10.625, 5.5, 10.625);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xff4478DE).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class CreditCardIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(12.5115, 2.6341);
    path_0.cubicTo(12.1782, 2.53167, 11.8219, 2.53167, 11.4886, 2.6341);
    path_0.lineTo(8.50285, 3.55177);
    path_0.cubicTo(6.9685, 4.02336, 5.51132, 4.71669, 4.17753, 5.6098);
    path_0.cubicTo(3.32969, 6.17751, 3.73157, 7.5, 4.75193, 7.5);
    path_0.lineTo(19.2481, 7.5);
    path_0.cubicTo(20.2685, 7.5, 20.6703, 6.17751, 19.8225, 5.6098);
    path_0.cubicTo(18.4887, 4.71669, 17.0315, 4.02336, 15.4972, 3.55177);
    path_0.lineTo(12.5115, 2.6341);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xff23C16B).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(4.25, 21);
    path_1.cubicTo(4.25, 20.5858, 4.58579, 20.25, 5, 20.25);
    path_1.lineTo(19, 20.25);
    path_1.cubicTo(19.4142, 20.25, 19.75, 20.5858, 19.75, 21);
    path_1.cubicTo(19.75, 21.4142, 19.4142, 21.75, 19, 21.75);
    path_1.lineTo(5, 21.75);
    path_1.cubicTo(4.58579, 21.75, 4.25, 21.4142, 4.25, 21);
    path_1.close();

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = const Color(0xffFF9717).withOpacity(1.0);
    canvas.drawPath(path_1, paint1Fill);

    Path path_2 = Path();
    path_2.moveTo(6.25, 17);
    path_2.cubicTo(6.25, 17.4142, 6.58579, 17.75, 7, 17.75);
    path_2.cubicTo(7.41421, 17.75, 7.75, 17.4142, 7.75, 17);
    path_2.lineTo(7.75, 11);
    path_2.cubicTo(7.75, 10.5858, 7.41421, 10.25, 7, 10.25);
    path_2.cubicTo(6.58579, 10.25, 6.25, 10.5858, 6.25, 11);
    path_2.lineTo(6.25, 17);
    path_2.close();

    Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = const Color(0xff7B61FF).withOpacity(1.0);
    canvas.drawPath(path_2, paint2Fill);

    Path path_3 = Path();
    path_3.moveTo(12, 17.75);
    path_3.cubicTo(11.5858, 17.75, 11.25, 17.4142, 11.25, 17);
    path_3.lineTo(11.25, 11);
    path_3.cubicTo(11.25, 10.5858, 11.5858, 10.25, 12, 10.25);
    path_3.cubicTo(12.4142, 10.25, 12.75, 10.5858, 12.75, 11);
    path_3.lineTo(12.75, 17);
    path_3.cubicTo(12.75, 17.4142, 12.4142, 17.75, 12, 17.75);
    path_3.close();

    Paint paint3Fill = Paint()..style = PaintingStyle.fill;
    paint3Fill.color = const Color(0xff7B61FF).withOpacity(1.0);
    canvas.drawPath(path_3, paint3Fill);

    Path path_4 = Path();
    path_4.moveTo(16.25, 17);
    path_4.cubicTo(16.25, 17.4142, 16.5858, 17.75, 17, 17.75);
    path_4.cubicTo(17.4142, 17.75, 17.75, 17.4142, 17.75, 17);
    path_4.lineTo(17.75, 11);
    path_4.cubicTo(17.75, 10.5858, 17.4142, 10.25, 17, 10.25);
    path_4.cubicTo(16.5858, 10.25, 16.25, 10.5858, 16.25, 11);
    path_4.lineTo(16.25, 17);
    path_4.close();

    Paint paint4Fill = Paint()..style = PaintingStyle.fill;
    paint4Fill.color = const Color(0xff7B61FF).withOpacity(1.0);
    canvas.drawPath(path_4, paint4Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class FoodIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(11.3809, 1.18555);
    path_0.cubicTo(8.65094, 0.727883, 5.84913, 0.727883, 3.11918, 1.18555);
    path_0.cubicTo(2.12184, 1.35275, 1.32757, 2.11842, 1.1276, 3.11119);
    path_0.cubicTo(0.211481, 7.65929, 0.161495, 12.3394, 0.980264, 16.906);
    path_0.lineTo(1.31362, 18.7652);
    path_0.cubicTo(1.4164, 19.3385, 2.11531, 19.5676, 2.53757, 19.1665);
    path_0.lineTo(6.56128, 15.344);
    path_0.cubicTo(6.94725, 14.9773, 7.55282, 14.9773, 7.93878, 15.344);
    path_0.lineTo(11.9625, 19.1665);
    path_0.cubicTo(12.3848, 19.5676, 13.0837, 19.3385, 13.1865, 18.7652);
    path_0.lineTo(13.5198, 16.906);
    path_0.cubicTo(14.3386, 12.3394, 14.2886, 7.65928, 13.3725, 3.11119);
    path_0.cubicTo(13.1725, 2.11842, 12.3782, 1.35275, 11.3809, 1.18555);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class EatOutIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(14.0818, 3.25643);
    path_0.cubicTo(12.3755, 2.93225, 10.6244, 2.93225, 8.91819, 3.25643);
    path_0.cubicTo(8.29485, 3.37486, 7.79844, 3.91721, 7.67345, 4.62042);
    path_0.cubicTo(7.10088, 7.84199, 7.06964, 11.157, 7.58137, 14.3917);
    path_0.lineTo(7.78971, 15.7087);
    path_0.cubicTo(7.85396, 16.1148, 8.29077, 16.2771, 8.55469, 15.9929);
    path_0.lineTo(11.0695, 13.2853);
    path_0.cubicTo(11.3107, 13.0256, 11.6892, 13.0256, 11.9304, 13.2853);
    path_0.lineTo(14.4453, 15.9929);
    path_0.cubicTo(14.7092, 16.2771, 15.146, 16.1148, 15.2102, 15.7087);
    path_0.lineTo(15.4186, 14.3917);
    path_0.cubicTo(15.9303, 11.157, 15.8991, 7.84199, 15.3265, 4.62042);
    path_0.cubicTo(15.2015, 3.91721, 14.7051, 3.37486, 14.0818, 3.25643);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(11.1309, 1.18555);
    path_1.cubicTo(8.40094, 0.727883, 5.59913, 0.727883, 2.86918, 1.18555);
    path_1.cubicTo(1.87184, 1.35275, 1.07757, 2.11842, 0.877601, 3.11119);
    path_1.cubicTo(-0.038519, 7.65929, -0.0885051, 12.3394, 0.730264, 16.906);
    path_1.lineTo(1.06362, 18.7652);
    path_1.cubicTo(1.1664, 19.3385, 1.86531, 19.5676, 2.28757, 19.1665);
    path_1.lineTo(6.31128, 15.344);
    path_1.cubicTo(6.69725, 14.9773, 7.30282, 14.9773, 7.68878, 15.344);
    path_1.lineTo(11.7125, 19.1665);
    path_1.cubicTo(12.1348, 19.5676, 12.8337, 19.3385, 12.9365, 18.7652);
    path_1.lineTo(13.2698, 16.906);
    path_1.cubicTo(14.0886, 12.3394, 14.0386, 7.65928, 13.1225, 3.11119);
    path_1.cubicTo(12.9225, 2.11842, 12.1282, 1.35275, 11.1309, 1.18555);
    path_1.close();

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = Colors.white.withOpacity(0.4);
    canvas.drawPath(path_1, paint1Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class DeliverooIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Colors.white.withOpacity(1.0);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.1397059, size.height * 0.2857070,
                size.width * 0.7352941, size.height * 0.7142850),
            bottomRight: Radius.circular(size.width * 0.02941176),
            bottomLeft: Radius.circular(size.width * 0.02941176),
            topLeft: Radius.circular(size.width * 0.02941176),
            topRight: Radius.circular(size.width * 0.02941176)),
        paint0Fill);

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = const Color(0xff0B85EA).withOpacity(1.0);
    canvas.drawRect(
        Rect.fromLTWH(size.width * 0.6298824, size.height * 0.5714000,
            size.width * 0.1225491, size.height * 0.4285715),
        paint1Fill);

    Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = const Color(0xff404446).withOpacity(1.0);
    canvas.drawRect(
        Rect.fromLTWH(size.width * 0.1397059, size.height * 0.4285780,
            size.width * 0.2521009, size.height * 1.250000),
        paint2Fill);

    Paint paint3Fill = Paint()..style = PaintingStyle.fill;
    paint3Fill.color = const Color(0xffFCE76B).withOpacity(1.0);
    canvas.drawRect(
        Rect.fromLTWH(size.width * 0.6649235, size.height * 0.4285780,
            size.width * 0.2521009, size.height * 0.1785715),
        paint3Fill);

    Paint paint4Fill = Paint()..style = PaintingStyle.fill;
    paint4Fill.color = const Color(0xff5BEEBC).withOpacity(1.0);
    canvas.drawRect(
        Rect.fromLTWH(size.width * 0.4548471, size.height * 0.4285780,
            size.width * 0.2521009, size.height * 0.1785715),
        paint4Fill);

    Paint paint5Fill = Paint()..style = PaintingStyle.fill;
    paint5Fill.color = const Color(0xffFE7886).withOpacity(1.0);
    canvas.drawRect(
        Rect.fromLTWH(size.width * 0.2447438, size.height * 0.4285780,
            size.width * 0.2521009, size.height * 0.1785715),
        paint5Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
