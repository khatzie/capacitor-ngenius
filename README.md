# capacitor-ngenius-payments

Capacitor plugin for N-Genius mobile SDK (iOS/Android)

## Install

```bash
npm install capacitor-ngenius-payments
npx cap sync
```

## Example Usage

```
import { NgeniusPayments } from 'capacitor-ngenius-payments';

async function pay() {
  const result = await NgeniusPayments.startPayment({
    orderReference: "12345",
    outletId: "your_outlet_id",
    apiKey: "your_api_key",
    isSandbox: true
  });

  console.log("Payment result:", result);
}

```

## API

<docgen-index>

* [`startPayment(...)`](#startpayment)
* [`completePayment(...)`](#completepayment)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### startPayment(...)

```typescript
startPayment(options: { orderRef: string; amount: number; currency: string; token: string; }) => Promise<{ status: string; transactionId?: string; message?: string; }>
```

Start a payment flow with N-Genius SDK

| Param         | Type                                                                                |
| ------------- | ----------------------------------------------------------------------------------- |
| **`options`** | <code>{ orderRef: string; amount: number; currency: string; token: string; }</code> |

**Returns:** <code>Promise&lt;{ status: string; transactionId?: string; message?: string; }&gt;</code>

--------------------


### completePayment(...)

```typescript
completePayment(options: { orderRef: string; }) => Promise<{ status: string; orderStatus?: string; message?: string; }>
```

Complete a payment (optional, if SDK requires)

| Param         | Type                               |
| ------------- | ---------------------------------- |
| **`options`** | <code>{ orderRef: string; }</code> |

**Returns:** <code>Promise&lt;{ status: string; orderStatus?: string; message?: string; }&gt;</code>

--------------------

</docgen-api>
