import { registerPlugin } from '@capacitor/core';

import type { NgeniusPaymentsPlugin } from './definitions';

const NGeniousPayments = registerPlugin<NgeniusPaymentsPlugin>('NgeniousPayments');

export * from './definitions';
export { NGeniousPayments };
