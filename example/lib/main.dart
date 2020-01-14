import 'package:flutter/material.dart';
import 'dart:async';

import 'package:oktoast/oktoast.dart';
import 'package:flutter/services.dart';
import 'package:yiling_plugin/yiling_plugin.dart' as yl;
import 'package:yiling_plugin_example/main2.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  Widget build(BuildContext context) {
    return OKToast(
        child:MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              title: const Text('Plugin example app'),
            ),
            body: Test(),
          ),
        )
    );
  }
}

class Test extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return TestState();
  }

}

class TestState extends State<Test>{

  String mac = "";
  String ele = "";
  String tf = "";
  String rtc = "";
  String wifiResult = "";
  String name;
  String pas;
  bool xinDian = false;
  bool wifi = false;
  bool cunka = false;
  String cunkaResult = "";
  List<String> ka = new List();

  @override
  void initState() {
    super.initState();
    initBluetooth();
//    initWrite();
//    initRead();
    yl.responseFromAuto.listen((data){
      showToast(data.toString());
    });

    yl.responseFromScan.listen((data){
      print("responseFromScan=====>"+data.address);
      setState(() {
        mac = data.address;
      });
      yl.stopScan();
      yl.setAuto(mac);
    });

    yl.responseFromStartJC.listen((data){

    });

    yl.responseFromBt.listen((data){
      print("getBt=====>"+data.toStringAsPrecision(3));
      setState(() {
        ele = (data*10).toStringAsPrecision(3)+"%";
      });
    });

    yl.responseFromTF.listen((data){
      print("getTF=====>"+data.toString());
      setState(() {
        tf = data+"字节";
      });
    });

    //心电数据
    yl.responseFromXindian.listen((data){
      print("responseFromXindian=====>" + data.data1.toString());
    });
    //跳转到联系医生监听
    yl.responseFromGoLXYS.listen((data){
      if(data == "gotoLXYS"){
        showToast(data);
      }
    });

    yl.responseFromGoSCWJ.listen((data){
      if(data == "gotoSCWJ"){
        showToast(data);
//        Navigator.push(context, new MaterialPageRoute(builder: (_) {
//          return new Test2();
//        }));
      }
    });

    yl.responseFromRTC.listen((data){
      setState(() {
        rtc = data;
      });
    });

    yl.responseFromWiFi.listen((data){
      setState(() {
        wifiResult = data;
      });
    });

    yl.responseFromCunka.listen((data){
      setState(() {
        cunkaResult = data;
      });
    });

    yl.responseFromDuka.listen((data){
      setState(() {
        ka = data.ka;
      });
    });

//设置WiFi名称监听
    yl.responseFromSetWiFiName.listen((data){
      setState(() {
        name = data;
      });
    });

//设置WiFi密码监听
    yl.responseFromSetWiFiPSW.listen((data){
      setState(() {
        pas = data;
      });
    });

//连接WiFi监听
    yl.responseFromConnWifi.listen((data){
      setState(() {
        ele = data;
      });
    });

//连接WiFi监听
    yl.responseFromWifiStatus.listen((data){
      setState(() {
        ele = data;
      });
    });
//连接服务器命令结果(成功返回“连接到服务器成功”/失败返回“连接到服务器失败”)
    yl.responseFromConnIp.listen((data){
      print("ConnIpResult===========" + data.toString());
      showToast(data.toString());
    });

//与服务器连接状态(返回“连接正常”/“连接异常”)
    yl.responseFromConnIpStatus.listen((data){
      print("ConnIpStatusResult===========" + data.toString());
    });
  }

  Future<void> initBluetooth() async {
    try {
      bool result = await checkBle();
      if(result == false) {
        var res = await yl.requestBlePermissionWay();
        result = await checkBle();
      }
    } on PlatformException {
    }
  }

  Future<bool> checkBle() async {
    bool result = await yl.checkBlePermissionWay();
    return result;
  }

  Future<void> initWrite() async {
    try {
      bool result = await checkWrite();
      if(result == false) {
        var res = await yl.requestWritePermissionWay();
        result = await checkWrite();
      }
    } on PlatformException {
    }
  }

  Future<bool> checkWrite() async{
    bool result = await yl.checkWritePermissionWay();
    return result;
  }

  Future<void> initRead() async {
    try {
      bool result = await checkRead();
      if(result == false) {
        var res = await yl.requestReadPermissionWay();
        result = await checkRead();
      }
    } on PlatformException {
    }
  }

  Future<bool> checkRead() async{
    bool result = await yl.checkReadPermissionWay();
    return result;
  }

  int canTap = 0;
  void startScan(){
    if(canTap != 0){
      yl.closeDevice(mac);

      yl.startScan().then((result){
        showToast("startScan");
        print("startScanResult====>"+result.toString());
        setState(() {
          mac = "正在搜索设备...";
        });
      });
    }else{
      yl.startScan().then((result){
        showToast("startScan");
        print("startScanResult====>"+result.toString());
        setState(() {
          mac = "正在搜索设备...";
        });
      });
    }
    setState(() {
      canTap++;
    });
  }

  void stopScan(){
    yl.stopScan().then((result){
      showToast("startScan");
      print("startScanResult====>"+result.toString());
    });
  }

  void getBt(){
    yl.getBt().then((result){
      showToast("getBt");
      print("getBt====>"+result.toString());
    });
  }

  void getTF(){
    yl.getTF().then((result){
      showToast("getTF");
      print("stopXinDian====>"+result.toString());
    });
  }

  void syncRTC(){
    yl.syncRTC().then((result){
      showToast("syncRTC");
      print("syncRTC====>"+result.toString());
    });
  }

  void goXinDian(
      {String filename,
        String name,
        int sex,
        int age,
        int mode,
        String docName,
        String divName,
        String ava,
        String divMac}
        ){
    yl.goXinDian(fileName: filename ,
      name: name ,
      sex: sex ,
      age: age ,
      mode: mode ,
      docName: docName ,
      divName: divName,
      ava: ava,
      divMac :divMac,
    ).then((result){
    });
  }

  //1、WiFi模块上电
  void startWiFi(){
    setState(() {
      wifi = true;
      wifiResult = "wifi连接中...";
    });
    yl.startWiFi().then((result){
      showToast("startWiFi");
      print("startWiFi====>"+result.toString());

    });
  }
  //1、设置配网模式
  void startPeiwang(){
    yl.startPeiwang().then((result){

    });
  }
  //2、检查WiFi模块上电状态
  void wifiStatus(){
    yl.wiFiEle().then((result){

      print("wiFiEle"+result.toString());
    });
  }
  String wifiName;
  //3、配置WiFi名称
  void wifiname(){
    if(wifiName == null){
      showToast("wifi名称为空");
      return;
    }
    yl.setWifiName(wifiName: wifiName).then((result){
      print("wifiname:   "+result.toString());
    });
  }
  String wifiPsw;
  //4、配置WiFi密码
  void wifiPassword(){
    if(wifiPsw == null){
      showToast("wifi密码为空");
      return;
    }
    yl.setWifiPSW(wifiPSW: wifiPsw).then((result){

      print("wifiPassword:   "+result.toString());
    });
  }

  //5、设备连网
  void connWifi(){
    yl.connWiFi();
  }

  //关闭WiFi模块
  void stopWiFi(){
    yl.stopWiFi().then((result){
      setState(() {
        wifi = false;
      });
      showToast("stopWiFi");
      print("stopWiFi====>"+result.toString());

    });
  }

  String ip1,ip2,ip3,ip4,duankou;
  //设置服务器端口
  void setIp(){
    if(ip1 == null){
      showToast("ip1为空");
      return;
    }
    if(ip2 == null){
      showToast("ip2为空");
      return;
    }
    if(ip3 == null){
      showToast("ip3为空");
      return;
    }
    if(ip4 == null){
      showToast("ip4为空");
      return;
    }
    if(duankou == null){
      showToast("端口为空");
      return;
    }
    yl.setIp(ip1: ip1,ip2: ip2,ip3: ip3,ip4: ip4,duankou: duankou);
  }

  //查看与服务器的连接状态
  void quesyIpConn(){
    yl.quesyIpConn();
  }

  //查看与服务器的连接状态
  void removeDiv (){
    yl.closeDevice(mac);
  }

  void stopCunka(){
    yl.stopCunKa().then((result){
      setState(() {
        cunka = false;
      });
      showToast("stopCunka");
    });
  }

  int fileName = 20191203;
  void startCunka(String filename,String name,int sex,int age,int mode)async{
    setState(() {
      cunka = true;
      fileName++;
    });
    await yl.startCunKa(fileName: filename , name: name , sex: sex , age: age , mode: mode);
    showToast("startCunka");
  }

  void duka() {
    yl.duKa().then((value){
    });
    showToast("duka");
  }



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Text(
                    "已找到设备：" + mac
                ),
              ),
              Center(
                child: Text(
                  "wifi: " + wifiResult??"",
                ),
              ),
              Center(
                child: Text(
                  "设置名称: " + name.toString()??"",
                ),
              ),
              Center(
                child: Text(
                  "设置密码: " + pas.toString()??"",
                ),
              ),
              Container(
                width: 150,
                height: 45,
                margin: EdgeInsets.only(bottom: 5.0),
                decoration: new BoxDecoration(
                  border: new Border.all(color: Color(0xFFFF0000), width: 2.5), // 边色与边宽度
                  borderRadius: new BorderRadius.circular((5.0)), // 圆角
                ),
                child: Center(
                  child: GestureDetector(
                    onTap: startScan,
                    child: Text("开始扫描"),
                  ),
                ),
              ),
              Container(
                width: 150,
                height: 45,
                margin: EdgeInsets.only(bottom: 5.0),
                decoration: new BoxDecoration(
                  border: new Border.all(color: Color(0xFFFF0000), width: 2.5), // 边色与边宽度
                  borderRadius: new BorderRadius.circular((5.0)), // 圆角
                ),
                child: Center(
                  child: GestureDetector(
                    onTap: (){goXinDian(
                        filename:"20191222",
                        name:"林骏雄",
                        sex:1,
                        age:20,
                        mode:0,
                        docName:"林医生",
                        divName:"8848",
                        ava:"http://47.112.202.101/upload/image/201912/8ac4c536-6e47-4bd6-b2db-ee0fa8abb1c0.jpg",
                        divMac: mac
                    );},
                    child: Text("开始检测"),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 150,
                    height: 45,
                    margin: EdgeInsets.only(bottom: 5.0),
                    decoration: new BoxDecoration(
                      border: new Border.all(color: Color(0xFFFF0000), width: 2.5), // 边色与边宽度
                      borderRadius: new BorderRadius.circular((5.0)), // 圆角
                    ),
                    child: Center(
                      child: GestureDetector(
                        onTap: wifi?stopWiFi:startWiFi,
                        child: wifi?Text("关闭WiFi模块"):Text("开启WiFi模块"),
                      ),
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 45,
                    margin: EdgeInsets.only(bottom: 5.0),
                    decoration: new BoxDecoration(
                      border: new Border.all(color: Color(0xFFFF0000), width: 2.5), // 边色与边宽度
                      borderRadius: new BorderRadius.circular((5.0)), // 圆角
                    ),
                    child: Center(
                      child: GestureDetector(
                        onTap: startPeiwang,
                        child: Text("设置配网模式"),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 45,
                padding: EdgeInsets.all(0.0),
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                child: Center(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'WiFi名称',
                        labelStyle: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      onChanged: (String content) {
                        setState(() {
                          wifiName = content;
                        });
                      },
                    )
                ),
              ),
              Container(
                height: 45,
                padding: EdgeInsets.all(0.0),
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                child: Center(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'WiFi密码',
                        labelStyle: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      onChanged: (String content) {
                        setState(() {
                          wifiPsw = content;
                        });
                      },
                    )
                ),
              ),
              Row(
                children: <Widget>[
                  Container(
                    height: 45,
                    width: 45,
                    padding: EdgeInsets.all(0.0),
                    margin: EdgeInsets.only(left: 20.0,right: 5.0),
                    child: Center(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'ipv41',
                            labelStyle: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                          onChanged: (String content) {
                            setState(() {
                              ip1 = content;
                            });
                          },
                        )
                    ),
                  ),
                  Container(
                    height: 45,
                    width: 45,
                    padding: EdgeInsets.all(0.0),
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Center(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'ipv42',
                            labelStyle: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                          onChanged: (String content) {
                            setState(() {
                              ip2 = content;
                            });
                          },
                        )
                    ),
                  ),
                  Container(
                    height: 45,
                    width: 45,
                    padding: EdgeInsets.all(0.0),
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Center(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'ipv43',
                            labelStyle: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                          onChanged: (String content) {
                            setState(() {
                              ip3 = content;
                            });
                          },
                        )
                    ),
                  ),
                  Container(
                    height: 45,
                    width: 45,
                    padding: EdgeInsets.all(0.0),
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Center(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'ipv44',
                            labelStyle: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                          onChanged: (String content) {
                            setState(() {
                              ip4 = content;
                            });
                          },
                        )
                    ),
                  ),
                  Container(
                    height: 45,
                    width: 45,
                    padding: EdgeInsets.all(0.0),
                    child: Center(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: '端口',
                            labelStyle: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                          onChanged: (String content) {
                            setState(() {
                              duankou = content;
                            });
                          },
                        )
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 40,
                    margin: EdgeInsets.only(bottom: 5.0,right: 10.0,top: 5.0),
                    decoration: new BoxDecoration(
                      border: new Border.all(color: Color(0xFFFF0000), width: 2.5), // 边色与边宽度
                      borderRadius: new BorderRadius.circular((5.0)), // 圆角
                    ),
                    child: Center(
                      child: GestureDetector(
                        onTap: wifiname,
                        child: Text("set name"),
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    margin: EdgeInsets.only(bottom: 5.0,right: 10.0,top: 5.0),
                    decoration: new BoxDecoration(
                      border: new Border.all(color: Color(0xFFFF0000), width: 2.5), // 边色与边宽度
                      borderRadius: new BorderRadius.circular((5.0)), // 圆角
                    ),
                    child: Center(
                      child: GestureDetector(
                        onTap: wifiPassword,
                        child: Text("set password"),
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    margin: EdgeInsets.only(bottom: 5.0,right: 10.0,top: 5.0),
                    decoration: new BoxDecoration(
                      border: new Border.all(color: Color(0xFFFF0000), width: 2.5), // 边色与边宽度
                      borderRadius: new BorderRadius.circular((5.0)), // 圆角
                    ),
                    child: Center(
                      child: GestureDetector(
                        onTap: connWifi,
                        child: Text("conn wifi"),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 40,
                width: 100,
                margin: EdgeInsets.only(bottom: 5.0,right: 10.0,top: 5.0),
                decoration: new BoxDecoration(
                  border: new Border.all(color: Color(0xFFFF0000), width: 2.5), // 边色与边宽度
                  borderRadius: new BorderRadius.circular((5.0)), // 圆角
                ),
                child: Center(
                  child: GestureDetector(
                    onTap: setIp,
                    child: Text("conn Ip"),
                  ),
                ),
              ),
              Container(
                height: 40,
                width: 100,
                margin: EdgeInsets.only(bottom: 5.0,right: 10.0,top: 5.0),
                decoration: new BoxDecoration(
                  border: new Border.all(color: Color(0xFFFF0000), width: 2.5), // 边色与边宽度
                  borderRadius: new BorderRadius.circular((5.0)), // 圆角
                ),
                child: Center(
                  child: GestureDetector(
                    onTap: quesyIpConn,
                    child: Text("connIpStatus"),
                  ),
                ),
              ),
              Container(
                height: 40,
                width: 100,
                margin: EdgeInsets.only(bottom: 5.0,right: 10.0,top: 5.0),
                decoration: new BoxDecoration(
                  border: new Border.all(color: Color(0xFFFF0000), width: 2.5), // 边色与边宽度
                  borderRadius: new BorderRadius.circular((5.0)), // 圆角
                ),
                child: Center(
                  child: GestureDetector(
                    onTap: removeDiv,
                    child: Text("移除设备"),
                  ),
                ),
              ),
            ],
          )
      ),
    );
  }

}