export interface StartPaymentOptions {
  orderReference: string;
  amount: number;
  currency: string;
  token: string;
  isSandbox?: boolean;
}

export interface PaymentResult {
  success: boolean;
  paymentId?: string;
  message?: string;
}

export interface CompletePaymentOptions {
  orderReference: string;
}

export interface CompletePaymentResult {
  success: boolean;
  orderStatus?: string;
  message?: string;
}

export interface NgeniusPaymentsPlugin {
  startPayment(options: StartPaymentOptions): Promise<PaymentResult>;
  completePayment(options: CompletePaymentOptions): Promise<CompletePaymentResult>;
}
