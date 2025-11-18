export interface CreatePaymentRequest {
  amount: number;
  currency: string;
  orderReference: string;
  token: string;
}

export interface NGeniousPaymentsPlugin {
  startPayment(options: CreatePaymentRequest): Promise<{ status: string, transactionId: string }>;
}

