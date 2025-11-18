import { WebPlugin } from '@capacitor/core';

import type { NgeniusPaymentsPlugin, StartPaymentOptions, PaymentResult, CompletePaymentOptions, CompletePaymentResult } from './definitions';

export class NgeniusPaymentsWeb extends WebPlugin implements NgeniusPaymentsPlugin {
  async startPayment(_options: StartPaymentOptions): Promise<PaymentResult> {
    console.warn('startPayment is not supported on web');
    return { success: false, message: 'Web not supported' };
  }

  async completePayment(_options: CompletePaymentOptions): Promise<CompletePaymentResult> {
    console.warn('completePayment is not supported on web');
    return { success: false, message: 'Web not supported' };
  }
}

const NgeniusPayments = new NgeniusPaymentsWeb();
export { NgeniusPayments };
