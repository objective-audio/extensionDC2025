import SwiftUI

struct PassthroughSubjectUnbufferedSampleView: View {
    let sample = PassthroughSubjectUnbufferedSample()
    @State private var currentValue: Int = 1
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Current Value: \(currentValue)")
            
            Button("Send +1") {
                sample.send([currentValue])
                currentValue += 1
            }
            
            Button("Send Batch (10 values)") {
                let values = Array(currentValue..<(currentValue + 10))
                sample.send(values)
                currentValue += 10
            }
            
            Button("Send Batch (10 values) with Yield") {
                let values = Array(currentValue..<(currentValue + 10))
                sample.send(values, wait: .yield)
                currentValue += 10
            }
            
            Button("Send Batch (10 values) with Sleep") {
                let values = Array(currentValue..<(currentValue + 10))
                sample.send(values, wait: .sleep(seconds: 0.1))
                currentValue += 10
            }
            
            Button("Finish Stream") {
                sample.finish()
            }
            .foregroundColor(.red)
        }
        .navigationTitle("PassthroughSubject")
    }
}
