export interface AnimatedSplashConfig {
  animation?: string;
  loop?: boolean;
  lightBackground?: string;
  darkBackground?: string;
}

export interface AnimatedSplashPlugin {
  hide(options?: { duration?: number }): Promise<void>;
}
