import 'package:flutter/material.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:mobile_customer/models/counselor.dart';
import 'package:mobile_customer/models/user.dart';
import 'package:mobile_customer/values/app_fonts.dart';
import 'package:mobile_customer/values/app_styles.dart';

class ConsultantDetailScreen extends StatelessWidget {
  const ConsultantDetailScreen();
  static const routeName = '/counselor-detail-screen';

  @override
  Widget build(BuildContext context) {
    final double _sizeHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    Counselor counselor = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Thông tin diễn giả', style: AppStyle.barStyleMontserrat),
        flexibleSpace:
            Container(decoration: BoxDecoration(color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: 20,
                ),
                Container(
                  child: AdvancedAvatar(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black54,
                          // spreadRadius: 0.1,
                          blurRadius: 4,
                          offset: Offset(0, 1), // changes position of shadow
                        )
                      ],
                    ),
                    size: 85,
                    // image: AssetImage('assets/images/avatar.png'),
                    image: NetworkImage(counselor.image),
                    foregroundDecoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        // color: Color(0xFF49F0EE),
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      counselor.fullName,
                      // 'Lê Duy Tuấn Vũ',
                      style: AppStyle.titleSearch.copyWith(
                          fontWeight: FontWeight.bold,
                          fontFamily: AppFonts.montserrat),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      counselor.email,
                      style: AppStyle.bookDetail
                          .copyWith(fontFamily: AppFonts.montserrat),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: _sizeHeight * 0.015,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                color: Colors.black38,
              ),
            ),
            SizedBox(
              height: _sizeHeight * 0.007,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: _sizeHeight * 0.002),
                  RichText(
                    text: TextSpan(
                      text: 'Họ và Tên : ',
                      style: AppStyle.counselorDetail,
                      children: <TextSpan>[
                        TextSpan(
                          text: '${counselor.fullName}',
                          style: AppStyle.counselorDetail.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: _sizeHeight * 0.005),
                  RichText(
                    text: TextSpan(
                      text: 'Email : ',
                      style: AppStyle.counselorDetail,
                      children: <TextSpan>[
                        TextSpan(
                          text: '${counselor.email}',
                          style: AppStyle.counselorDetail.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: _sizeHeight * 0.005),
                  RichText(
                    text: TextSpan(
                      text: 'Số điện thoại : ',
                      style: AppStyle.counselorDetail,
                      children: <TextSpan>[
                        TextSpan(
                          text: '${counselor.phone}',
                          style: AppStyle.counselorDetail.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: _sizeHeight * 0.005),
                  RichText(
                    text: TextSpan(
                      text: 'Địa chỉ : ',
                      style: AppStyle.counselorDetail,
                      children: <TextSpan>[
                        TextSpan(
                          text: '${counselor.address}',
                          style: AppStyle.counselorDetail.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: _sizeHeight * 0.005),
                  RichText(
                    text: TextSpan(
                      text: 'Ngày sinh : ',
                      style: AppStyle.counselorDetail,
                      children: <TextSpan>[
                        TextSpan(
                          text: '${counselor.birthday}',
                          style: AppStyle.counselorDetail.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // TextSpan(text: ' world!'),
                      ],
                    ),
                  ),
                  SizedBox(height: _sizeHeight * 0.005),
                  Text(
                    'Giới thiệu bản thân : ',
                    style: AppStyle.counselorDetail,
                  ),
                  Text(
                    '- ${counselor.description}',
                    style: AppStyle.counselorDetail
                        .copyWith(fontStyle: FontStyle.italic),
                  ),
                  // RichText(
                  //   text: TextSpan(
                  //     text: 'Giới thiệu về bản thân : ',
                  //     style: AppStyle.counselorDetail,
                  //     children: <TextSpan>[
                  //       TextSpan(
                  //         text: '${counselor.description}',
                  //         style: AppStyle.counselorDetail.copyWith(
                  //           fontStyle: FontStyle.italic,
                  //         ),
                  //       ),
                  //       // TextSpan(text: ' world!'),
                  //     ],
                  //   ),
                  // ),
                  // RichText(
                  //   text: TextSpan(
                  //     text: 'Giới thiệu về bản thân : ',
                  //     style: AppStyle.counselorDetail,
                  //     children: <TextSpan>[
                  //       TextSpan(
                  //         text: '${counselor.description}',
                  //         style: AppStyle.counselorDetail.copyWith(
                  //           fontStyle: FontStyle.italic,
                  //         ),
                  //       ),
                  //       // TextSpan(text: ' world!'),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
