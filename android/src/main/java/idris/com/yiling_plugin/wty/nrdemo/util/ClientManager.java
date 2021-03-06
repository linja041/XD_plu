package idris.com.yiling_plugin.wty.nrdemo.util;

import com.inuker.bluetooth.library.BluetoothClient;

import idris.com.yiling_plugin.wty.nrdemo.MyApplication;

/**
 * Created by dingjikerbo on 2016/8/27.
 */
public class ClientManager {

    private static BluetoothClient mClient;

    public static BluetoothClient getClient() {
        if (mClient == null) {
            synchronized (ClientManager.class) {
                if (mClient == null) {
                    mClient = new BluetoothClient(MyApplication.getInstance());
                }
            }
        }
        return mClient;
    }
}
