import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tugas_dari_gnt/features/home/presentation/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        width: double.infinity,
        backgroundColor: Colors.transparent,
        child: _drawerCustom(),
      ),
      body: _content(),
    );
  }

  Widget _drawerCustom() {
    return Builder(
      builder: (context) {
        return Row(
          children: [
            Container(
              width: 60,
              height: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(0, 32, 96, 0.6),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(30),
                        onTap: () => Scaffold.of(context).closeEndDrawer(),
                        child: SvgPicture.asset(
                          "assets/images/eva_close-circle-fill.svg",
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            _drawerContent(),
          ],
        );
      },
    );
  }

  Widget _drawerContent() {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 160,
            ),
            _drawerProfile(),
            const SizedBox(
              height: 36,
            ),
            _drawerMenus(),
            const SizedBox(
              height: 40,
            ),
            _drawerButtonLogout(),
            const SizedBox(
              height: 70,
            ),
            _drawerSocial(),
            const Spacer(),
            _drawerInfo(),
            const SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawerInfo() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        children: [
          Text(
            'FAQ',
            style: TextStyle(
              color: Color(0xFFBEBEBE),
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            width: 50,
          ),
          Text(
            'Terms and Conditions',
            style: TextStyle(
              color: Color(0xFFBEBEBE),
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawerSocial() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Ikuti kami di',
          style: TextStyle(
            color: Color(0xFF002060),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        SvgPicture.asset(
          "assets/images/fb.svg",
          width: 16,
          height: 16,
        ),
        const SizedBox(
          width: 5,
        ),
        SvgPicture.asset(
          "assets/images/instagram.svg",
          width: 16,
          height: 16,
        ),
        const SizedBox(
          width: 5,
        ),
        SvgPicture.asset(
          "assets/images/twitter.svg",
          width: 16,
          height: 16,
        ),
      ],
    );
  }

  Widget _drawerButtonLogout() {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Padding(
        padding: const EdgeInsets.only(
          left: 35,
          right: 170,
        ),
        child: Container(
          width: double.infinity,
          decoration: ShapeDecoration(
            color: const Color(0xFFEA0004),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(23),
            ),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(23),
              onTap: () => ctrl.onLogoutClicked(),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Center(
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget _drawerMenus() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 35,
        right: 135,
      ),
      child: Column(
        children: [
          _drawerMenuItem(text: "Profile Saya", onTap: () {}),
          const SizedBox(
            height: 14,
          ),
          _drawerMenuItem(text: "Pengaturan", onTap: () {}),
        ],
      ),
    );
  }

  Widget _drawerMenuItem({
    String text = "",
    void Function()? onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(2),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Row(
            children: [
              Text(
                text,
                style: const TextStyle(
                  color: Color(0xFF999999),
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios,
                color: Color(0xFF999999),
                size: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawerProfile() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
      ),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/photo.png",
            width: 60,
            height: 60,
          ),
          const SizedBox(
            width: 12,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Angga ',
                      style: TextStyle(
                        color: Color(0xFF002060),
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: 'Praja',
                      style: TextStyle(
                        color: Color(0xFF002060),
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                'Membership BBLK',
                style: TextStyle(
                  color: Color(0xFF002060),
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _content() {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 60,
              color: Colors.white,
            ),
            _customHeader(),
            // const Divider(),
            Expanded(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    // Kenapa pakai gambar karena sulit di implementasi
                    //
                    Image.asset("assets/images/home_card_custom.png"),
                    //
                    card1(),
                    const SizedBox(
                      height: 45,
                    ),
                    card2(),
                    const SizedBox(
                      height: 35,
                    ),
                    card3(),
                    const SizedBox(
                      height: 35,
                    ),
                    category(),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget card1() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 28),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x28BEBEBE),
            blurRadius: 24,
            offset: Offset(0, 16),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 15, top: 28, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Layanan Khusus',
                  style: TextStyle(
                    color: Color(0xFF002060),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Tes Covid 19, Cegah Corona\nSedini Mungkin',
                  style: TextStyle(
                    color: Color(0xFF597393),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Text(
                      'Daftar Tes',
                      style: TextStyle(
                        color: Color(0xFF002060),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      size: 14,
                      color: Color(0xFF002060),
                    )
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 150,
            height: 120,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: -20,
                  child: Image.asset(
                    "assets/images/covid_icon_1.png",
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget card2() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 28),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x28BEBEBE),
            blurRadius: 24,
            offset: Offset(0, 16),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: 20,
          ),
          SizedBox(
            width: 120,
            height: 120,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: -30,
                  child: Image.asset(
                    "assets/images/track_icon_1.png",
                    width: 120,
                    height: 120,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 24,
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Track Pemeriksaan',
                    style: TextStyle(
                      color: Color(0xFF002080),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Kamu dapat mengecek progress pemeriksaanmu disini',
                    style: TextStyle(
                      color: Color(0xFF597393),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Text(
                        'Track',
                        style: TextStyle(
                          color: Color(0xFF002060),
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(
                        Icons.arrow_forward,
                        size: 14,
                        color: Color(0xFF002060),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget card3() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 28),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: const ShapeDecoration(
              color: Colors.white,
              shape: OvalBorder(),
              shadows: [
                BoxShadow(
                  color: Color(0x28BEBEBE),
                  blurRadius: 24,
                  offset: Offset(0, 16),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Center(
              child: SizedBox(
                height: 20,
                width: 20,
                child: Image.asset("assets/images/filter1.png"),
              ),
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x3DBEBEBE),
                    blurRadius: 24,
                    offset: Offset(0, 16),
                    spreadRadius: 0,
                  )
                ],
              ),
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
                left: 30,
                right: 20,
              ),
              child: const Row(
                children: [
                  Text(
                    'Search',
                    style: TextStyle(
                      color: Color(0xFFBEBEBE),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.search,
                    color: Color.fromRGBO(0, 32, 96, 1),
                    size: 16,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget category() {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: 28,
            ),
            categoryItem(isSelected: true, label: "All Product"),
            categoryItem(isSelected: false, label: "Layanan Kesehatan"),
            categoryItem(isSelected: false, label: "Alat Kesehatan"),
          ],
        ),
      ),
    );
  }

  Widget categoryItem({
    isSelected = false,
    void Function()? onTap,
    String label = "",
  }) {
    return Container(
      margin: const EdgeInsets.only(right: 28, bottom: 10),
      decoration: ShapeDecoration(
        color: isSelected ? const Color(0xFF002060) : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x3D002060),
            blurRadius: 5,
            offset: Offset(0, 5),
            spreadRadius: 0,
          )
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 10,
            ),
            child: Center(
              child: Text(
                label,
                style: TextStyle(
                  color: !isSelected ? const Color(0xFF002060) : Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _iconHeader(
      {String image = "assets/images/dashicons_menu.svg",
      void Function()? onTap,
      double size = 28,
      Widget? widget}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: widget ?? SvgPicture.asset(image, width: size, height: size),
        ),
      ),
    );
  }

  Widget _customHeader() {
    return Builder(
      builder: (context) {
        return Container(
          width: double.infinity,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              _iconHeader(
                onTap: () {
                  Scaffold.of(context).openEndDrawer();
                },
              ),
              const Spacer(),
              _iconHeader(
                image: "assets/images/shopping-cart 1.svg",
                size: 22,
                onTap: () {
                  // Scaffold.of(context).openEndDrawer();
                },
              ),
              const SizedBox(
                width: 10,
              ),
              _iconHeader(
                size: 22,
                onTap: () {},
                widget: SizedBox(
                  height: 22,
                  width: 22,
                  child: Stack(
                    children: [
                      SvgPicture.asset(
                        "assets/images/new.svg",
                        width: 22,
                        height: 22,
                      ),
                      Positioned(
                        top: 0,
                        right: 2,
                        child: Container(
                          width: 6,
                          height: 6,
                          decoration: const ShapeDecoration(
                            color: Color(0xFFFE0000),
                            shape: OvalBorder(
                              side: BorderSide(
                                width: 1.50,
                                strokeAlign: BorderSide.strokeAlignOutside,
                                color: Color(0xFFF7F8FC),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}