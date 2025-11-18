import { registerPlugin } from '@capacitor/core';

import type { NGeniousPaymentsPlugin } from './definitions';

const NGeniousPayments = registerPlugin<NGeniousPaymentsPlugin>('NGeniousPayments');

export * from './definitions';
export { NGeniousPayments };
