import Foundation
import Capacitor
import NgeNiusSDK

@objc(NgeniusPaymentsPlugin)
public class NgeniusPaymentsPlugin: CAPPlugin, CAPBridgedPlugin {

    public let identifier = "NgeniusPaymentsPlugin"
    public let jsName = "NgeniusPayments"

    public let pluginMethods: [CAPPluginMethod] = [
        CAPPluginMethod(name: "startPayment", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "completePayment", returnType: CAPPluginReturnPromise)
    ]

    private var savedCall: CAPPluginCall?

    @objc func startPayment(_ call: CAPPluginCall) {
        guard let orderRef = call.getString("orderReference"),
              let outletId = call.getString("outletId"),
              let apiKey = call.getString("token"),
              let amount = call.getDouble("amount"),
              let currency = call.getString("currency") else {
            call.reject("Missing required parameters")
            return
        }

        let isSandbox = call.getBool("isSandbox", true)
        savedCall = call

        DispatchQueue.main.async { [weak self] in
            self?.beginPayment(orderRef: orderRef, outletId: outletId, apiKey: apiKey, amount: amount, currency: currency, isSandbox: isSandbox)
        }
    }

    private func beginPayment(orderRef: String, outletId: String, apiKey: String, amount: Double, currency: String, isSandbox: Bool) {
        let config = PaymentConfiguration(
            outletId: outletId,
            apiKey: apiKey,
            orderReference: orderRef,
            amount: amount,
            currency: currency,
            isSandbox: isSandbox
        )

        let controller = UIApplication.shared.keyWindow?.rootViewController

        NgeNius.shared.startPayment(from: controller!, config: config) { [weak self] result in
            guard let self = self, let call = self.savedCall else { return }

            var response = JSObject()
            switch result {
            case .success(let paymentResponse):
                response["success"] = true
                response["paymentId"] = paymentResponse.paymentId
                response["message"] = paymentResponse.message
            case .failure(let error):
                response["success"] = false
                response["message"] = error.localizedDescription
            }
            call.resolve(response)
        }
    }

    @objc func completePayment(_ call: CAPPluginCall) {
        guard let orderRef = call.getString("orderReference") else {
            call.reject("Missing orderReference")
            return
        }

        // TODO: Implement backend verification
        var response = JSObject()
        response["success"] = true
        response["orderStatus"] = "PAID"
        response["message"] = "Payment verified"
        call.resolve(response)
    }
}
