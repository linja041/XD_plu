package idris.com.yiling_plugin.handler;

import java.util.HashMap;
import java.util.List;

import io.flutter.plugin.common.MethodChannel;

public class YiLingResponseHandler {
    private static MethodChannel channel = null;

    /**
     *
     * @param channel
     */
    public static void setMethodChannel(MethodChannel channel) {
        YiLingResponseHandler.channel = channel;
    }

    /**
     * 设备断开
     * @param result
     */
    public static void searchStopped(String result){
        channel.invokeMethod("searchStopped",result);
    }

    /**
     * 扫描结果
     * @param result
     */
    public static void sendScanResult(HashMap<String,Object> result){
        channel.invokeMethod("sendScanResult",result);
    }

    /**
     * 开始检测
     * @param result
     */
    public static void startJC(String result){
        channel.invokeMethod("startJC",result);
    }

    /**
     * 认证结果
     * @param result
     */
    public static void autoResult(String result){
        System.out.println("--autoResult--");
        channel.invokeMethod("autoResult",result);
    }

    /**
     * 电量
     * @param result
     */
    public static void sendBtResult(double result){
        channel.invokeMethod("sendBtResult",result);
    }

    /**
     * 存储空间
     * @param result
     */
    public static void sendTFResult(int result){
        channel.invokeMethod("sendTFResult",result);
    }

    /**
     * RTC
     * @param result
     */
    public static void sendRTCResult(String result){
        channel.invokeMethod("sendRTCResult",result);
    }

    /**
     * 心电结果
     * @param result
     */
    public static void startXindian(HashMap<String,Object> result){
        channel.invokeMethod("startXindian",result);
    }

    /**
     * 存卡结果
     * @param result
     */
    public static void cunkaResult(String result){
        channel.invokeMethod("cunkaResult",result);
    }

    /**
     * wifi结果
     * @param result
     */
    public static void wifiResult(String result){
        channel.invokeMethod("wifiResult",result);
    }

    /**
     * wifi设置名称结果
     * @param result
     */
    public static void wifiSetNameResult(String result){
        channel.invokeMethod("wifiSetNameResult",result);
    }

    /**
     * 启动模块
     * @param result
     */
    public static void startStatusResult(String result){
        channel.invokeMethod("startStatusResult",result);
    }

    /**
     * wifi设置密码结果
     * @param result
     */
    public static void wifiSetPSWResult(String result){
        channel.invokeMethod("wifiSetPSWResult",result);
    }

    /**
     * 连接wifi结果
     * @param result
     */
    public static void connWifiResult(String result){
        channel.invokeMethod("connWifiResult",result);
    }

    /**
     * WiFi模块状态结果
     * @param result
     */
    public static void WifiStatusResult(String result){
        channel.invokeMethod("WifiStatusResult",result);
    }

    /**
     * 连接服务器命令回调
     * @param result
     */
    public static void connIpResult(String result){
        channel.invokeMethod("connIpResult",result);
    }

    /**
     * 连接服务器命令回调
     * @param result
     */
    public static void connIpStatusResult(String result){
        channel.invokeMethod("connIpStatusResult",result);
    }

    /**
     * 读卡信息
     * @param result
     */
    public static void kaResult(List<String> result){
        channel.invokeMethod("kaResult",result);
    }



    /**
     * 跳转联系医生
     * @param result
     */
    public static void LXYSOrder(String result){
        channel.invokeMethod("LXYSOrder",result);
    }


    /**
     * 跳转上传文件
     * @param result
     */
    public static void SCWJOrder(String result){
        channel.invokeMethod("SCWJOrder",result);
    }

}
