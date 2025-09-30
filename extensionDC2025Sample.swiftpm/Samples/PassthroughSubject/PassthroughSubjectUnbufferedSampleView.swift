import SwiftUI

struct PassthroughSubjectUnbufferedSampleView: View {
    let sample = PassthroughSubjectUnbufferedSample()
    @State private var currentValue: Int = 0
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Current Value: \(currentValue)")
            
            Button("Send +1") {
                sample.send([currentValue])
                currentValue += 1
            }
            
            Button("Send Batch (10 values)") {
                sample.sendBatch()
            }
            
            Button("Finish Stream") {
                sample.finish()
            }
            .foregroundColor(.red)
        }
        .navigationTitle("PassthroughSubject")
    }
}
