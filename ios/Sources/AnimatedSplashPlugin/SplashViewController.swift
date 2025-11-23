import UIKit
import Lottie

public class SplashViewController: UIViewController {
    
    public static var instance: SplashViewController?
    
    private var animationView: LottieAnimationView?
    
    private var animation: String = "splash.json"
    private var darkAnimation: String?
    private var loop: Bool = true
    private var lightBackground: String = "#FFFFFF"
    private var darkBackground: String = "#000000"
    
    // Initializer with parameters
    public init(animation: String?,
                darkAnimation: String?,
                loop: Bool,
                lightBackground: String?,
                darkBackground: String?) {
        
        super.init(nibName: nil, bundle: nil)
        
        if let anim = animation {
            self.animation = anim
        }
        
        self.darkAnimation = darkAnimation
        self.loop = loop
        
        if let lightBg = lightBackground {
            self.lightBackground = lightBg
        }
        
        if let darkBg = darkBackground {
            self.darkBackground = darkBg
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        SplashViewController.instance = self
        
        // Set background color based on theme
        view.backgroundColor = getBackgroundColor()
        
        // Create and configure Lottie animation
        let animationFileName = getAnimationByTheme()
        animationView = LottieAnimationView(name: animationFileName)
        
        guard let animationView = animationView else { return }
        
        animationView.frame = view.bounds
        animationView.contentMode = .scaleAspectFill
        animationView.loopMode = loop ? .loop : .playOnce
        animationView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        view.addSubview(animationView)
        
        animationView.play()
    }
    
    public override var prefersStatusBarHidden: Bool {
        return true
    }
    
    public override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    private func getBackgroundColor() -> UIColor {
        let colorString = isDarkMode() ? darkBackground : lightBackground
        return UIColor(hexString: colorString) ?? .white
    }
    
    private func getAnimationByTheme() -> String {
        if isDarkMode() {
            return darkAnimation ?? animation
        } else {
            return animation
        }
    }
    
    private func isDarkMode() -> Bool {
        if #available(iOS 13.0, *) {
            return traitCollection.userInterfaceStyle == .dark
        }
        return false
    }
    
    public func closeSplash(duration: Int) {
        let durationInSeconds = Double(duration) / 1000.0
        
        UIView.animate(withDuration: durationInSeconds, animations: {
            self.view.alpha = 0
        }) { _ in
            self.dismiss(animated: false) {
                SplashViewController.instance = nil
            }
        }
    }
}

// Extension to convert hex string to UIColor
extension UIColor {
    convenience init?(hexString: String) {
        var hex = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if hex.hasPrefix("#") {
            hex.remove(at: hex.startIndex)
        }
        
        guard hex.count == 6 else {
            return nil
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&rgbValue)
        
        let r = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let b = CGFloat(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: r, green: g, blue: b, alpha: 1.0)
    }
}