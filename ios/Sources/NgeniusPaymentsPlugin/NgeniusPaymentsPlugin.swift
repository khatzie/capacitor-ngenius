import Foundation
import Capacitor
import NgeNiusSDK

@objc(NgeniusPaymentsPlugin)
public class NgeniusPaymentsPlugin: CAPPlugin, CAPBridgedPlugin {

    public let identifier = "NgeniusPaymentsPlugin"
    public let jsName = "NgeniusPayments"

    public let pluginMethods: [CAPPluginMethod] = [
        CAPPluginMethod(name: "startPayment", returnType: CAPPluginReturnPromise)
    ]

    private var savedCall: CAPPluginCall?

    @objc func startPayment(_ call: CAPPluginCall) {
        guard let orderReference = call.getString("orderReference"),
              let token = call.getString("token"),
              let amount = call.getDouble("amount"),
              let currency = call.getString("currency") else {
            call.reject("Missing required parameters")
            return
        }

        let isSandbox = call.getBool("isSandbox", true)

        savedCall = call

        DispatchQueue.main.async { [weak self] in
            self?.beginPayment(orderReference: orderReference,
                               token: token,
                               amount: amount,
                               currency: currency,
                               isSandbox: isSandbox)
        }
    }

    private func beginPayment(orderReference: String, token: String, amount: Double, currency: String, isSandbox: Bool) {

        let config = PaymentConfiguration(
            orderReference: orderReference,
            apiKey: token,
            amount: amount,
            currency: currency,
            isSandbox: isSandbox
        )

        guard let controller = UIApplication.shared.keyWindow?.rootViewController else {
            savedCall?.reject("Cannot find root view controller")
            return
        }

        NgeNius.shared.startPayment(from: controller, config: config) { [weak self] result in
            guard let self = self, let call = self.savedCall else { return }

            var response = JSObject()

            switch result {
            case .success(let paymentResponse):
                response["success"] = true
                response["paymentId"] = paymentResponse.paymentId
                response["message"] = paymentResponse.message
                call.resolve(response)

            case .failure(let error):
                response["success"] = false
                response["message"] = error.localizedDescription
                call.resolve(response)
            }
        }
    }
}
