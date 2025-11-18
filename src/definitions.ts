export interface CreatePaymentRequest {
  amount: number;
  currency: string;
  orderReference: string;
  token: string;
}

export interface NGeniusPaymentsPlugin {
  /**
   * Start a payment flow with N-Genius SDK
   * @param options
   */
  startPayment(options: {
    orderRef: string;
    amount: number;
    currency: string;
    token: string;
  }): Promise<{ status: string; transactionId?: string; message?: string }>;

  /**
   * Complete a payment (optional, if SDK requires)
   * @param options
   */
  completePayment(options: {
    orderRef: string;
  }): Promise<{ status: string; orderStatus?: string; message?: string }>;
}
