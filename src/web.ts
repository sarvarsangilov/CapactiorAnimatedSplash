import { WebPlugin } from '@capacitor/core';
import type { AnimatedSplashPlugin } from './definitions';

export class AnimatedSplashWeb extends WebPlugin implements AnimatedSplashPlugin {
  async hide(options?: { duration?: number }): Promise<void> {
    console.warn('AnimatedSplash: hide() is not supported on Web', options);
  }
}
