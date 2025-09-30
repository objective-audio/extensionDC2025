import SwiftUI

struct PassthroughSubjectUnbufferedSampleView: View {
    let sample = PassthroughSubjectUnbufferedSample()
    @State private var currentValue: Int = 0
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Current Value: \(currentValue)")
            
            Button("Send +1") {
                currentValue += 1
                sample.send(currentValue)
            }
            
            Button("Send +10") {
                currentValue += 10
                sample.send(currentValue)
            }
            
            Button("Finish Stream") {
                sample.finish()
            }
            .foregroundColor(.red)
            
            Button("Send Batch (10 values)") {
                sample.sendBatch()
            }
        }
        .navigationTitle("PassthroughSubject")
    }
}
