package com.khatzie.plugin.ngenius;

import android.app.Activity;
import android.content.Intent;

import androidx.annotation.Nullable;

import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;
import com.networkinternational.ngenius.NGeniusPaymentActivity;
import com.networkinternational.ngenius.model.NGeniusRequest;
import com.networkinternational.ngenius.model.NGeniusResponse;

@CapacitorPlugin(name = "NgeniusPayments")
public class NgeniusPaymentsPlugin extends Plugin {

    private static final int PAYMENT_REQUEST_CODE = 991;

    private PluginCall savedCall;

    @PluginMethod
    public void startPayment(PluginCall call) {
        Activity activity = getActivity();

        String orderReference = call.getString("orderReference");
        String outletId = call.getString("outletId");
        String apiKey = call.getString("apiKey");
        Boolean isSandbox = call.getBoolean("isSandbox", true);

        if (orderReference == null || outletId == null || apiKey == null) {
            call.reject("Missing required parameters");
            return;
        }

        savedCall = call;

        NGeniusRequest request = new NGeniusRequest();
        request.setOrderReference(orderReference);
        request.setOutletId(outletId);
        request.setApiKey(apiKey);
        request.setSandbox(isSandbox);

        Intent intent = new Intent(activity, NGeniusPaymentActivity.class);
        intent.putExtra("request", request);

        startActivityForResult(call, intent, PAYMENT_REQUEST_CODE);
    }

    @Override
    protected void handleOnActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
        super.handleOnActivityResult(requestCode, resultCode, data);

        if (requestCode != PAYMENT_REQUEST_CODE || savedCall == null) return;

        JSObject result = new JSObject();

        if (data != null) {
            NGeniusResponse response = (NGeniusResponse) data.getSerializableExtra("response");

            if (response != null) {
                result.put("success", response.isSuccess());
                result.put("paymentId", response.getPaymentId());
                result.put("message", response.getMessage());
                savedCall.resolve(result);
                return;
            }
        }

        result.put("success", false);
        result.put("message", "Payment cancelled or failed");
        savedCall.resolve(result);
    }
}
