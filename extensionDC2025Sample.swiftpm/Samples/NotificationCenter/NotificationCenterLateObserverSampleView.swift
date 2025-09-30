import SwiftUI

struct NotificationCenterLateObserverSampleView: View {
    let sample = NotificationCenterLateObserverSample()
    @State private var currentValue: Int = 1
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Current Value: \(currentValue)")
            
            Button("Send +1") {
                sample.send(["Value: \(currentValue)"])
                currentValue += 1
            }
            
            Button("Send Custom Message") {
                sample.send(["Custom message at \(Date())"])
            }
        }
        .navigationTitle("NotificationCenter")
    }
}
