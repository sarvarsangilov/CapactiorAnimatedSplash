package com.sangilov.plugins.animatedsplash;

import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin; 



@CapacitorPlugin(name = "AnimatedSplash")
public class AnimatedSplashPlugin extends Plugin {

    @PluginMethod
public void hide(PluginCall call) {
    if (SplashActivity.instance != null) {
        int duration = call.getInt("duration", 450); 
        SplashActivity.instance.closeSplash(duration);
    }
    call.resolve();
}
}
