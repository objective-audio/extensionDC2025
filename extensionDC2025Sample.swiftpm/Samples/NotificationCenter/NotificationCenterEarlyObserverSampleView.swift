import SwiftUI

struct NotificationCenterEarlyObserverSampleView: View {
    let sample = NotificationCenterEarlyObserverSample()
    @State private var currentValue: Int = 0
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Current Value: \(currentValue)")
            
            Button("Send +1") {
                currentValue += 1
                sample.sendNotification(intValue: currentValue)
            }
            
            Button("Send +10") {
                currentValue += 10
                sample.sendNotification(intValue: currentValue)
            }
            
            Button("Send Custom Message") {
                sample.sendNotification(message: "Custom message at \(Date())")
            }
            
            Button("Send Batch (10 notifications)") {
                sample.sendNotificationBatch()
            }
        }
        .navigationTitle("NotificationCenter")
    }
}
