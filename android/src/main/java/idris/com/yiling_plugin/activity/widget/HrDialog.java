package idris.com.yiling_plugin.activity.widget;

import android.app.Dialog;
import android.content.Context;
import android.graphics.Color;
import android.graphics.Point;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.Display;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.widget.TextView;

import androidx.annotation.NonNull;

import idris.com.yiling_plugin.R;

public class HrDialog extends Dialog{

    private TextView mTvNormal,mTvNowHr,mTvAdvHr,mTvMinHr,mTvMin2Hr,mTvMaxHr,mBtnOk;

    private boolean isNormal;
    private String nowHr;
    private String advHr;
    private String minHr;
    private String min2Hr;
    private String maxHr;
    private String btnOk;

    public HrDialog(@NonNull Context context) {
        super(context);
    }

    public HrDialog(@NonNull Context context,int themeId) {
        super(context,themeId);
    }

    public HrDialog setNormal(boolean normal) {
        isNormal = normal;
        return this;
    }

    public HrDialog setNowHr(String nowHr) {
        this.nowHr = nowHr;
        return this;
    }

    public HrDialog setAdvHr(String advHr) {
        this.advHr = advHr;
        return this;
    }

    public HrDialog setMinHr(String minHr) {
        this.minHr = minHr;
        return this;
    }

    public HrDialog setMin2Hr(String min2Hr) {
        this.min2Hr = min2Hr;
        return this;
    }

    public HrDialog setMaxHr(String maxHr) {
        this.maxHr = maxHr;
        return this;
    }


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.dialog_hr);

        //设置宽度
        WindowManager m = getWindow().getWindowManager();
        Display d = m.getDefaultDisplay();
        WindowManager.LayoutParams p = getWindow().getAttributes();
        Point size = new Point();
        d.getSize(size);
        p.width = (int)(size.x * 0.95);
        getWindow().setAttributes(p);

        //背景透明
        Window window = getWindow();
        window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));

        mTvNormal = findViewById(R.id.tv_normal);
        mTvNowHr = findViewById(R.id.tv_nowHr);
        mTvAdvHr = findViewById(R.id.tv_advHr);
        mTvMinHr = findViewById(R.id.tv_minHr);
        mTvMin2Hr = findViewById(R.id.tv_minHr2);
        mTvMaxHr = findViewById(R.id.tv_maxHr);
        mBtnOk = findViewById(R.id.btn_ok);

        if(!isNormal){
            mTvNormal.setBackground(new ColorDrawable(Color.RED));
            mTvNormal.setText("心率异常");
        }

        if(!TextUtils.isEmpty(nowHr)){
            mTvNowHr.setText(nowHr);
        }
        if(!TextUtils.isEmpty(advHr)){
            mTvAdvHr.setText(advHr);
        }
        if(!TextUtils.isEmpty(minHr)){
            mTvMinHr.setText(minHr);
        }
        if(!TextUtils.isEmpty(min2Hr)){
            mTvMin2Hr.setText(min2Hr);
        }
        if(!TextUtils.isEmpty(maxHr)){
            mTvMaxHr.setText(maxHr);
        }
        mBtnOk.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                dismiss();
            }
        });
    }


}
