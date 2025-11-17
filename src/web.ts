import { WebPlugin } from '@capacitor/core';

import type { NgeniusPaymentsPlugin } from './definitions';

export class NgeniusPaymentsWeb extends WebPlugin implements NgeniusPaymentsPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
