import { NativeModules } from 'react-native'

const { UnionPay } = NativeModules

export const startPay = async (tn, mode = '00') => {
  const res = await UnionPay.startPay(tn, mode)
  if(res.code === 'success') {
    return res
  }
  throw res
}

export const isAppInstalled = (mode = '00', merId = '') => {
  return UnionPay.isAppInstalled(mode, merId)
}
