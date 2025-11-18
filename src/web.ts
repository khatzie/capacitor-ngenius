import { WebPlugin } from '@capacitor/core';

import type { NgeniusPaymentsPlugin } from './definitions';

export class NgeniusPaymentsWeb extends WebPlugin implements NgeniusPaymentsPlugin {
  async startPayment(_options: any): Promise<any> {
    console.warn('startPayment is not available on web.');
    return { status: 'failed', message: 'Not available on web' };
  }

  async completePayment(_options: any): Promise<any> {
    console.warn('completePayment is not available on web.');
    return { status: 'failed', message: 'Not available on web' };
  }
}
