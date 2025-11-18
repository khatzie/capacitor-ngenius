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
* [Interfaces](#interfaces)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### startPayment(...)

```typescript
startPayment(options: StartPaymentOptions) => Promise<PaymentResult>
```

Start a payment flow with N-Genius SDK

| Param         | Type                                                                |
| ------------- | ------------------------------------------------------------------- |
| **`options`** | <code><a href="#startpaymentoptions">StartPaymentOptions</a></code> |

**Returns:** <code>Promise&lt;<a href="#paymentresult">PaymentResult</a>&gt;</code>

--------------------


### completePayment(...)

```typescript
completePayment(options: CompletePaymentOptions) => Promise<CompletePaymentResult>
```

Complete a payment (optional, if SDK requires)

| Param         | Type                                                                      |
| ------------- | ------------------------------------------------------------------------- |
| **`options`** | <code><a href="#completepaymentoptions">CompletePaymentOptions</a></code> |

**Returns:** <code>Promise&lt;<a href="#completepaymentresult">CompletePaymentResult</a>&gt;</code>

--------------------


### Interfaces


#### PaymentResult

| Prop            | Type                 |
| --------------- | -------------------- |
| **`success`**   | <code>boolean</code> |
| **`paymentId`** | <code>string</code>  |
| **`message`**   | <code>string</code>  |


#### StartPaymentOptions

| Prop                 | Type                 |
| -------------------- | -------------------- |
| **`orderReference`** | <code>string</code>  |
| **`amount`**         | <code>number</code>  |
| **`currency`**       | <code>string</code>  |
| **`token`**          | <code>string</code>  |
| **`isSandbox`**      | <code>boolean</code> |


#### CompletePaymentResult

| Prop              | Type                 |
| ----------------- | -------------------- |
| **`success`**     | <code>boolean</code> |
| **`orderStatus`** | <code>string</code>  |
| **`message`**     | <code>string</code>  |


#### CompletePaymentOptions

| Prop                 | Type                |
| -------------------- | ------------------- |
| **`orderReference`** | <code>string</code> |

</docgen-api>
