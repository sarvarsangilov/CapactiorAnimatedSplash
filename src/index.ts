import { registerPlugin } from '@capacitor/core';
import type { AnimatedSplashPlugin } from './definitions';

const AnimatedSplash = registerPlugin<AnimatedSplashPlugin>('AnimatedSplash', {
  web: () => import('./web').then((m) => new m.AnimatedSplashWeb()),
});

export * from './definitions';
export { AnimatedSplash };
