# capacitor-animated-splash

This plugin allows you to display a Lottie-based animated splash screen on Android with configurable animation, loop, and background colors for light/dark themes.

***Ios is not supported yet**

## Install

```bash
npm install capacitor-animated-splash
npx cap sync
```

## Configiration

Add the following code to: `android\app\src\main\java\ionic\<your-package>\MainActivity.java`

```java
import android.os.Bundle;
import android.content.Intent;
import com.sangilov.plugins.animatedsplash.SplashActivity; // <-- Important

public class MainActivity extends BridgeActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        Intent intent = new Intent(this, SplashActivity.class);
        intent.putExtra("animation", "splash.json"); // path to lottie animation json file
        intent.putExtra("loop", false); // loop animation
        intent.putExtra("lightBackground", "#FFFFFF"); // background for light theme
        intent.putExtra("darkBackground", "#000000"); // background for dark theme
        startActivity(intent);

        super.load();
    }
}
```

Add this activity to: `android\app\src\main\AndroidManifest.xml`

```xml
<activity
    android:name="com.sangilov.plugins.animatedsplash.SplashActivity"
    android:exported="true"
    android:theme="@android:style/Theme.Translucent.NoTitleBar.Fullscreen"
    android:screenOrientation="portrait" 
/>
```

**Lottie JSON file location**

* Place your splash.json in: `android/app/src/main/assets/`

*  The filename should match the "animation" value in MainActivity.java.

## API

<docgen-index>

* [`hide(...)`](#hide)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### hide(...)

```typescript
hide(options?: { duration?: number | undefined; } | undefined) => Promise<void>
```

| Param         | Type                                |
| ------------- | ----------------------------------- |
| **`options`** | <code>{ duration?: number; }</code> |

--------------------

</docgen-api>
