import 'package:books_app/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../detail_page/detail_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 400,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
            color: Colors.teal,
            child: Column(
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage(AppImages.profilePicture),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.05),
                          shape: BoxShape.circle),
                      child: Icon(
                        Icons.equalizer,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'Hello, Shameel',
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Colors.white.withOpacity(0.5)),
                    )
                  ],
                ),
                const SizedBox(height: 100),
                const Center(
                  child: Text(
                    "Investment Balance",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const Center(
                  child: Text(
                    "\$21,980",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 44,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 400),
            child: Container(
              padding: const EdgeInsets.only(top: 100),
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Your Transactions",
                            style:
                                TextStyle(fontSize: 18, color: Colors.black)),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.05),
                                borderRadius: BorderRadius.circular(5)),
                            child: const Text(
                              'See All',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 160,
                    child: ScrollSnapList(
                      onItemFocus: _onItemFocus,
                      itemSize: 360,
                      duration: 0,
                      allowAnotherDirection: false,
                      curve: Curves.bounceIn,
                      scrollDirection: Axis.horizontal,
                      scrollPhysics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DetailPageView(),
                              ),
                            );
                          },
                          child: Container(
                            width: 260,
                            margin: const EdgeInsets.only(left: 20),
                            decoration: BoxDecoration(
                              color: Colors.purple.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset('assets/book1.png', width: 150),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 40),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          "ALBERT",
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          "L'Etragner",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          "\$2,574",
                                          style: TextStyle(fontSize: 24),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 330, right: 24, left: 24),
            child: Container(
              height: 140,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.orange.shade300,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Most Profitable\nInvestment",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'Fantasy Books',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: SfRadialGauge(axes: <RadialAxis>[
                      RadialAxis(
                        pointers: [
                          RangePointer(
                            value: secondaryProgressValue,
                            width: 0.2,
                            sizeUnit: GaugeSizeUnit.factor,
                            color: const Color.fromARGB(120, 0, 169, 181),
                            cornerStyle: CornerStyle.bothCurve,
                          ),
                          RangePointer(
                            value: progressValue,
                            width: 0.1,
                            sizeUnit: GaugeSizeUnit.factor,
                            cornerStyle: CornerStyle.bothCurve,
                          ),
                        ],
                        minimum: 0,
                        maximum: 100,
                        startAngle: 180,
                        endAngle: 180,
                        showLabels: false,
                        showTicks: false,
                        labelsPosition: ElementsPosition.inside,
                        axisLineStyle: AxisLineStyle(
                          thickness: 0.2,
                          cornerStyle: CornerStyle.bothCurve,
                          color: Colors.white.withOpacity(0.5),
                          thicknessUnit: GaugeSizeUnit.factor,
                        ),
                      )
                    ]),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        currentIndex: 0,
        onTap: (int index) {},
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/home.svg'),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/charts.svg'),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/search.svg', height: 25),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/settings.svg'),
            label: "",
          ),
        ],
      ),
    );
  }

  double progressValue = 40;
  double secondaryProgressValue = 90;

  void _onItemFocus(int index) {
    setState(
      () {},
    );
  }
}
