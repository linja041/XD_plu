package com.ecg.ecgalgorithm;

public class ecglib {

    // Used to load the 'native-lib' library on application startup.
//    static {
//        System.loadLibrary("native-lib");
//    }


    public static int test() {
        int ret = 0, i = 40000;
        int[] demo = {2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000,
                2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000,
                2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000,
                2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000,
                2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000,
                2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000,
                2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000,
                2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000,
                2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000,
                2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000,
                2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000,
                2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000,
                2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000,
                2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000,
                2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000,
                2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000,
                2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000,
                2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000,
                2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2008,
                2016, 2016, 2016, 2024, 2032, 2048, 2064, 2064, 2064, 2072, 2080,
                2080, 2080, 2088, 2096, 2104, 2112, 2112, 2112, 2112, 2112, 2112,
                2104, 2096, 2088, 2080, 2080, 2080, 2072, 2064, 2064, 2064, 2048,
                2032, 2032, 2032, 2016, 2000, 2000, 2000, 2000, 2000, 2000, 2000,
                2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000,
                2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000,
                2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000,
                2000, 2000, 2000, 2000, 1992, 1984, 1976, 1968, 1960, 1952, 1944,
                1936, 1944, 1952, 2016, 2080, 2136, 2192, 2256, 2320, 2376, 2432,
                2488, 2544, 2568, 2592, 2536, 2480, 2424, 2368, 2304, 2240, 2184,
                2128, 2072, 2016, 1968, 1920, 1928, 1936, 1944, 1952, 1960, 1968,
                1984, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000,
                2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000,
                2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000,
                2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000,
                2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000,
                2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000,
                2008, 2016, 2024, 2032, 2032, 2032, 2048, 2064, 2064, 2064, 2072,
                2080, 2088, 2096, 2104, 2112, 2112, 2112, 2120, 2128, 2136, 2144,
                2152, 2160, 2160, 2160, 2160, 2160, 2168, 2176, 2176, 2176, 2184,
                2192, 2192, 2192, 2192, 2200, 2208, 2208, 2208, 2208, 2208, 2208,
                2208, 2200, 2192, 2192, 2192, 2184, 2176, 2176, 2176, 2168, 2160,
                2160, 2160, 2144, 2128, 2128, 2128, 2128, 2128, 2112, 2096, 2088,
                2080, 2072, 2064, 2064, 2064, 2048, 2032, 2024, 2016, 2016, 2016,
                2008, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000,
                2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000,
                2000, 2000, 2000, 2000
        };
        int[] Output = new int[12];
        short[] diags = {0};
        short[] isHeart = {0};
        short[] diagcd = new short[10];
        short[] ecgBeatData = new short[12 * 600];
        short[] pqrst = new short[6];
        int[] input = new int[9];
        //ret = ecg_GetDiagResult((short) 1, diags, diagcd);
        //ecg_ProcessDataLead(input, Output, (short) 1,isHeart);
        while ((i--) > 0) {
            for (int k = 0; k < 9; k++) {
                input[k] = demo[i % 500];
            }
            //   ecg_ProcessDataLead(input, Output, (short) 0,isHeart);
            //   ret = ecg_GetDiagResult((short) 0, diags,diagcd);
            if (ret > 0) {//出报告
                //Log.i("", "diags=" + diags[0]);
                //       ret = ecg_GetSTResult(ecgBeatData,pqrst);//重分析
                if (ret > 0) {
                    i = ecgBeatData[6];
//                  for (int j = 0; j<60;j++){
//                      //Log.i("", "ecgBeatData=" + ecgBeatData[j]);
//                  }
                }
                return i;
            }
        }
        return 0;
        //Log.i("", "test() end");
        /*
        int ret = 0, i = 40000;
        int[] input = {2048,2048,2048,2048,2048,2048,2048,2048,2048};
        int[] Output = new int[12];
        short[] diags = { 0 };
        short[] isHeart = { 0 };
        short[] diagcd = new short[10];
        while((i--) > 0){
            ecg_ProcessDataLead(input, Output, (short) 0,// 2
                    isHeart);
            ret = ecg_GetDiagResult((short) 0, diags,
                    diagcd);
            if (ret > 0){
                //Log.i("", "diags=" + diags[0]);
                return i;
            }
        }
        return 0;
        //Log.i("", "test() end");
      */
    }

    /**
     * A native method that is implemented by the 'native-lib' native library,
     * which is packaged with this application.
     */
    public native String stringFromJNI();
    //public native  void testadd1(int a,int b,int c[] );

    public native void nativeSetNhlFilter(short[] filter, short realsamp);

    public native void ecg_ProcessDataLead(int[] raw, int[] wave,short diagstflag, short[] isHeartBeat);
}
