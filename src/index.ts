import { registerPlugin } from '@capacitor/core';

import type { NGeniusPaymentsPlugin } from './definitions';

const NgeniusPayments = registerPlugin<NGeniusPaymentsPlugin>('NgeniusPayments', {
  web: () => import('./web').then((m) => new m.NgeniusPaymentsWeb()),
});

export * from './definitions';
export { NgeniusPayments };
