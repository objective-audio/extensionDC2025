import SwiftUI

struct NotificationCenterSampleView: View {
    @State private var sample: NotificationCenterSample?
    @State private var currentValue: Int = 0
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Current Value: \(currentValue)")
            
            Button("Send +1") {
                currentValue += 1
                sample?.sendNotificationWithValue(currentValue)
            }
            .disabled(sample == nil)
            
            Button("Send +10") {
                currentValue += 10
                sample?.sendNotificationWithValue(currentValue)
            }
            .disabled(sample == nil)
            
            Button("Send Custom Message") {
                sample?.sendNotification(message: "Custom message at \(Date())")
            }
            .disabled(sample == nil)
        }
        .navigationTitle("NotificationCenter")
        .onAppear {
            sample = NotificationCenterSample()
        }
        .onDisappear {
            sample = nil
        }
    }
}
