import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../component/centerAppbar.dart';

class OrderDetailsPage extends StatefulWidget {
  const OrderDetailsPage({super.key});

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    String ordered =
        '<svg t="1695111209962" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="4203" width="32" height="32"><path d="M815.91545 1023.904905h-607.916398A151.110647 151.110647 0 0 1 51.677693 878.439195V161.966297A151.110647 151.110647 0 0 1 207.999052 16.934814a26.05356 26.05356 0 1 1 0 51.672894 99.437754 99.437754 0 0 0-104.214239 93.358589v716.472898a99.437754 99.437754 0 0 0 104.214239 93.792816h607.916398a99.437754 99.437754 0 0 0 104.21424-93.792816V161.966297a99.437754 99.437754 0 0 0-104.21424-93.358589H408.611464A25.619334 25.619334 0 0 1 382.99213 43.4226a25.185108 25.185108 0 0 1 25.619334-26.487786h407.303986a151.544873 151.544873 0 0 1 156.32136 145.031483v716.472898a151.544873 151.544873 0 0 1-156.32136 145.46571z" fill="#bfbfbf" p-id="4204"></path><path d="M177.169007 262.272503m30.395819 0l547.124759 0q30.39582 0 30.395819 30.39582l0 0q0 30.39582-30.395819 30.39582l-547.124759 0q-30.39582 0-30.395819-30.39582l0 0q0-30.39582 30.395819-30.39582Z" fill="#bfbfbf" p-id="4205"></path><path d="M177.169007 441.173614m30.395819 0l373.434359 0q30.39582 0 30.39582 30.39582l0 0q0 30.39582-30.39582 30.39582l-373.434359 0q-30.39582 0-30.395819-30.39582l0 0q0-30.39582 30.395819-30.39582Z" fill="#bfbfbf" p-id="4206"></path><path d="M311.34484 34.73808m-34.73808 0a34.73808 34.73808 0 1 0 69.47616 0 34.73808 34.73808 0 1 0-69.47616 0Z" fill="#bfbfbf" p-id="4207"></path><path d="M298.723668 684.215067m21.493091-21.49309l0 0q21.49309-21.49309 42.98618 0l141.240309 141.240308q21.49309 21.49309 0 42.986181l0 0q-21.49309 21.49309-42.986181 0l-141.240308-141.240308q-21.49309-21.49309 0-42.986181Z" p-id="4208" fill="#bfbfbf"></path><path d="M810.205134 456.99614m21.49309 21.49309l0 0q21.49309 21.49309 0 42.986181l-325.466797 325.466797q-21.49309 21.49309-42.98618 0l0 0q-21.49309-21.49309 0-42.986181l325.466797-325.466797q21.49309-21.49309 42.98618 0Z" p-id="4209" fill="#bfbfbf"></path></svg>';
    String cooking =
        '<svg t="1695111327241" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="11636" width="32" height="32"><path d="M377.717947 169.568481c18.502977 18.502977 18.502977 50.220303 0 68.716056-6.603562 7.940169-6.603562 19.83236 0 26.443146 3.966472 3.966472 7.932944 5.266955 13.221573 5.266955 3.966472 0 9.262326-1.314932 13.221573-5.266955 31.731775-33.053933 31.731775-88.548415 0-121.595123-9.255101-9.262326-13.221573-21.140067-13.221573-34.368865 0-13.214348 5.288629-25.113764 13.221573-34.36164 6.610787-7.932944 6.610787-19.825135 0-26.435922a16.227133 16.227133 0 0 0-25.113764 0c-15.851438 15.858663-23.784382 38.335337-23.784382 60.797562-1.314932 22.469449 6.603562 43.609517 22.469449 60.790337l-0.014449 0.014449z m124.224988 67.408349c-6.603562 7.940169-6.603562 19.825135 0 26.435921 3.966472 3.966472 7.932944 5.288629 13.221573 5.288629 3.973697 0 9.247876-1.322157 13.228798-5.288629 31.724551-33.039483 31.724551-88.533966 0-121.595123-9.255101-9.247876-13.228798-21.132842-13.228798-34.354416s5.274179-25.113764 13.228798-34.368865c6.596337-7.940169 6.596337-19.81791 0-26.435921a16.227133 16.227133 0 0 0-25.120989 0c-15.844213 15.851438-23.784382 38.328112-23.784382 60.790336 0 22.469449 7.932944 44.931674 23.784382 60.797562 15.851438 19.810685 15.851438 50.205853-1.314933 68.708831l-0.014449 0.021675z m116.292044 0c-6.603562 7.940169-6.603562 19.825135 0 26.435921 3.973697 3.966472 7.932944 5.288629 13.228798 5.288629 5.274179 0 9.247876-1.322157 13.221573-5.288629 31.717326-33.039483 31.717326-88.533966 0-121.595123-9.262326-9.247876-13.221573-21.132842-13.221573-34.354416s5.274179-25.113764 13.221573-34.368865c6.603562-7.940169 6.603562-19.81791 0-26.435921a16.227133 16.227133 0 0 0-25.120989 0c-15.836988 15.851438-23.777157 38.328112-23.777157 60.790336s7.940169 44.931674 23.777157 60.797562c17.173595 19.810685 17.173595 50.205853-1.307708 68.708831l-0.021674 0.021675zM767.566506 981.011825h-507.477211c-68.716056 0-124.217763-55.523382-124.217763-124.224988V642.669602c-11.899416 1.336607-19.83236 3.980922-25.120989 7.954618-18.502977 17.16637-40.972427 26.435921-62.112494 25.106539-14.54373-1.329382-26.435921-6.603562-35.669348-15.844213-9.247876-10.584483-13.221573-30.402393-10.570033-55.501707 3.966472-44.946124 34.368865-48.905371 67.415573-48.905371h890.722208c29.065786 0 62.112494 5.281404 63.427426 50.220303 0 19.810685 1.322157 40.965202-10.577258 54.172326-9.262326 9.255101-21.147292 15.844213-35.669348 15.844213-21.140067 1.336607-43.602292-7.940169-62.126944-25.099315-3.966472-3.973697-13.214348-6.618011-23.777156-7.947393v214.11001c-1.322157 68.708831-56.83109 124.217763-124.217764 124.217763l-0.028899 0.01445zM180.824881 600.389467v257.705078c0 43.609517 35.669348 79.293314 79.286089 79.293314h507.469986c43.616741 0 79.300539-35.669348 79.300539-79.293314V600.389467h-666.063839 0.007225zM47.323117 630.784636c1.314932 0 2.65154 1.329382 3.966472 1.329382 6.610787 0 17.18082-2.665989 29.065786-13.221573 9.262326-9.262326 23.784382-14.54373 39.657494-18.517427H69.792566c-13.221573 0-19.825135 1.329382-21.132842 1.329382 0 1.329382-1.322157 2.65154-1.322157 6.603562-1.322157 13.221573-1.322157 19.825135 0 22.462224l-0.01445 0.01445zM904.998617 600.389467c15.836988 2.65154 30.387943 9.255101 39.643045 18.502978 11.892191 10.577258 22.476674 13.221573 29.065786 13.221573 1.336607 0 2.65154 0 3.973697-1.322157 1.322157-5.274179 1.322157-17.173595 1.322157-23.791607v-5.274179c-2.65154-1.322157-7.940169-1.322157-18.510202-1.322158h-55.501708V600.389467h0.007225zM868.014337 531.680637H159.670364c-6.603562 0-11.899416-2.65154-17.173595-7.947394-5.266955-5.274179-6.596337-10.562809-5.27418-17.16637 7.940169-62.112494 60.790337-108.3591 122.910056-108.359101h186.337482l-7.932944-29.065786c-2.65154-11.899416 0-25.120989 7.932944-35.669347 9.262326-11.892191 26.435921-19.825135 42.294584-19.825135h39.650269c15.836988 0 31.724551 7.932944 42.28736 19.825135 7.947394 10.570034 10.584483 23.791607 7.947393 35.669347l-7.947393 29.065786h195.585358c62.112494 0 114.977112 46.246606 122.91728 108.359101 1.336607 6.603562-1.307708 13.221573-5.266954 17.16637-3.995372 3.988147-9.269551 7.947394-15.858663 7.947394h-0.065024z m-679.270962-44.938899h648.875794c-13.207123-26.435921-39.63582-43.609517-71.360371-43.609517H542.922586c-6.603562 0-13.228798-2.658764-17.18082-7.932943-3.944797-5.288629-5.274179-11.899416-3.959247-18.502978l13.214348-55.501707a10.085965 10.085965 0 0 0-6.596336-2.658765H488.764711c-2.644315 0-5.288629 1.322157-6.603562 2.658765l13.221573 55.501707c1.314932 6.603562 0 13.221573-3.973697 18.502978-3.966472 5.266955-10.570034 7.932944-17.16637 7.932943H258.824937c-30.387943-1.314932-56.83109 17.173595-70.045438 43.609517h-0.036124z" fill="#8a8a8a" p-id="11637"></path></svg>';
    String complete =
        '<svg t="1695111732893" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="13604" width="32" height="32"><path d="M224.395636 210.478545C254.138182 81.035636 329.309091 11.636364 446.068364 11.636364c116.898909 0 190.184727 69.585455 215.808 198.842181h20.061091c53.76 0 98.816 40.727273 104.098909 93.44l16.616727 133.981091a34.909091 34.909091 0 0 1-69.306182 8.564364l-16.686545-134.749091a34.909091 34.909091 0 0 0-34.722909-31.418182H207.639273a34.909091 34.909091 0 0 0-34.746182 31.418182L120.250182 834.327273a34.909091 34.909091 0 0 0 34.722909 38.4h302.429091a34.909091 34.909091 0 0 1 0 69.818182H154.996364a104.727273 104.727273 0 0 1-104.192-115.223273l52.666181-522.612364a104.727273 104.727273 0 0 1 104.192-94.231273h16.756364z m71.866182 0h294.306909c-20.712727-88.808727-67.746909-129.024-144.500363-129.024-76.869818 0-125.765818 40.448-149.806546 129.024zM755.316364 1004.450909c-137.588364 0-249.134545-111.522909-249.134546-249.111273 0-137.588364 111.546182-249.134545 249.134546-249.134545s249.111273 111.546182 249.111272 249.134545-111.522909 249.111273-249.111272 249.111273z m0-58.181818a190.952727 190.952727 0 1 0 0-381.882182 190.952727 190.952727 0 0 0 0 381.905455z m-23.947637-146.850909l130.048-129.931637a29.090909 29.090909 0 1 1 41.122909 41.146182l-150.178909 150.085818a29.090909 29.090909 0 0 1-40.704 0.41891l-82.944-79.546182a29.090909 29.090909 0 1 1 40.261818-41.984l62.394182 59.810909z" fill="#bfbfbf" p-id="13605"></path></svg>';
    String phone =
        '<svg t="1695115110700" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="14709" width="32" height="32"><path d="M705.74 604.873333a53.4 53.4 0 0 0-75.426667 0l-37.713333 37.713334c-21.333333 21.333333-90.413333 0.1-150.846667-60.34S360.046667 452.76 381.413333 431.4l0.046667-0.046667 37.666667-37.666666a53.4 53.4 0 0 0 0-75.426667l-165.94-165.933333a53.393333 53.393333 0 0 0-75.42 0l-37.713334 37.713333c-27.866667 27.866667-44.84 64.52-50.46 108.946667-5.213333 41.206667-0.406667 87.42 14.28 137.333333C133.333333 536.586667 199.773333 642 290.9 733.1S487.42 890.666667 587.653333 920.126667c36.926667 10.86 71.813333 16.32 104.146667 16.32a264.333333 264.333333 0 0 0 33.213333-2.04c44.426667-5.62 81.08-22.593333 108.946667-50.46l37.713333-37.713334a53.393333 53.393333 0 0 0 0-75.42z m135.76 211.193334l-37.706667 37.713333c-42.58 42.573333-115.06 51.6-204.1 25.413333-93.506667-27.5-192.453333-90.1-278.62-176.266666s-148.766667-185.113333-176.266666-278.62c-26.186667-89.033333-17.16-161.52 25.413333-204.1l37.713333-37.706667a10.666667 10.666667 0 0 1 15.086667 0l165.933333 165.933333a10.666667 10.666667 0 0 1 0 15.086667l-37.713333 37.706667C329.113333 423.333333 324.666667 458.82 338.766667 501.073333c12.426667 37.273333 38.286667 76.813333 72.813333 111.333334s74.073333 60.386667 111.333333 72.813333c16.213333 5.406667 31.42 8.08 45.26 8.08 22.233333 0 40.946667-6.913333 54.586667-20.553333l37.706667-37.713334a10.666667 10.666667 0 0 1 15.086666 0l165.933334 165.933334a10.666667 10.666667 0 0 1 0.013333 15.1zM576 234.666667a21.333333 21.333333 0 0 1 21.333333-21.333334 213.333333 213.333333 0 0 1 213.333334 213.333334 21.333333 21.333333 0 0 1-42.666667 0c0-94.106667-76.56-170.666667-170.666667-170.666667a21.333333 21.333333 0 0 1-21.333333-21.333333z m0 128a21.333333 21.333333 0 0 1 21.333333-21.333334 85.426667 85.426667 0 0 1 85.333334 85.333334 21.333333 21.333333 0 0 1-42.666667 0 42.713333 42.713333 0 0 0-42.666667-42.666667 21.333333 21.333333 0 0 1-21.333333-21.333333z m362.666667 64a21.333333 21.333333 0 0 1-42.666667 0c0-164.666667-134-298.666667-298.666667-298.666667a21.333333 21.333333 0 0 1 0-42.666667 341.073333 341.073333 0 0 1 341.333334 341.333334z" fill="#1afa29" p-id="14710"></path></svg>';
    String map =
        '<svg t="1695115209528" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="20187" width="32" height="32"><path d="M409.6 661.333333l-256-119.466666 721.066667-345.6-345.6 721.066666-119.466667-256z m34.133333-34.133333l85.333334 187.733333 260.266666-537.6L256 541.866667l187.733333 85.333333z" fill="#1afa29" p-id="20188"></path></svg>';

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(maxHeight * 0.05), //Appbar高度
        child: CenterAppbar(
          titleName: '订单详情',
          back: true,
          center: true,
        ),
      ),
      body: Container(
        height: maxHeight,
        width: maxWidth,
        color: Colors.grey[200],
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              child: Container(
                height: 200,
                width: maxWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        '取餐码',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(top: 8, bottom: 8),
                        child: Center(
                          child: Container(
                            width: maxWidth * 0.4,
                            height: maxWidth * 0.4,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ), //取餐码
            Container(
              padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
              child: Container(
                height: maxHeight * 0.15,
                width: maxWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: maxHeight * 0.075,
                          color: Colors.transparent,
                          child: Column(
                            children: [
                              Container(
                                height: maxHeight * 0.0375,
                                child: SvgPicture.string(
                                  colorFilter: ColorFilter.mode(
                                      Colors.green, BlendMode.modulate),
                                  ordered, // 替换为您自己的 SVG 字符串
                                  width: 24.0, // 设置 SVG 图像的宽度
                                  height: 24.0, // 设置 SVG 图像的高度
                                ),
                              ),
                              Container(
                                alignment: Alignment.bottomCenter,
                                height: maxHeight * 0.0375,
                                color: Colors.transparent,
                                // padding: EdgeInsets.only(top: 8),
                                child: Text(
                                  '已下单',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.green),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ), //已下单
                    Container(
                      height: maxHeight * 0.075,
                      color: Colors.transparent,
                      child: Container(
                        padding:
                            EdgeInsets.only(top: maxHeight * 0.075 / 2 / 2 / 2),
                        child: Text('------'),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: maxHeight * 0.075,
                          color: Colors.transparent,
                          child: Column(
                            children: [
                              Container(
                                height: maxHeight * 0.0375,
                                child: SvgPicture.string(
                                  cooking, // 替换为您自己的 SVG 字符串
                                  width: 24.0, // 设置 SVG 图像的宽度
                                  height: 24.0, // 设置 SVG 图像的高度
                                ),
                              ),
                              Container(
                                alignment: Alignment.bottomCenter,
                                height: maxHeight * 0.0375,
                                color: Colors.transparent,
                                // padding: EdgeInsets.only(top: 8),
                                child: const Text(
                                  '制作中',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ), //制作中
                    Container(
                      height: maxHeight * 0.075,
                      color: Colors.transparent,
                      child: Container(
                        padding:
                            EdgeInsets.only(top: maxHeight * 0.075 / 2 / 2 / 2),
                        child: Text('------'),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: maxHeight * 0.075,
                          color: Colors.transparent,
                          child: Column(
                            children: [
                              Container(
                                height: maxHeight * 0.0375,
                                child: SvgPicture.string(
                                  complete, // 替换为您自己的 SVG 字符串
                                  width: 24.0, // 设置 SVG 图像的宽度
                                  height: 24.0, // 设置 SVG 图像的高度
                                ),
                              ),
                              Container(
                                alignment: Alignment.bottomCenter,
                                height: maxHeight * 0.0375,
                                color: Colors.transparent,
                                // padding: EdgeInsets.only(top: 8),
                                child: const Text(
                                  '请取餐',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ), // 请取餐
                  ],
                ),
              ),
            ), //制作状态
            Container(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
              child: Container(
                // height: maxHeight * 0.3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      height: maxHeight * 0.075,
                      // color: Colors.transparent,
                      child:Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color.fromRGBO(238, 238, 238, 1),
                              width: 0.5,
                            ),
                          ),
                        ),
                        child:  Row(
                          children: [
                            const Text('LINLEE林里·十字商都店',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    height:maxHeight * 0.04,
                                    width: maxHeight * 0.04,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Center(
                                      child:SvgPicture.string(
                                        phone, // 替换为您自己的 SVG 字符串
                                        width: 18.0,
                                        height: 18.0,
                                      ),
                                    ),
                                  ),
                                  const Padding(padding: EdgeInsets.only(left: 8),),
                                  Container(
                                    height:maxHeight * 0.04,
                                    width: maxHeight * 0.04,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Center(
                                      child:SvgPicture.string(
                                        map, // 替换为您自己的 SVG 字符串
                                        width: 21.0,
                                        height: 21.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),  //店名头部
                    Container(
                     padding: EdgeInsets.only(left: 8, right: 8),

                     child: ListView(
                       shrinkWrap: true,
                       physics: NeverScrollableScrollPhysics(),
                       children: [
                         Container(
                           padding: EdgeInsets.only(top: 8,left: 8,right: 8),
                           child: Container(
                             height: maxHeight * 0.1,
                             width: maxWidth,
                             color: Color.fromRGBO(242, 244, 251, 1),
                           ),
                         ),
                       ],
                     ),
                   ), //订单饮品信息
                    Container(
                      padding: EdgeInsets.only(left: 8, right: 8,top: 8),
                      height: maxHeight * 0.075,

                      child:Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: Color.fromRGBO(238, 238, 238, 1),
                              width: 0.5,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                alignment:Alignment.centerRight,
                                // color: Color.fromRGBO(91, 137, 254, 0.2),
                                child: Container(
                                  alignment: Alignment.bottomRight,
                                  height: maxHeight * 0.03,
                                  // color:  Colors.red,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        alignment: Alignment.bottomRight,
                                        height: maxHeight * 0.03,
                                        // color: Colors.blue,
                                        child:  Text('合计：',style: TextStyle(fontSize: 12),),
                                      ),
                                      Container(
                                        alignment: Alignment.bottomRight,
                                        height: maxHeight * 0.03,
                                        // color: Colors.blue,
                                        child: Text('￥',style: TextStyle(fontSize: 12),),
                                      ),
                                      Container(
                                        alignment: Alignment.bottomRight,
                                        height: maxHeight * 0.03,
                                        // color: Colors.blue,
                                        child: Text('36',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),  //合计信息
                  ],
                ),
              ),
            ), //订单列表
            Container(), //订单信息
            Container(), //退款文字
          ],
        ),
      ),
    );
  }
}
