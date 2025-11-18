import Foundation
import Capacitor
import NISdk  

@objc(NgeniusPaymentsPlugin)
public class NgeniusPaymentsPlugin: CAPPlugin, CAPBridgedPlugin {
    public let identifier = "NgeniusPaymentsPlugin"
    public let jsName = "NgeniusPayments"

    public let pluginMethods: [CAPPluginMethod] = [
        CAPPluginMethod(name: "startPayment", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "completePayment", returnType: CAPPluginReturnPromise),
    ]

    @objc func startPayment(_ call: CAPPluginCall) {
        guard let orderRef = call.getString("orderRef") else {
            call.reject("Missing orderRef")
            return
        }

        DispatchQueue.main.async {
            NISdk.sharedInstance().startCardPayment(orderRef, viewController: self.bridge?.viewController) { result in
                switch result {
                case .success(let response):
                    call.resolve([
                        "status": "success",
                        "response": response
                    ])
                case .failure(let error):
                    call.reject("Payment failed", nil, error)
                }
            }
        }
    }

    @objc func completePayment(_ call: CAPPluginCall) {
        guard let orderRef = call.getString("orderRef") else {
            call.reject("Missing orderRef")
            return
        }

        NISdk.sharedInstance().completePayment(orderRef) { result in
            switch result {
            case .success(let orderStatus):
                call.resolve([
                    "status": "completed",
                    "orderStatus": orderStatus
                ])
            case .failure(let error):
                call.reject("Failed to complete order", nil, error)
            }
        }
    }
}
