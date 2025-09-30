import SwiftUI

struct AsyncStreamSampleView: View {
    let sample = AsyncStreamSample()
    @State private var currentValue: Int = 1
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Current Value: \(currentValue)")
            
            Button("Send +1") {
                sample.send([currentValue])
                currentValue += 1
            }
            
            Button("Send Batch (10 values)") {
                let batchValues = Array(currentValue..<(currentValue + 10))
                sample.send(batchValues)
                currentValue += 10
            }
            
            Button("Finish Stream") {
                sample.finish()
            }
            .foregroundColor(.red)
        }
        .navigationTitle("AsyncStream")
    }
}
