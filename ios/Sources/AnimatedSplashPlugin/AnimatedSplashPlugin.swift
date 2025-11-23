import Foundation
import Capacitor
import UIKit

@objc(AnimatedSplashPlugin)
public class AnimatedSplashPlugin: CAPPlugin {
    
    @objc func hide(_ call: CAPPluginCall) {
        DispatchQueue.main.async {
            let duration = call.getInt("duration") ?? 450
            
            if let splashVC = SplashViewController.instance {
                splashVC.closeSplash(duration: duration)
            }
            
            call.resolve()
        }
    }
}