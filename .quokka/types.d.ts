declare module 'deep-map' {
  export interface DeepMapModule {
    <T>(object: any, mapFn: MapFn, options?: Opts): T;
    default<T>(object: any, mapFn: MapFn, options?: Opts): T;
  }
  export interface MapFn<T, U>(value: T, key: string | number): any
  export interface Opts {
    thisArg?: any;
    inPlace?: boolean;
  }
  export declare const deepMapModule: DeepMapModule;
  export = deepMapModule
}
