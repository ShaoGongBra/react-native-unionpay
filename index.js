import { NativeModules } from 'react-native'

const { QMF } = NativeModules

export const UPPay = (tn, serverMode = '00') => {
  QMF.UPPay(tn, serverMode)
}
