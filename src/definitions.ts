export interface NgeniusPaymentsPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
