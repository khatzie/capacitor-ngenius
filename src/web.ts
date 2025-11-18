import { WebPlugin } from '@capacitor/core';

import type { NGeniusPaymentsPlugin } from './definitions';

export class NGeniusPaymentsWeb extends WebPlugin implements NGeniusPaymentsPlugin {
  async startPayment(_options: any): Promise<any> {
    console.warn('startPayment is not available on web.');
    return { status: 'failed', message: 'Not available on web' };
  }

  async completePayment(_options: any): Promise<any> {
    console.warn('completePayment is not available on web.');
    return { status: 'failed', message: 'Not available on web' };
  }
}
