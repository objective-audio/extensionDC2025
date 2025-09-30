import SwiftUI

struct NotificationCenterEarlyObserverSampleView: View {
    let sample = NotificationCenterEarlyObserverSample()
    @State private var currentValue: Int = 1
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Current Value: \(currentValue)")
            
            Button("Send +1") {
                sample.send(["Value: \(currentValue)"])
                currentValue += 1
            }
            
            Button("Send Batch (10 notifications)") {
                let messages = (currentValue..<(currentValue + 10)).map { "Batch value: \($0)" }
                sample.send(messages)
                currentValue += 10
            }
        }
        .navigationTitle("NotificationCenter")
    }
}
