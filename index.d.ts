/**
 * 云闪付支付
 * @param tn 支付单号
 * @param mode 环境模式 00 正式环境 01测试环境
 */
export function startPay(tn: string, mode: string): void;

/**
 * 判断云闪付APP是否安装
 * @param mode 环境模式 00 正式环境 01测试环境
 * @param merId 商户号
 */
export function isAppInstalled(mode: string, merId: string): void;
