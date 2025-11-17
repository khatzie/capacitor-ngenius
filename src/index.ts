import { registerPlugin } from '@capacitor/core';

import type { NgeniusPaymentsPlugin } from './definitions';

const NgeniusPayments = registerPlugin<NgeniusPaymentsPlugin>('NgeniusPayments', {
  web: () => import('./web').then((m) => new m.NgeniusPaymentsWeb()),
});

export * from './definitions';
export { NgeniusPayments };
