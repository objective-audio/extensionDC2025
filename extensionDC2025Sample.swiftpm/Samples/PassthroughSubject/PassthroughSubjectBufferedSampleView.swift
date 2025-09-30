import SwiftUI

struct PassthroughSubjectBufferedSampleView: View {
    let sample = PassthroughSubjectBufferedSample()
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
            
            Button("Send Batch (15 values)") {
                let values = Array(currentValue..<(currentValue + 15))
                sample.send(values)
                currentValue += 15
            }
            
            Button("Finish Stream") {
                sample.finish()
            }
            .foregroundColor(.red)
        }
        .navigationTitle("PassthroughSubject")
    }
}
