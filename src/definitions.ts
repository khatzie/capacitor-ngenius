export interface StartPaymentOptions {
  orderReference: string;  // unique order ID
  amount: number;           // payment amount
  currency: string;         // currency code, e.g., "AED"
  token: string;            // N-Genius payment token / API key
  isSandbox?: boolean;      // optional, defaults to true
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
  /**
   * Start a payment flow with N-Genius SDK
   * @param options
   */
  startPayment(options: StartPaymentOptions): Promise<PaymentResult>;

  /**
   * Complete a payment (optional, if SDK requires)
   * @param options
   */
  completePayment(options: CompletePaymentOptions): Promise<CompletePaymentResult>;
}
