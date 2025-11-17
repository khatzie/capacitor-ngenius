import Foundation
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(NgeniusPaymentsPlugin)
public class NgeniusPaymentsPlugin: CAPPlugin, CAPBridgedPlugin {
    public let identifier = "NgeniusPaymentsPlugin"
    public let jsName = "NgeniusPayments"
    public let pluginMethods: [CAPPluginMethod] = [
        CAPPluginMethod(name: "echo", returnType: CAPPluginReturnPromise)
    ]
    private let implementation = NgeniusPayments()

    @objc func echo(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.resolve([
            "value": implementation.echo(value)
        ])
    }
}
