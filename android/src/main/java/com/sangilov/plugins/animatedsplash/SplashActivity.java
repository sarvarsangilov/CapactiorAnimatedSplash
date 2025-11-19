package com.sangilov.plugins.animatedsplash;

import android.app.Activity;
import android.content.res.Configuration;
import android.graphics.Color;
import android.os.Bundle;
import android.view.View;
import android.view.ViewPropertyAnimator;
import android.widget.FrameLayout;

import com.airbnb.lottie.LottieAnimationView;
import com.airbnb.lottie.LottieDrawable;

public class SplashActivity extends Activity {

    public static SplashActivity instance;
    private LottieAnimationView lottie;

    private String animation = "splash.json";
    private boolean loop = true;
    private String lightBackground = "#FFFFFF";
    private String darkBackground = "#000000";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        instance = this;

        String anim = getIntent().getStringExtra("animation");
        if (anim != null) animation = anim;

        Boolean lp = getIntent().getBooleanExtra("loop", true);
        loop = lp;

        String lightBg = getIntent().getStringExtra("lightBackground");
        if (lightBg != null) lightBackground = lightBg;

        String darkBg = getIntent().getStringExtra("darkBackground");
        if (darkBg != null) darkBackground = darkBg;

        getWindow().getDecorView().setSystemUiVisibility(
                View.SYSTEM_UI_FLAG_FULLSCREEN |
                View.SYSTEM_UI_FLAG_HIDE_NAVIGATION |
                View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY
        );

        overridePendingTransition(0, 0);

        FrameLayout root = new FrameLayout(this);
        root.setLayoutParams(new FrameLayout.LayoutParams(
                FrameLayout.LayoutParams.MATCH_PARENT,
                FrameLayout.LayoutParams.MATCH_PARENT
        ));
        root.setBackgroundColor(getBackgroundColor());

        lottie = new LottieAnimationView(this);
        lottie.setLayoutParams(new FrameLayout.LayoutParams(
                FrameLayout.LayoutParams.MATCH_PARENT,
                FrameLayout.LayoutParams.MATCH_PARENT
        ));
        lottie.setAnimation(animation);
        lottie.setRepeatCount(loop ? LottieDrawable.INFINITE : 0);
        lottie.playAnimation();

        root.addView(lottie);
        setContentView(root);
    }

    private int getBackgroundColor() {
        boolean isDark = (getResources().getConfiguration().uiMode &
                Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
        String color = isDark ? darkBackground : lightBackground;
        return Color.parseColor(color);
    }

    public void closeSplash(int duration) {
        runOnUiThread(() -> {
            ViewPropertyAnimator anim = lottie.animate()
                    .alpha(0f)
                    .setDuration(duration)
                    .withEndAction(this::finish);
            anim.start();
        });
    }

    public void closeSplash() {
        closeSplash(450);
    }
}
