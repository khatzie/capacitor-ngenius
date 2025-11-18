import { registerPlugin } from '@capacitor/core';

import type { NGeniusPaymentsPlugin } from './definitions';

const NGeniousPayments = registerPlugin<NGeniusPaymentsPlugin>('NGeniousPayments');

export * from './definitions';
export { NGeniousPayments };
